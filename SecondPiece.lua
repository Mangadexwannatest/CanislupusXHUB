        repeat wait() until game:IsLoaded()
        repeat task.wait() until game.Workspace.Lives:FindFirstChild(game.Players.LocalPlayer.Name)
        game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
        game.ReplicatedStorage:WaitForChild("ToolsHandle")
        repeat wait() until game.ReplicatedStorage:FindFirstChild("ToolsHandle")

if game.PlaceId == 15049111150 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Mangadexwannatest/CanislupusXHUB/main/SecondPiece_MainGame.lua"))()
else
loadstring(game:HttpGet("https://raw.githubusercontent.com/Mangadexwannatest/CanislupusXHUB/main/SecondPiece_Dungeon.lua"))()
end
