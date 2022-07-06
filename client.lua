-----------------For support, scripts, and more----------------
----------------- https://discord.gg/XJFNyMy3Bv ---------------
---------------------------------------------------------------

local savedOutfits = {}
local LastZone, CurrentAction, hasAlreadyEnteredMarker = nil, nil, false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
	ESX.PlayerLoaded = false
	ESX.PlayerData = {}
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

-- Blips

CreateBlip = function(coords, sprite, colour, text, scale)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, colour)
    SetBlipAsShortRange(blip, true)
    SetBlipScale(blip, scale)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
end

CreateThread(function()
    for i=1, #Config.ClothingShops do
        if Config.ClothingShops[i].blip then
            CreateBlip(Config.ClothingShops[i].coords, 73, 47, 'Clothing Shop', 0.7)
        end
    end
    for i=1, #Config.BarberShops do
        if Config.BarberShops[i].blip then
            CreateBlip(Config.BarberShops[i].coords, 71, 47, 'Barber Shop', 0.7)
        end
    end
    for i=1, #Config.TattooShops do
        if Config.TattooShops[i].blip then
            CreateBlip(Config.TattooShops[i].coords, 75, 1, 'Tattoo Shop', 0.7)
        end
    end
end)

CreateThread(function()
    while true do
        local sleep = 1500
        local playerCoords, inClothingShop, inBarberShop, inTattooShop, currentZone = GetEntityCoords(PlayerPedId()), false, false, false, nil

        for i=1, #Config.ClothingShops do
            local dist = #(playerCoords - Config.ClothingShops[i].coords)
            if dist <= Config.Distance then
                sleep = 0
                if dist <= Config.ClothingShops[i].distance then
                    inClothingShop, currentZone = true, i
                end
            end
        end

        for i=1, #Config.BarberShops do
            local dist = #(playerCoords - Config.BarberShops[i].coords)
            if dist <= Config.Distance then
                sleep = 0
                if dist <= Config.BarberShops[i].distance then
                    inBarberShop, currentZone = true, i
                end
            end
        end

        for i=1, #Config.TattooShops do
            local dist = #(playerCoords - Config.TattooShops[i].coords)
            if dist <= Config.Distance then
                sleep = 0
                if dist <= Config.TattooShops[i].distance then
                    inTattooShop, currentZone = true, i
                end
            end
        end

        if (inClothingShop and not hasAlreadyEnteredMarker) or (inClothingShop and LastZone ~= currentZone) then
            hasAlreadyEnteredMarker, LastZone = true, currentZone
            CurrentAction = 'clothingMenu'
            lib.showTextUI('[E] - Change Clothing')
        end

        if (inBarberShop and not hasAlreadyEnteredMarker) or (inBarberShop and LastZone ~= currentZone) then
            hasAlreadyEnteredMarker, LastZone = true, currentZone
            CurrentAction = 'barberMenu'
            lib.showTextUI('[E] - Change Hair/Face')
        end

        if (inTattooShop and not hasAlreadyEnteredMarker) or (inTattooShop and LastZone ~= currentZone) then
            hasAlreadyEnteredMarker, LastZone = true, currentZone
            CurrentAction = 'tattooMenu'
            lib.showTextUI('[E] - Change Tattoos')
        end

        if not inClothingShop and not inBarberShop and not inTattooShop and hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = false
            sleep = 1000
            CurrentAction = nil
            lib.hideTextUI()
        end
        Wait(sleep)
    end
end)

CreateThread(function()
    while true do
        local sleep = 1500
        if CurrentAction ~= nil then
            sleep = 0
            if IsControlPressed(1, 38) then
                Wait(500)
                if CurrentAction == 'clothingMenu' then
                    TriggerEvent('fivem-appearance:clothingShop')
                elseif CurrentAction == 'barberMenu' then
                    local config = {
                        ped = false,
                        headBlend = true,
                        faceFeatures = true,
                        headOverlays = true,
                        components = false,
                        props = false,
                        tattoos = false
                    }
                    exports['fivem-appearance']:startPlayerCustomization(function (appearance)
						if (appearance) then
							TriggerServerEvent('fivem-appearance:save', appearance)
							ESX.SetPlayerData('ped', PlayerPedId())
						else
							ESX.SetPlayerData('ped', PlayerPedId())
						end
					end, config)
                elseif CurrentAction == 'tattooMenu' then
                    local config = {
						ped = false,
						headBlend = false,
						faceFeatures = false,
						headOverlays = false,
						components = false,
						props = false,
						tattoos = true
					}
                    exports['fivem-appearance']:startPlayerCustomization(function (appearance)
						if (appearance) then
							TriggerServerEvent('fivem-appearance:save', appearance)
							ESX.SetPlayerData('ped', PlayerPedId())
						else
							ESX.SetPlayerData('ped', PlayerPedId())
						end
					end, config)
                end
            end
        end
        Wait(sleep)
    end
end)

RegisterNetEvent('fivem-appearance:clothingShop', function()
	lib.registerContext({
		id = 'clothing_menu',
		title = 'Wardrobe Menu',
		options = {
			{
				title = 'Change Clothing',
				description = 'Browse avaliable clothing',
				arrow = false,
				event = 'fivem-appearance:clothingMenu',
			},
			{
				title = 'Browse Outfits',
				description = 'Browse saved outfits',
				arrow = false,
				event = 'fivem-appearance:pickNewOutfit'
			},
			{
				title = 'Save Outfit',
				description = 'Save current outfit',
				arrow = false,
				event = 'fivem-appearance:saveOutfit'
			},
			{
				title = 'Delete Outfits',
				description = 'Browse saved outfits',
				arrow = false,
				event = 'fivem-appearance:deleteOutfitMenu'
			},
		}
	})
	lib.showContext('clothing_menu')
end)

