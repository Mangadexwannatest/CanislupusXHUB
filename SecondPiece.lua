repeat wait() until game:IsLoaded()
repeat task.wait() until game.Workspace.Lives:FindFirstChild(game.Players.LocalPlayer.Name)
game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
game.ReplicatedStorage:WaitForChild("ToolsHandle")
repeat wait() until game.ReplicatedStorage:FindFirstChild("ToolsHandle")

if game.PlaceId ~= 16644455867 then
    repeat wait() until game:IsLoaded()
    repeat task.wait() until game.Workspace.Lives:FindFirstChild(game.Players.LocalPlayer.Name)
    game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
    game.ReplicatedStorage:WaitForChild("ToolsHandle")
    repeat wait() until game.ReplicatedStorage:FindFirstChild("ToolsHandle")
    local CrazyDay = Instance.new("ScreenGui")
    local TextLabel = Instance.new("TextLabel")
    CrazyDay.Name = "CrazyDay"
    CrazyDay.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    CrazyDay.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    TextLabel.Parent = CrazyDay
    TextLabel.BackgroundColor3 = Color3.fromRGB(152, 152, 114)
    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(0.274865657, 0, 0.185579196, 0)
    TextLabel.Size = UDim2.new(0.472983956, 0, 0.472340554, 0)
    TextLabel.Font = Enum.Font.Unknown
    TextLabel.Text = "Only used in dungeons"
    TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.TextScaled = true
    TextLabel.TextSize = 100.000
    TextLabel.TextWrapped = true
    wait(3.5)
    CrazyDay:Destroy()
end

if game.CoreGui:FindFirstChild("CrazyDay") == nil and game.PlaceId == 16644455867 then
    warn("Loading Gui..")
    local CrazyDay = Instance.new("ScreenGui")
    local TextLabel = Instance.new("TextLabel")
    CrazyDay.Name = "CrazyDay"
    CrazyDay.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    CrazyDay.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    TextLabel.Parent = CrazyDay
    TextLabel.BackgroundColor3 = Color3.fromRGB(152, 152, 114)
    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(0.274865657, 0, 0.185579196, 0)
    TextLabel.Size = UDim2.new(0.472983956, 0, 0.472340554, 0)
    TextLabel.Font = Enum.Font.Unknown
    TextLabel.Text = "user at your own risk"
    TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.TextScaled = true
    TextLabel.TextSize = 100.000
    TextLabel.TextWrapped = true
    wait(1.5)
    CrazyDay:Destroy()

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Second Piece",
    SubTitle = "Last Update April/15/2024 [YT:CrazyDay/edek#1004] - user at your own risk",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.RightShift 
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Other = Window:AddTab({ Title = "Other", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "" })
}

local Options = Fluent.Options
local SwordWeapon = 
{
}
local MeeleeWeapon = {
    "Hakari","Natsu","Jiren","Choso","Gilgamesh","Itadori","Gon","Killua",
    "Sukuna","Sukuna [Half Power]","Tatsumaki","Uraume","Gojo","Gojo [Unleashed]",
    "Naruto","Combat"}
local FruitsWeapon = {
"Bomb","Smoke","Light","Sand","Flame","Quake",
"GodLight","Operation","Solar"
}
local BackPackGet = game.Players.LocalPlayer.Backpack:GetChildren()
local GetPlayers = {}
local QuestTable = {}
local BossTable = {"Shank","Monkey King","Bandit Leader","Lieutenant Marine"}
local RewardCollage = {}

coroutine.resume(coroutine.create(function()
    pcall(function ()
for i,v in pairs(game.ReplicatedStorage.ToolsHandle:GetChildren()) do
     table.insert(SwordWeapon,v.Name)
      end
  end)
end))

