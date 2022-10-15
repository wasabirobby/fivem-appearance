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

-- Events

RegisterServerEvent('fivem-appearance:save')
AddEventHandler('fivem-appearance:save', function(appearance)
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.update('UPDATE users SET skin = ? WHERE identifier = ?', {json.encode(appearance), xPlayer.identifier})
end)

RegisterServerEvent("fivem-appearance:saveOutfit")
AddEventHandler("fivem-appearance:saveOutfit", function(name, pedModel, pedComponents, pedProps)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.insert.await('INSERT INTO outfits (identifier, name, ped, components, props) VALUES (?, ?, ?, ?, ?)', {xPlayer.identifier, name, json.encode(pedModel), json.encode(pedComponents), json.encode(pedProps)})
end)

RegisterServerEvent("fivem-appearance:deleteOutfit")
AddEventHandler("fivem-appearance:deleteOutfit", function(id)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.execute('DELETE FROM `outfits` WHERE `id` = @id', {
		['@id'] = id
	})
end)

-- Callbacks

lib.callback.register('fivem-appearance:getPlayerSkin', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local users = MySQL.query.await('SELECT skin FROM outfits users identifier = ?', {xPlayer.identifier})
	if users then
		local user, appearance = users[1]
		if user.skin then
			appearance = json.decode(user.skin)
		end
	end
	return appearance
end)

lib.callback.register('fivem-appearance:payFunds', function(source, price)
    local xPlayer = ESX.GetPlayerFromId(source)
	local xAccountMoney = xPlayer.getAccount(Config.PaymentAccount).money 
	if xAccountMoney < price then 
		return false 
	else
		xPlayer.removeAccountMoney(Config.PaymentAccount, price)
		return true
	end
end)

lib.callback.register('fivem-appearance:getOutfits', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    local outfits = {}
    local result = MySQL.query.await('SELECT * FROM outfits WHERE identifier = ?', {xPlayer.identifier})
	if result then
		for i=1, #result, 1 do
			outfits[#outfits + 1] = {
				id = result[i].id,
				name = result[i].name,
				ped = json.decode(result[i].ped),
				components = json.decode(result[i].components),
				props = json.decode(result[i].props)
			}
		end
		return outfits
	else
		return false
	end
end)

-- Commands
ESX.RegisterCommand('skin', 'admin', function(xPlayer, args, showError)
	args.playerId.triggerEvent('fivem-appearance:skinCommand')
end, false, {help = Strings.skin_command_help, validate = true, arguments = {
	{name = 'playerId', help = Strings.skin_command_arg_help, type = 'player'}
}})

-- esx_skin/skinchanger compatibility
getGender = function(model)
    if model == 'mp_f_freemode_01' then
        return 1
    else
        return 0
    end
end

ESX.RegisterServerCallback('esx_skin:getPlayerSkin', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local users = MySQL.query.await('SELECT skin FROM users WHERE identifier = ?', {xPlayer.identifier})
	if users then
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
	end
end)
