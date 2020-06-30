-- CONFIG --

-- Kick Time Limit (in seconds)
-- 15 mins = 900 seconds
secondsUntilKick = 900
time = secondsUntilKick
-- Warn players if 3/4 of the Time Limit ran up
kickWarning = true

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(1000)
		local playerIdx = GetPlayerFromServerId(source)
		local playerPed = GetPlayerPed(playerIdx)
		if playerPed then
				if time > 0 then
					if kickWarning and time == math.ceil(secondsUntilKick / 4) then
						TriggerEvent("chatMessage", "WARNING", {255, 0, 0}, "^1You'll be kicked in " .. time .. " seconds for other players to register.")
					end
					time = time - 1
					exports.pNotify:SendNotification({
            			text = time,
            			queue = 'right',
            			timeout = 1000,
            			layout = 'topLeft'
          			})
				else
					TriggerServerEvent("kickPlayer")
				end
		end
	end
end)