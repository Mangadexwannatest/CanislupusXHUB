local queue_on_teleport = queue_on_teleport or syn and syn.queue_on_teleport
[[   
loadstring(game:HttpGet('https://raw.githubusercontent.com/Mangadexwannatest/CanislupusXHUB/main/ReExec.lua'))()
]]
while not game:IsLoaded() do wait() end 

local success = pcall(function()
    game:GetService("TeleportService"):Teleport(game.PlaceId)
end)

print(success)
if not success then
    wait(20)
    game:GetService("TeleportService"):Teleport(game.PlaceId)
end
--l
