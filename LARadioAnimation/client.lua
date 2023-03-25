local F = false
RegisterCommand('+am', function(src, image, grade, name)
	if IsPedInAnyVehicle(PlayerPedId(), false)  == false then
	DisableActions(ped)
	local ped = PlayerPedId()
    prop_name = 'prop_cs_walkie_talkie'
    local x,y,z = table.unpack(GetEntityCoords(ped))
    local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
    local boneIndex = GetPedBoneIndex(ped, 28422)
	local inVeh = IsPedInAnyVehicle(GetPlayerPed(-1), false)
		if DoesEntityExist(ped) and not IsEntityDead(ped) then
			if not IsPauseMenuActive() then 
				loadAnimDict("anim@male@holding_radio")
				if not IsPlayerFreeAiming(PlayerId()) then 
					AttachEntityToEntity(prop, ped, boneIndex, 0.0750, 0.0230,  -0.0250, -90.0000, 0.00, -59.9999, true, true, true, true, 1, true)
					TaskPlayAnim(ped, 'anim@male@holding_radio', 'holding_radio_clip',4.0, -1, -1, 50, 0, false, false, false)
					SetEnableHandcuffs(ped, true)
					F = true		
				elseif IsPlayerFreeAiming(PlayerId()) then 
					AttachEntityToEntity(prop, ped, boneIndex, 0.0750, 0.0230,  -0.0250, -90.0000, 0.00, -59.9999, true, true, true, true, 1, true)
					TaskPlayAnim(ped, 'anim@male@holding_radio', 'holding_radio_clip',4.0, -1, -1, 50, 0, false, false, false)
					SetEnableHandcuffs(ped, true)	
				end 
				   if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "anim@male@holding_radio", "holding_radio_clip", 3) then
					DisableActions(ped)
					elseif IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "anim@male@holding_radio", "holding_radio_clip", 3) then
					DisableActions(ped)
					end

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
					F = false
				end
			end
		end
end,false)	

RegisterKeyMapping('+am', 'LA Radio Animation', 'keyboard', 'LMENU')

-- MAIN FUNCTIONS -- 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		if IsControlPressed(0, 23) then
            R = true
		elseif not IsControlPressed(0, 23) then
			R = false
		end
    end
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		if F == true then
			if R == true then
				local Radio = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 10.0, GetHashKey('prop_cs_walkie_talkie'))
				StopAnimTask(PlayerPedId(), 'anim@male@holding_radio', 'holding_radio_clip',5.0)
				DeleteEntity(Radio)
			end
		end
    end
end)

function DisableActions(ped)
	DisableControlAction(1, 140, true)
	DisableControlAction(1, 141, true)
	DisableControlAction(1, 142, true)
	DisableControlAction(1, 23, true)
	DisableControlAction(1, 37, true)
	DisableControlAction(1, 23, true)
	DisablePlayerFiring(ped, true) 
end

function loadAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		RequestAnimDict(dict)
		Citizen.Wait(0)
	end
end