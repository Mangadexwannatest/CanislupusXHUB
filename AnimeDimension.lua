repeat wait() until game:IsLoaded()
repeat task.wait() until game.Workspace.Folders.Players:FindFirstChild(game.Players.LocalPlayer.Name)
game.Workspace.Folders.Players:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")

if game.CoreGui:FindFirstChild("CrazyDay") == nil then
    warn("Loading Gui..")

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Anime Dimensions Simulator",
    SubTitle = "Last Update April/07/2024 [YT:CrazyDay/edek#1004]",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightShift 
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Webhook = Window:AddTab({ Title = "Webhook", Icon = "" }),
    Other = Window:AddTab({ Title = "Other", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "" })
}

local Options = Fluent.Options

do

    Tabs.Main:AddDropdown("SelectDimension", {
        Title = "Select Dimensions",
        Values = {"Titan Dimension","Demon Dimension","Curse Dimension","Villain Dimension","Sword Dimension",
        "Ghoul Dimension","Fate Dimension","Slime Dimension","Devil Dimension","Pirate Dimension",
        "Alien Dimension","Level Dimension"},
        Multi = false,
        Default = 1,
    })

    Tabs.Main:AddDropdown("SelectDifficulty", {
        Title = "Select Difficulty",
        Values = {"Easy","Hard","Nightmare"},
        Multi = false,
        Default = 1,
    })

    Tabs.Main:AddToggle("AutoFarmAndStart", {Title = "Auto Start // Auto Farm", Default = false })
    Tabs.Main:AddToggle("FriendOnly", {Title = "Friends Only", Default = false })
    Tabs.Main:AddToggle("HardCore", {Title = "Hard Core", Default = false })


end -- End of Do

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("CrazyDay")
SaveManager:SetFolder("CrazyDay/"..game.Players.LocalPlayer.Name.." Second Piece")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
Window:SelectTab(1)
SaveManager:LoadAutoloadConfig()

coroutine.resume(coroutine.create(function()
    pcall(function ()
        if game.CoreGui:FindFirstChild("Close/Open") == nil then
local CloseOpen = Instance.new("ScreenGui")
local TextButton = Instance.new("TextButton")
CloseOpen.Name = "Close/Open"
CloseOpen.Parent = game:WaitForChild("CoreGui")
CloseOpen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
TextButton.Parent = CloseOpen
TextButton.BackgroundColor3 = Color3.fromRGB(140, 140, 140)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.0174563117, 0, 0.286864668, 0)
TextButton.Size = UDim2.new(0.100000001, 0, 0.0633569732, 0)
TextButton.Font = Enum.Font.ArialBold
TextButton.Text = "Close/Open"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true
        end
end)
end))

local Button = game.CoreGui:WaitForChild("Close/Open"):WaitForChild("TextButton")

coroutine.resume(coroutine.create(function()
    while wait() do pcall(function ()
if game.CoreGui:FindFirstChild("CrazyDay") == nil then
for i,v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "ScreenGui" then
        for _,k in next, v:GetDescendants() do
            if k.Name == "TextLabel" and string.find(k.Text,"Anime Dimensions") then
                k.Parent.Parent.Parent.Parent.Name = "CrazyDay"
                warn("Found Ui. . .")  
               end
            end
        end
    end
end
end)
if game.CoreGui:FindFirstChild("CrazyDay") ~= nil then
print("break")
break
end
end
end))


coroutine.resume(coroutine.create(function()
    pcall(function ()
Button.TouchTap:Connect(function()
for i,v in pairs(game.CoreGui.CrazyDay:GetChildren()) do
        if v.Name == "Frame" and i == 2 then
            v.Visible = not v.Visible
                    end
                end
        end)
    end)
end))

coroutine.resume(coroutine.create(function()
    pcall(function ()
local a = getrawmetatable(game)
local backs =  a.__namecall
local Macro = {}
setreadonly(a,false) 
a.__namecall = newcclosure(function(self,...)
    arg = {...}
    if arg[1] == "CreateRoom" and game.PlaceId == 6938803436 then
        getgenv().JustCreatRoom = true
        print("Creat Room Can : True")
    end
    if arg[1] == "TeleportPlayers" and game.PlaceId == 6938803436 then
        getgenv().JustTeleport = true
        print("Teleport Can : True")
    end
    return backs(self,...)
end)
setreadonly(a,true)
end)
end))

local function getClosestBoss()
    local dist, thing = math.huge
        for i, v in next, workspace.Folders.Monsters:GetChildren() do
            if v:FindFirstChildOfClass("BillboardGui") and v.EnemyHealthBarGui.Enabled == false then
                local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
                if mag < dist then
                    dist = mag 
                    thing = v
                end
            end
        end
    return thing
end

local function getClosestMob()
    local dist, thing = math.huge
        for i, v in next, workspace.Folders.Monsters:GetChildren() do
            if v:FindFirstChildOfClass("BillboardGui") then
                local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
                if mag < dist then
                    dist = mag 
                    thing = v
                end
            end
        end
    return thing
end

function Tween(P)
game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new((getClosestMob().HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude/150, Enum.EasingStyle.Linear),{CFrame = P}):Play()
end

coroutine.resume(coroutine.create(function()
    while wait() do pcall(function ()
        if Options.AutoFarmAndStart.Value then
            if not getgenv().JustCreatRoom and game.PlaceId == 6938803436 then
                local args = {
                    [1] = "CreateRoom",
                    [2] = {
                        ["Difficulty"] = Options.SelectDifficulty.Value,
                        ["FriendsOnly"] = Options.FriendOnly.Value,
                        ["MapName"] = Options.SelectDimension.Value,
                        ["Hardcore"] = Options.HardCore.Value
                    }
                }
                
                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(unpack(args))
                print("Creat : "..Options.SelectDimension.Value)
            end
            if getgenv().JustCreatRoom and game.PlaceId == 6938803436 then
                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("TeleportPlayers")
                print("Start Teleport")
            end
            end
       end)
     end
end))

coroutine.resume(coroutine.create(function()
    while task.wait() do pcall(function ()
        if Options.AutoFarmAndStart.Value then
if game:GetService("Players").LocalPlayer.PlayerGui.BattleGui.CenterUIFrame.BossHealthFrame.Visible == true then
    Tween(getClosestBoss().HumanoidRootPart.CFrame * CFrame.new(0,0,-6.5) * CFrame.Angles(math.rad(0),1800,0)  )
elseif game:GetService("Players").LocalPlayer.PlayerGui.BattleGui.CenterUIFrame.BossHealthFrame.Visible == false then
    Tween(getClosestMob().HumanoidRootPart.CFrame * CFrame.new(0,0,-6.5)  * CFrame.Angles(math.rad(0),1800,0) ) 
end
end
end)
end
end))


coroutine.resume(coroutine.create(function()
    while wait() do pcall(function ()
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if v:IsA("BasePart") then
        if not v.CanCollide then
        v.CanCollide = true
           end
           end
           end
           end)
       end
end))


end -- End Of Do