RegisterNetEvent('fivem-appearance:clothingMenu', function()
	local config = {
		ped = false,
		headBlend = false,
		faceFeatures = false,
		headOverlays = false,
		components = true,
		props = true
	}
	exports['fivem-appearance']:startPlayerCustomization(function (appearance)
		if (appearance) then
			TriggerServerEvent('fivem-appearance:save', appearance)
			ESX.SetPlayerData('ped', PlayerPedId()) -- Fix for esx legacy
		else
			ESX.SetPlayerData('ped', PlayerPedId()) -- Fix for esx legacy
		end
	end, config)
end)

RegisterNetEvent('fivem-appearance:pickNewOutfit', function()
    ESX.TriggerServerCallback('fivem-appearance:getOutfits', function(cb)
        local Options = {}
        if cb then
            Options = {
                {
                    title = '< Go Back',
                    event = 'fivem-appearance:clothingShop'
                }
            }
            for i=1, #cb do
                table.insert(Options, {
                    title = cb[i].name,
                    event = 'fivem-appearance:setOutfit',
                    args = {
                        ped = cb[i].ped, 
						components = cb[i].components, 
						props = cb[i].props
                    }
                })
            end
        else
            Options = {
                {
                    title = '< Go Back',
                    description = 'No Saved Outfits!',
                    event = 'fivem-appearance:clothingShop'
                }
            }
        end
        lib.registerContext({
            id = 'outfit_menu',
            title = 'Saved Outfits',
            options = Options
        })
        lib.showContext('outfit_menu')
    end)
end)

RegisterNetEvent('fivem-appearance:setOutfit')
AddEventHandler('fivem-appearance:setOutfit', function(data)
	local pedModel = data.ped
	local pedComponents = data.components
	local pedProps = data.props
	local playerPed = PlayerPedId()
	local currentPedModel = exports['fivem-appearance']:getPedModel(playerPed)
	if currentPedModel ~= pedModel then
    	exports['fivem-appearance']:setPlayerModel(pedModel)
		Wait(500)
		playerPed = PlayerPedId()
		exports['fivem-appearance']:setPedComponents(playerPed, pedComponents)
		exports['fivem-appearance']:setPedProps(playerPed, pedProps)
		local appearance = exports['fivem-appearance']:getPedAppearance(playerPed)
		TriggerServerEvent('fivem-appearance:save', appearance)
		ESX.SetPlayerData('ped', PlayerPedId())
	else
		exports['fivem-appearance']:setPedComponents(playerPed, pedComponents)
		exports['fivem-appearance']:setPedProps(playerPed, pedProps)
		local appearance = exports['fivem-appearance']:getPedAppearance(playerPed)
		TriggerServerEvent('fivem-appearance:save', appearance)
		ESX.SetPlayerData('ped', PlayerPedId())
	end
end)

RegisterNetEvent('fivem-appearance:saveOutfit', function()
    local input = lib.inputDialog('Save Outfit', {'Outfit Name'})
    if input then
        local name = input[1]
        local playerPed = PlayerPedId()
        local pedModel = exports['fivem-appearance']:getPedModel(playerPed)
        local pedComponents = exports['fivem-appearance']:getPedComponents(playerPed)
        local pedProps = exports['fivem-appearance']:getPedProps(playerPed)
        TriggerServerEvent('fivem-appearance:saveOutfit', name, pedModel, pedComponents, pedProps)
    end
end)

RegisterNetEvent('fivem-appearance:deleteOutfitMenu', function()
    ESX.TriggerServerCallback('fivem-appearance:getOutfits', function(cb)
        local Options = {}
        if cb then
            Options = {
                {
                    title = '< Go Back',
                    event = 'fivem-appearance:clothingShop'
                }
            }
            for i=1, #cb do
                table.insert(Options, {
                    title = cb[i].name,
                    serverEvent = 'fivem-appearance:deleteOutfit',
                    args = cb[i].id
                })
            end
        else
            Options = {
                {
                    title = '< Go Back',
                    description = 'No Saved Outfits!',
                    event = 'fivem-appearance:clothingShop'
                }
            }
        end
        lib.registerContext({
            id = 'outfit_delete_menu',
            title = 'Delete Outfits',
            options = Options
        })
        lib.showContext('outfit_delete_menu')
    end)
end)

RegisterCommand('propfix', function()
    for k, v in pairs(GetGamePool('CObject')) do
        if IsEntityAttachedToEntity(PlayerPedId(), v) then
            SetEntityAsMissionEntity(v, true, true)
            DeleteObject(v)
            DeleteEntity(v)
        end
    end
end)

-- esx_skin and skinchanger compatibility
RegisterNetEvent('skinchanger:loadSkin')
AddEventHandler('skinchanger:loadSkin', function(skin, cb)
	if not skin.model then skin.model = 'mp_m_freemode_01' end
	exports['fivem-appearance']:setPlayerAppearance(skin)
	if cb ~= nil then
		cb()
	end
end)

RegisterNetEvent('esx_skin:openSaveableMenu')
AddEventHandler('esx_skin:openSaveableMenu', function(submitCb, cancelCb)
	local config = {
		ped = true,
		headBlend = true,
		faceFeatures = true,
		headOverlays = true,
		components = true,
		props = true
	}
	exports['fivem-appearance']:startPlayerCustomization(function (appearance)
		if (appearance) then
			TriggerServerEvent('fivem-appearance:save', appearance)
			ESX.SetPlayerData('ped', PlayerPedId())
			if submitCb then submitCb() end
		else
			if cancelCb then cancelCb() end
			ESX.SetPlayerData('ped', PlayerPedId())
		end
	end, config)
end)
