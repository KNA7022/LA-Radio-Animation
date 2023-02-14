
    RegisterCommand('+am', function(src, image, grade, name)
	local ped = PlayerPedId()
    prop_name = 'prop_cs_walkie_talkie'
    local x,y,z = table.unpack(GetEntityCoords(ped))
    local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
    local boneIndex = GetPedBoneIndex(ped, 28422)
	if DoesEntityExist(ped) and not IsEntityDead(ped) then
		if not IsPauseMenuActive() then 
			loadAnimDict("cellphone@")
			if not IsPlayerFreeAiming(PlayerId()) then 
                AttachEntityToEntity(prop, ped, boneIndex, 0.00, 0.00, 0.000, 0.0, 00, 00.0, true, true, true, true, 1, true)
				TaskPlayAnim(ped, 'cellphone@', 'cellphone_text_in',4.0, -1, -1, 50, 0, false, false, false)
				SetEnableHandcuffs(ped, true)

			elseif IsPlayerFreeAiming(PlayerId()) then 
                AttachEntityToEntity(prop, ped, boneIndex, 0.00, 0.00, 0.000, 0.0, 00, 00.0, true, true, true, true, 1, true)
				TaskPlayAnim(ped, 'cellphone@', 'cellphone_text_in',4.0, -1, -1, 50, 0, false, false, false)
				SetEnableHandcuffs(ped, true)
			end 
			if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "cellphone@", "cellphone_text_in", 3) then
				DisableActions(ped)
			elseif IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "cellphone@", "cellphone_text_in", 3) then
				DisableActions(ped)
			end
		end 
	end 
end)
RegisterCommand('-am', function()
	local ped = PlayerPedId()
	local Radio = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 10.0, GetHashKey('prop_cs_walkie_talkie'))
     if DoesEntityExist(ped) and not IsEntityDead(ped) then
        if not IsPauseMenuActive() then
			if DoesEntityExist(Radio) then
				DeleteEntity(Radio)
				ClearPedTasks(ped)
				SetEnableHandcuffs(ped, ture)
			end
			end
        end
    end,false)	

RegisterKeyMapping('+am', 'LA Radio Animation', 'keyboard', 'LMENU')

-- MAIN FUNCTIONS -- 
function DisableActions(ped)

	DisableControlAction(1, 140, true)
	DisableControlAction(1, 141, true)
	DisableControlAction(1, 142, true)
	DisableControlAction(1, 37, true)
	DisablePlayerFiring(ped, true) 
end

function loadAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		RequestAnimDict(dict)
		Citizen.Wait(0)
	end
end