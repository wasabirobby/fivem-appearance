-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

RegisterCommand('skinConvert', function(source, args, raw)
	if source == 0 then
		TriggerEvent("fivem-appearance:convert")
	end
end)

RegisterServerEvent("fivem-appearance:convert")
AddEventHandler("fivem-appearance:convert", function()
	MySQL.Async.fetchAll("SELECT * FROM users",{},function(data)
		for k,v in pairs(data) do
			local tempSkin = nil
			local tempID = v.identifier
			local newSkin = json.decode('{"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":0},{"component_id":3,"texture":0,"drawable":0},{"component_id":4,"texture":0,"drawable":0},{"component_id":5,"texture":0,"drawable":0},{"component_id":6,"texture":0,"drawable":0},{"component_id":7,"texture":0,"drawable":0},{"component_id":8,"texture":0,"drawable":0},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":11,"texture":0,"drawable":0}],"headBlend":{"shapeSecond":0,"skinMix":1.0,"shapeMix":1.0,"skinFirst":0,"shapeFirst":0,"skinSecond":0},"headOverlays":{"moleAndFreckles":{"style":0,"opacity":0,"color":0},"ageing":{"style":0,"opacity":0,"color":0},"sunDamage":{"style":0,"opacity":0,"color":0},"makeUp":{"style":0,"opacity":0,"color":0},"blemishes":{"style":0,"opacity":0,"color":0},"chestHair":{"style":0,"opacity":0,"color":0},"blush":{"style":0,"opacity":0,"color":0},"complexion":{"style":0,"opacity":0,"color":0},"beard":{"style":0,"opacity":0,"color":0},"eyebrows":{"style":0,"opacity":0,"color":0},"bodyBlemishes":{"style":0,"opacity":0,"color":0},"lipstick":{"style":0,"opacity":0,"color":0}},"model":"mp_m_freemode_01","tattoos":[],"hair":{"style":0,"color":0,"highlight":0},"faceFeatures":{"nosePeakHigh":0,"cheeksBoneWidth":0,"chinBoneLenght":0,"cheeksBoneHigh":0,"neckThickness":0,"jawBoneBackSize":0,"eyesOpening":0,"jawBoneWidth":0,"cheeksWidth":0,"noseBoneHigh":0,"eyeBrownHigh":0,"chinHole":0,"lipsThickness":0,"chinBoneSize":0,"chinBoneLowering":0,"nosePeakLowering":0,"eyeBrownForward":0,"noseWidth":0,"nosePeakSize":0,"noseBoneTwist":0},"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"eyeColor":-1}')

			for k2,v2 in pairs(v) do
				if k2 == "skin" then
					tempSkin = json.decode(v2)

					for nck,ncv in pairs(newSkin.components) do

						if nck == 2 then
							ncv.drawable = tempSkin.mask_1
							ncv.texture = tempSkin.mask_2
						elseif nck == 4 then
							ncv.drawable = tempSkin.arms
							ncv.texture = tempSkin.arms_2
						elseif nck == 5 then
							ncv.drawable = tempSkin.pants_1
							ncv.texture = tempSkin.pants_2
						elseif nck == 6 then
							ncv.drawable = tempSkin.bags_1
							ncv.texture = tempSkin.bags_2
						elseif nck == 7 then
							ncv.drawable = tempSkin.shoes_1
							ncv.texture = tempSkin.shoes_2
						elseif nck == 8 then
							ncv.drawable = tempSkin.chain_1
							ncv.texture = tempSkin.chain_2
						elseif nck == 9 then
							ncv.drawable = tempSkin.tshirt_1
							ncv.texture = tempSkin.tshirt_2
						elseif nck == 10 then
							ncv.drawable = tempSkin.bproof_1
							ncv.texture = tempSkin.bproof_2
						elseif nck == 11 then
							ncv.drawable = tempSkin.decals_1
							ncv.texture = tempSkin.decals_2
						elseif nck == 12 then
							ncv.drawable = tempSkin.torso_1
							ncv.texture = tempSkin.torso_2
						end
					end

					for nhok,nhov in pairs(newSkin.headOverlays) do

						if nhok == "blemishes" then
							nhov.style = tempSkin.blemishes_1
							nhov.opacity = tempSkin.blemishes_2
						elseif nhok == "beard" then
							nhov.style = tempSkin.beard_1
							nhov.opacity = tempSkin.beard_2
						elseif nhok == "eyebrows" then
							nhov.style = tempSkin.eyebrows_1
							nhov.opacity = tempSkin.eyebrows_2
						elseif nhok == "ageing" then
							nhov.style = tempSkin.age_1
							nhov.opacity = tempSkin.age_2
						elseif nhok == "makeUp" then
							nhov.style = tempSkin.makeup_1
							nhov.opacity = tempSkin.makeup_2
							nhov.color = tempSkin.makeup_3
						elseif nhok == "blush" then
							nhov.style = tempSkin.blush_1
							nhov.opacity = tempSkin.blush_2
							nhov.color = tempSkin.blush_3
						elseif nhok == "complexion" then
							nhov.style = tempSkin.complexion_1
							nhov.opacity = tempSkin.complexion_2
						elseif nhok == "sunDamage" then
							nhov.style = tempSkin.sun_1
							nhov.opacity = tempSkin.sun_2
						elseif nhok == "lipstick" then
							nhov.style = tempSkin.lipstick_1
							nhov.opacity = tempSkin.lipstick_2
							nhov.color = tempSkin.lipstick_3
						elseif nhok == "moleAndFreckles" then
							nhov.style = tempSkin.moles_1
							nhov.opacity = tempSkin.moles_2
						elseif nhok == "chestHair" then
							nhov.style = tempSkin.chest_1
							nhov.opacity = tempSkin.chest_2
							nhov.color = tempSkin.chest_3
						elseif nhok == "bodyBlemishes" then
							nhov.style = tempSkin.bodyb_1
							nhov.opacity = tempSkin.bodyb_2
						end
					end

					for npk,npv in pairs(newSkin.props) do
						if npk == 1 then
							npv.drawable = tempSkin.helmet_1
							npv.texture = tempSkin.helmet_2
						elseif npk == 2 then
							npv.drawable = tempSkin.glasses_1
							npv.texture = tempSkin.glasses_2
						elseif npk == 3 then
							npv.drawable = tempSkin.ears_1
							npv.texture = tempSkin.ears_2
						elseif npk == 4 then
							npv.drawable = tempSkin.watches_1
							npv.texture = tempSkin.watches_2
						elseif npk == 5 then
							npv.drawable = tempSkin.bracelets_1
							npv.texture = tempSkin.bracelets_2
						end
					end
				end
			end

			newSkin.eyeColor = tempSkin.eye_color
			newSkin.headBlend.shapeSecond =  tempSkin.face
			newSkin.headBlend.skinFirst =  tempSkin.skin
			newSkin.headBlend.shapeFirst =  tempSkin.face
			newSkin.headBlend.skinSecond =  tempSkin.skin

			newSkin.hair.style = tempSkin.hair_1
			newSkin.hair.color = tempSkin.hair_color_1
			newSkin.hair.highlight = tempSkin.hair_color_2

			if tempSkin.sex == 0 then
				newSkin.model = "mp_m_freemode_01"
			elseif tempSkin.sex == 1 then
				newSkin.model = "mp_f_freemode_01"
			end

		MySQL.Async.execute('UPDATE users SET skin = @skin WHERE identifier = @identifier', {
			['@skin'] = json.encode(newSkin),
			['@identifier'] = tempID
		})
		end
	end)
	print("Skin conversion completed")
end)