coroutine.resume(coroutine.create(function()
    pcall(function ()
    for i,v in pairs(game.Players:GetChildren()) do
            table.insert(GetPlayers,v.Name)
        end
    end)
end))
do
    

     Tabs.Main:AddDropdown("Weapon", {
        Title = "Select Weapons",
        Values = {"Melee","Sword","DemonFruit"},
        Multi = false,
        Default = nil,
    })
    

    local SkillDropdown = Tabs.Main:AddDropdown("SkillSelect", {
        Title = "Auto Skill",
        Description = nil,
        Values = {"Z", "X", "C","V","F"},
        Multi = true,
        Default = {nil},
    })

     local T  = Tabs.Main:AddToggle("Farm", {Title = "King Trial", Default = false })
     Tabs.Main:AddToggle("AutoKenhaki", {Title = "Auto Ken Haki", Default = false })
     Tabs.Main:AddToggle("AutoBusohaki", {Title = "Auto Buso Haki", Default = false })


    SkillDropdown:OnChanged(function(Value)
        local Values = {}
        for Value, State in next, Value do
            table.insert(Values, Value)
        end
        if table.find(Values,"Z") and not getgenv().AutoSkillZ then
            getgenv().AutoSkillZ = true
        end
        if table.find(Values,"X") and not getgenv().AutoSkillX then
            getgenv().AutoSkillX = true
        end
        if table.find(Values,"C") and not getgenv().AutoSkillC then
            getgenv().AutoSkillC = true
        end
        if table.find(Values,"V") and not getgenv().AutoSkillV then
            getgenv().AutoSkillV = true
        end
        if table.find(Values,"F") and not getgenv().AutoSkillF then
            getgenv().AutoSkillF = true
        end

        if not table.find(Values,"Z") and getgenv().AutoSkillZ then
            getgenv().AutoSkillZ = false
        end
        if not table.find(Values,"X") and getgenv().AutoSkillX then
            getgenv().AutoSkillX = false
        end
        if not table.find(Values,"C") and getgenv().AutoSkillC then
            getgenv().AutoSkillC = false
        end
        if not table.find(Values,"V") and getgenv().AutoSkillV then
            getgenv().AutoSkillV = false
        end
        if not table.find(Values,"F") and getgenv().AutoSkillF then
            getgenv().AutoSkillF = false
        end

    end)



        Tabs.Other:AddSection("Locations")
    
        local TeleportList = {}
         for i,v in pairs(game.Workspace.Locations:GetChildren()) do
         table.insert(TeleportList,v.Name)
         end
    
         Tabs.Other:AddDropdown("SelectLocation", {
            Title = "Select Location",
            Values = TeleportList,
            Multi = false,
            Default = nil,
        })
    
        Tabs.Other:AddButton({
            Title = "Teleport",
            Description = nil,
            Callback = function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Locations[Options.SelectLocation.Value].CFrame
            end})

    Tabs.Other:AddSection("Other")
    Tabs.Other:AddToggle("AutoExecuteScript", {Title = "Auto Execute Script", Default = false })

    local UpdateLog = Tabs.Other:AddSection("Update Log")

    UpdateLog:AddParagraph({
        Title = "Last Update April/15/2024",
        Content = "[+] King Trial"
    })
    
end

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

function getclosest()
    local MinDistance = math.huge
       local ClosestObject
       for i,v in pairs(game.Workspace.Lives:GetChildren()) do
               local PlayersTable = table.find(GetPlayers,v.Name)
               if not PlayersTable and v.Humanoid.Health > 0 then
               local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
               if dist < MinDistance then
                   MinDistance, ClosestObject = dist, v
               end
           end
       end
       return ClosestObject
end

function Tween(P)
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new((getclosest().HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude/150,Enum.EasingStyle.Linear),{CFrame = P}):Play()
end


local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
ScreenGui.Parent = game:WaitForChild("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Name = "StatusZuz"
TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(170, 170, 0)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.643817306, 0, 0.0141843967, 0)
TextLabel.Size = UDim2.new(0.248521537, 0, 0.100000009, 0)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "_____________"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 14.000

local Discon1
game.ReplicatedStorage.Settings.ChildAdded:Connect(function (v)
    if v.Name:match("Shadow") and game.PlaceId == 16644455867 then
        game.CoreGui:FindFirstChild("StatusZuz"):FindFirstChild("TextLabel").Text = "Connection . . ."..v.Name
        Discon1 = game.ReplicatedStorage.Settings[v.Name].ChildAdded:Connect(function (c)
            if c.Name ~= "CombatAction" and c.Name ~= "JumpDisable" 
            and c.Name ~= "InCombat" and c.Name ~= "EquipType" and c.Name ~= "Race"
            and c.Name ~= "DamageList" and c.Name ~= "Target" and c.Name ~= "Level"
            and c.Name ~= "Weapon" and c.Name ~= "OnBleedDamage" and c.Name ~= "OnFireDamage" 
            and c.Name ~= "IFrame" and c.Name ~= "WalkDisable" and c.Name ~= "Action"
            and not getgenv().STOP_Dodge then
            game.CoreGui:FindFirstChild("StatusZuz"):FindFirstChild("TextLabel").Text = "Enemy Skill . . ."..c.Name
            repeat wait() until not v.Parent
            game.CoreGui:FindFirstChild("StatusZuz"):FindFirstChild("TextLabel").Text = "Disconnect . . ."..v.Name
            Discon1:Disconnect()
            end
        end)
    end    
end)


