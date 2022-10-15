-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

closeMenu = function()
    RenderScriptCams(false, false, 0, true, true)
    DestroyAllCams(true)
    DisplayRadar(true)
    SetNuiFocus(false, false)
    SetEntityInvincible(PlayerPedId(), false)

    SetNuiFocus(false, false)
    SendNUIMessage{
        type = 'appearance_hide',
        payload = {}
    }
end

addCommas = function(n)
	return tostring(math.floor(n)):reverse():gsub("(%d%d%d)","%1,")
								  :gsub(",(%-?)$","%1"):reverse()
end

createBlip = function(coords, sprite, colour, text, scale)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, colour)
    SetBlipAsShortRange(blip, true)
    SetBlipScale(blip, scale)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
end

consolidateShops = function()
    local shops = {}
    for _,v in ipairs(Config.ClothingShops) do
        shops[#shops + 1] = {coords = v.coords, distance = v.distance, price = v.price, store = 'clothing'}
    end
    for _,v in ipairs(Config.BarberShops) do
        shops[#shops + 1] = {coords = v.coords, distance = v.distance, price = v.price, store = 'barber'}
    end
    for _,v in ipairs(Config.TattooShops) do
        shops[#shops + 1] = {coords = v.coords, distance = v.distance, price = v.price, store = 'tattoo'}
    end
    return shops
end

showTextUI = function(store)
    if store == 'clothing' then
        store = Strings.clothing_menu
    elseif store == 'barber' then
        store = Strings.barber_menu
    else
        store = Strings.tattoo_menu
    end
    return store
end

openShop = function(store, price)
    local ped = cache.ped
    local currentAppearance = exports['fivem-appearance']:getPedAppearance(ped)
    local config = {}
    InMenu = true
    if store == 'clothing' then
        TriggerEvent('fivem-appearance:clothingShop', price)
    else
        if store == 'clothing_menu' then 
            config = {
                ped = false,
                headBlend = false,
                faceFeatures = false,
                headOverlays = false,
                components = true,
                props = true
            }
        elseif store == 'barber' then
            config = {
                ped = false,
                headBlend = true,
                faceFeatures = true,
                headOverlays = true,
                components = false,
                props = false,
                tattoos = false
            }
        elseif store == 'tattoo' then 
            config = {
                ped = false,
                headBlend = false,
                faceFeatures = false,
                headOverlays = false,
                components = false,
                props = false,
                tattoos = true
            }
        end
        exports['fivem-appearance']:startPlayerCustomization(function (appearance)
            if (appearance) then
                if price then
                    local paid = lib.callback.await('fivem-appearance:payFunds', 100, price)                    
                    if paid then
                        lib.notify({
                            title = Strings.success,
                            description = (Strings.success_desc):format(addCommas(price)),
                            duration = 3500,
                            icon = 'basket-shopping',
                            type = 'success'
                        })
                        TriggerServerEvent('fivem-appearance:save', appearance)
                        InMenu = false
                        TriggerEvent('esx:restoreLoadout')
                        ESX.SetPlayerData('ped', PlayerPedId())
                    else
                        lib.notify({
                            title = Strings.no_funds,
                            description = Strings.no_funds_desc,
                            duration = 3500,
                            icon = 'ban',
                            type = 'error'
                        })                           
                        exports['fivem-appearance']:setPlayerAppearance(currentAppearance)
                        InMenu = false
                        TriggerServerEvent('fivem-appearance:save',currentAppearance)
                        TriggerEvent('esx:restoreLoadout')
                        ESX.SetPlayerData('ped', PlayerPedId())
                    end
                else
                    TriggerServerEvent('fivem-appearance:save', appearance)
                    InMenu = false
                    TriggerEvent('esx:restoreLoadout')
                    ESX.SetPlayerData('ped', PlayerPedId())
                end
            else
                TriggerEvent('esx:restoreLoadout')
                ESX.SetPlayerData('ped', PlayerPedId())
                inMenu = false
            end
        end, config)
    end
end

openWardrobe = function()
    local outfits = lib.callback.await('fivem-appearance:getOutfits', 100)
    local Options = {}
    if outfits then
        Options = {}
        for i=1, #outfits do
            outfits[#outfits + 1] = {
                title = outfits[i].name,
                event = 'fivem-appearance:setOutfit',
                args = {
                    ped = outfits[i].ped,
                    components = outfits[i].components,
                    props = outfits[i].props
                }
            }
        end
    else
        Options = {
            {
                title = Strings.go_back_desc,
                event = ''
            }
        }
    end
    lib.registerContext({
        id = 'wardrobe_menu',
        title = Strings.wardrobe_title,
        options = Options
    })
    lib.showContext('wardrobe_menu')
end

exports('openWardrobe', openWardrobe)

-- ESX Skin/Skin Changer compatibility
convertClothes = function(outfit)
    local data = {
        Components = {
            { drawable = outfit.mask_1 or 0, texture = outfit.mask_2 or 0, component_id = 1 },
            { drawable = outfit.arms or 0, texture = outfit.arms_2 or 0, component_id = 3 },
            { drawable = outfit.pants_1 or 0, texture = outfit.pants_2 or 0, component_id = 4 },
            { drawable = outfit.shoes_1 or 0, texture = outfit.shoes_2 or 0, component_id = 6 },
            { drawable = outfit.chain_1 or 0, texture = outfit.chain_2 or 0, component_id = 7 },
            { drawable = outfit.tshirt_1 or 0, texture = outfit.tshirt_2 or 0, component_id = 8 },
            { drawable = outfit.bproof_1 or 0, texture = outfit.bproof_2 or 0, component_id = 9 },
            { drawable = outfit.decals_1 or 0, texture = outfit.decals_2 or 0, component_id = 10 },
            { drawable = outfit.torso_1 or 0, texture = outfit.torso_2 or 0, component_id = 11 },
        },
        Props = {
            { drawable = outfit.helmet_1 or -1, texture = outfit.helmet_2 or 0, prop_id = 0 },
            { drawable = outfit.glasses_1 or -1, texture = outfit.glasses_2 or 0, prop_id = 1 },
            { drawable = outfit.ears_1 or -1, texture = outfit.ears_2 or 0, prop_id = 2 },
            { drawable = outfit.watches_1 or -1, texture = outfit.watches_2 or 0, prop_id = 6 },
            { drawable = outfit.bracelets_1 or -1, texture = outfit.bracelets_2 or 0, prop_id = 7 },
        }
    }
    return data
end