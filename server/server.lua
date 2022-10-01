-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

ESX = exports["es_extended"]:getSharedObject()

MySQL.ready(function()
	MySQL.Sync.execute(
		"CREATE TABLE IF NOT EXISTS `outfits` (" ..
			"`id` int NOT NULL AUTO_INCREMENT, " ..
			"`identifier` varchar(60) NOT NULL, " ..
			"`name` longtext, " ..
			"`ped` longtext, " ..
			"`components` longtext, " ..
			"`props` longtext, " ..
			"PRIMARY KEY (`id`), " ..
			"UNIQUE KEY `id_UNIQUE` (`id`) " ..
		") ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8; "
	)
end)

RegisterServerEvent('fivem-appearance:save')
AddEventHandler('fivem-appearance:save', function(appearance)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.execute('UPDATE users SET skin = @skin WHERE identifier = @identifier', {
		['@skin'] = json.encode(appearance),
		['@identifier'] = xPlayer.identifier
	})
end)

ESX.RegisterServerCallback('fivem-appearance:getPlayerSkin', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll('SELECT skin FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(users)
		local user, appearance = users[1]
		if user.skin then
			appearance = json.decode(user.skin)
		end
		cb(appearance)
	end)
end)

RegisterServerEvent("fivem-appearance:saveOutfit")
AddEventHandler("fivem-appearance:saveOutfit", function(name, pedModel, pedComponents, pedProps)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.insert('INSERT INTO `outfits` (`identifier`, `name`, `ped`, `components`, `props`) VALUES (@identifier, @name, @ped, @components, @props)', {
		['@ped'] = json.encode(pedModel),
		['@components'] = json.encode(pedComponents),
		['@props'] = json.encode(pedProps),
		['@name'] = name,
		['@identifier'] = xPlayer.identifier
	})
end)

ESX.RegisterServerCallback('fivem-appearance:getOutfits', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local outfits = {}
    MySQL.Async.fetchAll('SELECT id, name, ped, components, props FROM outfits WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		for i=1, #result, 1 do
			table.insert(outfits, {id = result[i].id, name = result[i].name, ped = json.decode(result[i].ped), components = json.decode(result[i].components), props = json.decode(result[i].props)})
		end
        if outfits then
		    cb(outfits)
        else
            cb(false)
        end
	end)
end)

RegisterServerEvent("fivem-appearance:deleteOutfit")
AddEventHandler("fivem-appearance:deleteOutfit", function(id)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.execute('DELETE FROM `outfits` WHERE `id` = @id', {
		['@id'] = id
	})
end)

-- ESX Skin Compatibility

getGender = function(model)
    if model == 'mp_f_freemode_01' then
        return 1
    else
        return 0
    end
end

ESX.RegisterServerCallback('esx_skin:getPlayerSkin', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll('SELECT skin FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(users)
		local user, appearance = users[1]
		local jobSkin = {
			skin_male   = xPlayer.job.skin_male,
			skin_female = xPlayer.job.skin_female
		}
		if user.skin then
			appearance = json.decode(user.skin)
		end
		appearance.sex = getGender(appearance.model)
		cb(appearance, jobSkin)
	end)
end)

ESX.RegisterServerCallback('fivem-appearance:payfee', function(soruce, cb, param)
    local xPlayer = ESX.GetPlayerFromId(soruce)
    local money = xPlayer.getMoney()

    if param then
        local cost = Config.Price[param]
        if money >= cost then
            if cost > 0 then
                xPlayer.removeMoney(cost)
            end
            cb(true)
        else
            xPlayer.showNotification("You need $"..cost.." money in your pocket.",5000,'success')
            cb(false)
        end
    end
end)

ESX.RegisterCommand('skin', 'admin', function(xPlayer, args, showError)
	args.playerId.triggerEvent('fivem-appearance:skinCommand')
end, false, {help = 'Change Skin', validate = true, arguments = {
	{name = 'playerId', help = 'Player ID', type = 'player'}
}})