game.ReplicatedStorage.Settings.ChildAdded:Connect(function (v)
    if v.Name:match("Shadow") and game.PlaceId == 16644455867 then
        game.ReplicatedStorage.Settings[v.Name].ChildAdded:Connect(function (c)
            if c.Name == "Action" or c.Name == "IFrame" or c.Name == "JumpDisable" or c.Name == "WalkDisable" and not getgenv().STOP_Dodge
            then
            getgenv().Dodge = true 
            repeat task.wait() until not c.Parent or getgenv().STOP_Dodge
            getgenv().Dodge = false

            end
        end)
    end    
end)

game.ReplicatedStorage.Settings[game.Players.LocalPlayer.Name].ChildAdded:Connect(function (v)
    if v.Name == "Action" or v.Name == "IFrame" or v.Name == "JumpDisable" or v.Name == "WalkDisable" then
        getgenv().STOP_Dodge = true
        getgenv().Dodge = false
        game.CoreGui:FindFirstChild("StatusZuz"):FindFirstChild("TextLabel").Text = "Player Using Skill. . ."
        repeat task.wait() until not v.Parent
        getgenv().STOP_Dodge = false
    end
end)

coroutine.resume(coroutine.create(function()
    while task.wait() do pcall(function ()
        if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or game.Workspace.Lives:FindFirstChild(game.Players.LocalPlayer.Name) == nil  then
        else
            if Options.Farm.Value and getgenv().Dodge and not getgenv().STOP_Dodge then
                repeat task.wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getclosest().HumanoidRootPart.CFrame * CFrame.new(0,85,0)
                until not getgenv().Dodge or not Options.Farm.Value or getclosest().Humanoid.Health <= 0 or getgenv().STOP_Dodge or game.Players.LocalPlayer.Character.Humanoid.Health <= 0
        elseif Options.Farm.Value and not getgenv().Dodge then
            repeat task.wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getclosest().HumanoidRootPart.CFrame * CFrame.new(0,0,14)
            until getgenv().Dodge or not Options.Farm.Value or getclosest().Humanoid.Health <= 0 or game.Players.LocalPlayer.Character.Humanoid.Health <= 0
        end
    end
    end)
end
end))

coroutine.resume(coroutine.create(function()
    pcall(function ()
        warn("HOOK SEND TP DATA")
local metatable = getrawmetatable(game)
local nc = metatable.namecall
setreadonly(metatable, false)
metatable.namecall = newcclosure(function(self, ...)
        local args = {...} 
    if tostring(self) == "SendTPData" or self == "SendTPData" or string.find(self,"SendTPData") then
        return wait(9e9)
      end
    return nc(self,...)
end)
setreadonly(metatable, true)
end)
end))

coroutine.resume(coroutine.create(function()
    while wait() do pcall(function ()  
if not game.Players.LocalPlayer.Character:FindFirstChild("CrazyDay_NO") then
    local NO_CLIP_PART = Instance.new("Part",game.Players.LocalPlayer.Character)
    NO_CLIP_PART.Name = "CrazyDay_NO"
    NO_CLIP_PART.CanCollide = true
    NO_CLIP_PART.Anchored = true
    NO_CLIP_PART.Transparency = 1
    NO_CLIP_PART.Size = Vector3.new(2,1,2)
elseif game.Players.LocalPlayer.Character:FindFirstChild("CrazyDay_NO") then
    repeat
        task.wait()
        game.Players.LocalPlayer.Character:FindFirstChild("CrazyDay_NO").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-3.5,0)
     until not game.Players.LocalPlayer.Character:FindFirstChild("CrazyDay_NO")
    end
end)
end
end))


coroutine.resume(coroutine.create(function()
    while wait() do pcall(function ()
        if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or game.Workspace.Lives:FindFirstChild(game.Players.LocalPlayer.Name) == nil  then 
        else
            for i,v in next, BackPackGet do
                local MeleeTable = table.find(MeeleeWeapon,v.Name)
                local SwordTable = table.find(SwordWeapon,v.Name)
                local DemonFruitTable = table.find(FruitsWeapon,v.Name)
                for _,c in next,game.Workspace.Lives:GetChildren() do
                    if c.ClassName == "Model" and c.Name ~= game.Players.LocalPlayer.Name then
                    local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - c.HumanoidRootPart.Position).Magnitude
                if Options.Weapon.Value == "Melee" and MeleeTable and not game.Players.LocalPlayer.Character:FindFirstChild(v.Name) and dist <= 25 
                and not getgenv().NoEquip then
                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v.Name))
                end
                if  Options.Weapon.Value == "Sword" and SwordTable and not game.Players.LocalPlayer.Character:FindFirstChild(v.Name) and dist <= 25
                and not getgenv().NoEquip  then
                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v.Name))
                end
                if  Options.Weapon.Value == "DemonFruit" and DemonFruitTable and not game.Players.LocalPlayer.Character:FindFirstChild(v.Name) and dist <= 25 
                and not getgenv().NoEquip then
                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v.Name))
                end       
                end
                    end
                end
            end
        end)
    end
