RegisterServerEvent("kickPlayer")
AddEventHandler("kickPlayer", function()
	DropPlayer(source, "You were in the server too long.")
end)