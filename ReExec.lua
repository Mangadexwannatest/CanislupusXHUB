local queue_on_teleport = queue_on_teleport or syn and syn.queue_on_teleport[['syn.queue_on_teleport(game:HttpGet("https://pastebin.com/raw/znNZ7DiY"))']]
while not game:IsLoaded() do wait() end 

local success = pcall(function()
    game:GetService("TeleportService"):Teleport(game.PlaceId)
end)

print(success)
if not success then
    wait(20)
    game:GetService("TeleportService"):Teleport(game.PlaceId)
end