end))

coroutine.resume(coroutine.create(function()
	while wait(.25) do pcall(function()
        if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or game.Workspace.Lives:FindFirstChild(game.Players.LocalPlayer.Name) == nil  then
        else
            for i,v in pairs(game.Workspace.Lives:GetChildren()) do
                if v.ClassName == "Model" and v.Name ~= game.Players.LocalPlayer.Name then
                    local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
		if getgenv().AutoSkillZ  and dist <= 17.5 and getclosest().Humanoid.Health > 0 then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
			game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, nil)
			game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, nil)
        end
        if getgenv().AutoSkillX and dist <= 17.5 and getclosest().Humanoid.Health > 0 then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, nil)
			game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, nil)
        end
        if getgenv().AutoSkillC and dist <= 17.5 and getclosest().Humanoid.Health > 0 then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, nil)
			game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, nil)
        end
        if getgenv().AutoSkillV and dist <= 17.5 and getclosest().Humanoid.Health > 0 then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, nil)
			game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, nil)
        end
        if getgenv().AutoSkillF and dist <= 17.5 and getclosest().Humanoid.Health > 0 then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "F", false, nil)
			game:GetService("VirtualInputManager"):SendKeyEvent(false, "F", false, nil)
        end
                end
               end
		   end
	   end)
	end
end))

        coroutine.resume(coroutine.create(function()
            pcall(function ()
                if game.CoreGui:FindFirstChild("Close/Open") == nil and game:GetService("UserInputService").TouchEnabled then
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
                    if k.Name == "TextLabel" and string.find(k.Text,"Second Piece") then
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
        if v.Name == "Frame" and i == 2 and game:GetService("UserInputService").TouchEnabled then
            v.Visible = not v.Visible
                    end
                end
        end)
    end)
end))

    coroutine.resume(coroutine.create(function()
        pcall(function ()
            repeat wait() until game:IsLoaded()
            game.CoreGui:WaitForChild("CrazyDay")
            repeat wait() until game.CoreGui:FindFirstChild("CrazyDay") ~= nil
            repeat wait() until Options.AutoCloseAfterExecute.Value
            for i,v in pairs(game.CoreGui.CrazyDay:GetChildren()) do
                if v.Name == "Frame" and i == 2 then
                    v.Visible = false
                end
            end
        end)
    end))

    coroutine.resume(coroutine.create(function()
        while wait() do pcall(function ()
            if Options.AutoKenhaki.Value then
                for i,v in pairs(game.Lighting:GetChildren()) do
                    if v.Name == "KenHaki" then
                        if v.Enabled == false then
                            game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
                            repeat
                                game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
                local args = {[1] = "KenHaki"}game:GetService("ReplicatedStorage").Remotes.SkillHolder:FireServer(unpack(args))
                wait(1.35)    
            until v.Enabled == true
                        end
                    end
                end
              end   
           end)   
        end
    end))
    
    coroutine.resume(coroutine.create(function()
        while wait() do pcall(function ()
            if Options.AutoBusohaki.Value then
                game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
                for i,v in pairs(game.Workspace.Lives[game.Players.LocalPlayer.Name]:GetChildren()) do
                    if v.Name == "Right Arm" and v:FindFirstChild("Haki") == nil then 
                        game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
                local args = {[1] = "BusoHaki"}game:GetService("ReplicatedStorage").Remotes.SkillHolder:FireServer(unpack(args))
                
                    end
                end
              end  
          end)   
        end
    end))

    coroutine.resume(coroutine.create(function()
        game.Players.LocalPlayer.OnTeleport:Connect(function(State)
            local QueueOnTeleport = queue_on_teleport or queueonteleport or (syn and syn.queue_on_teleport)
            local script = 
            [[
                repeat wait() until game:IsLoaded()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Mangadexwannatest/CanislupusXHUB/main/SecondPiece.lua"))()
        
            local success = pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Mangadexwannatest/CanislupusXHUB/main/SecondPiece.lua"))()
             end)
             
             print(success)
             if not success then
                wait(20)
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Mangadexwannatest/CanislupusXHUB/main/SecondPiece.lua"))()
             end
            ]]
            if State == Enum.TeleportState.InProgress and Options.AutoExecuteScript.Value then
                QueueOnTeleport(script)
                end
        end)
        end))


end
