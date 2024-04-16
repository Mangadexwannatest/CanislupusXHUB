repeat wait() until game:IsLoaded()
repeat task.wait() until game.Workspace.Lives:FindFirstChild(game.Players.LocalPlayer.Name)
game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
game.ReplicatedStorage:WaitForChild("ToolsHandle")
repeat wait() until game.ReplicatedStorage:FindFirstChild("ToolsHandle")

if game.CoreGui:FindFirstChild("CrazyDay") == nil and game.PlaceId ~= 15049111150 then
    warn("Loading Gui..")

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Second Piece",
    SubTitle = "Last Update April/16/2024 [YT:CrazyDay/edek#1004] - user at your own risk",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.RightShift 
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Webhook = Window:AddTab({ Title = "Webhook", Icon = "" }),
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

     Tabs.Main:AddToggle("AutoPortal", {Title = "Auto Portal", Default = false })
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

    Tabs.Webhook:AddInput("WebhookLink", {
        Title = "Webhook",
        Description = "Link",
        Default = nil,
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
    })

    Tabs.Webhook:AddToggle("AutoWebhookDungeon", {Title = "Auto Dungeon Reward", Default = false })
    Tabs.Webhook:AddToggle("AutoWebhookBountyTask", {Title = "Auto Bounty Task Reward", Default = false })
    Tabs.Webhook:AddToggle("AutoWebhookMerchant", {Title = "Auto Merchant Reward", Default = false })

    Tabs.Webhook:AddButton({
        Title = "Webhook",
        Description = nil,
        Callback = function()
            local timeInfo = os.date("*t")                                    
            BBody = game:GetService("HttpService"):JSONEncode({
                content = nil,
                embeds = {{
                    ["author"] = {
                        ["name"] = "Second Piece Notify",
                        ["icon_url"] = "https://yt3.ggpht.com/ytc/AIdro_ka8akbqZkZq1vfNvenQ4CUg1mDkmo1msvUFaRTBbkl2AQ=s600-c-k-c0x00ffffff-no-rj-rp-mo"
                    },
                    ["title"] = "Second Piece", 
                    ["icon_url"] = "https://tr.rbxcdn.com/514ca219675a6e1e89b4c205898db194/150/150/Image/Png",
                    ["footer"] = {
                        ["text"] = "Time : " .. timeInfo.hour .. ":" .. timeInfo.min,
                        ["icon_url"] = "https://tr.rbxcdn.com/514ca219675a6e1e89b4c205898db194/150/150/Image/Png"
                    
                    },
                    ["color"] = tonumber(0xFFD700),
                    ["url"] = "https://www.roblox.com/games/15049111150/X2-Second-Piece",
                    ["fields"] = {
                    
                                    {
                            ["name"] = "Webhook!",
                            ["value"] = "Webhook!",
                            ["inline"] = false
                            
                        },
                        
                    }
                    }}
                })
            local response = syn.request({
            Url = Options.WebhookLink.Value,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = BBody
            })    
        end
    })



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
    Tabs.Other:AddToggle("AutoRejoinError", {Title = "Auto Rejoin When Disconnect ", Default = false })
    local white = Tabs.Other:AddToggle("AutoWhiteScreen", {Title = "Auto White Screen", Default = false })
    Tabs.Other:AddToggle("AutoCloseAfterExecute", {Title = "Auto Close Gui After Execute", Default = false })
    Tabs.Other:AddToggle("AutoExecuteScript", {Title = "Auto Execute Script", Default = false })

    white:OnChanged(function()
        if Options.AutoWhiteScreen.Value then
            game:GetService("RunService"):Set3dRenderingEnabled(false)
        else
            game:GetService("RunService"):Set3dRenderingEnabled(true)
        end
    end)

    local UpdateLog = Tabs.Other:AddSection("Update Log")

    UpdateLog:AddParagraph({
        Title = "Last Update April/16/2024",
        Content = "[*] Fixed Auto Quest\n[+] King's Trial\n[+]Dodge Skill (Bounty Task Only)"
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


coroutine.resume(coroutine.create(function()
    game.Players.LocalPlayer.PlayerGui.Dungeon.Wave:GetPropertyChangedSignal("Text"):Connect(function()
        if Options.AutoPortal.Value and game.PlaceId ~= 15049111150 then
            for i,v in pairs(game.Workspace.Lives:GetChildren()) do
                if v.ClassName == "Model" and v.Name ~= game.Players.LocalPlayer.Name then
                    if v.Humanoid.Health <= 0 then
                        v:Destroy()
                end
            end
        end
        end
    end)
end))

    coroutine.resume(coroutine.create(function()
        while wait() do pcall(function ()
            if Options.AutoPortal.Value and game.PlaceId ~= 15049111150 and not getgenv().Started then
                game:GetService("ReplicatedStorage").Remotes.Ready:FireServer()
                repeat wait() until game:IsLoaded()
                wait(.5)
                getgenv().Started = true
                end
        end) 
        if getgenv().Started then
        break
        end
        end
    end))

local Discon1
game.ReplicatedStorage.Settings.ChildAdded:Connect(function(v)
    pcall(function ()
    if v.Name:match("Shadow") and game.PlaceId ~= 15049111150 then
        game.CoreGui:FindFirstChild("StatusZuz"):FindFirstChild("TextLabel").Text = "Connection . . ."..v.Name
        Discon1 = game.ReplicatedStorage.Settings[v.Name].ChildAdded:Connect(function (c)
            if c.Name ~= "CombatAction" and c.Name ~= "JumpDisable" 
            and c.Name ~= "InCombat" and c.Name ~= "EquipType" and c.Name ~= "Race"
            and c.Name ~= "DamageList" and c.Name ~= "Target" and c.Name ~= "Level"
            and c.Name ~= "Weapon" and c.Name ~= "OnBleedDamage" and c.Name ~= "OnFireDamage" 
            and c.Name ~= "IFrame" and c.Name ~= "WalkDisable" and c.Name ~= "Action"
            and not getgenv().STOP_Dodge and not getgenv().PlayerStun then
            game.CoreGui:FindFirstChild("StatusZuz"):FindFirstChild("TextLabel").Text = "Enemy Skill . . ."..c.Name
            repeat wait() until not v.Parent
            game.CoreGui:FindFirstChild("StatusZuz"):FindFirstChild("TextLabel").Text = "Disconnect . . ."..v.Name
            Discon1:Disconnect()
            end
        end)
    end    
end)
end)


local Amout = {}
game.ReplicatedStorage.Settings.ChildAdded:Connect(function(v)
    if v.Name:match("Shadow") then
        table.insert(Amout,v.Name)
    end
end)

game.ReplicatedStorage.Settings.ChildRemoved:Connect(function(v)
    if v.Name:match("Shadow") then
        table.clear(Amout)
        table.insert(Amout,v.Name)
    end
end)

coroutine.resume(coroutine.create(function()
    while wait() do pcall(function ()
        if #Amout == 1 then
            getgenv().Distance = 7
        elseif #Amout ~= 1 then
            getgenv().Distance = 15

        end
    end)
end
end))


game.ReplicatedStorage.Settings.ChildAdded:Connect(function (v)
    pcall(function ()
    if v.Name:match("Shadow") and game.PlaceId ~= 15049111150 then
        game.ReplicatedStorage.Settings[v.Name].ChildAdded:Connect(function (c)
            if c.Name == "Action" or c.Name == "IFrame" or v.Name == "WalkDisable"
            and not getgenv().STOP_Dodge then
            getgenv().Dodge = true 
            repeat wait() until not c.Parent or getgenv().STOP_Dodge
            getgenv().Dodge = false
            getgenv().CheckForSome = true
            end
        end)
    end    
end)
end)

function Check_To_Dodge()
    for i,v in pairs(game.ReplicatedStorage.Settings:GetChildren()) do
        if v.Name:match("Shadow") and game.PlaceId ~= 15049111150 then
            for _,vv in next,v:GetChildren() do
                if vv.Name == "Action" or vv.Name == "IFrame" or vv.Name == "WalkDisable" then
                    getgenv().Dodge = true 
                    repeat wait() until not vv.Parentw
                    getgenv().Dodge = false
                    getgenv().CheckForSome = true
                end
            end
        end
    end
end

game.ReplicatedStorage.Settings[game.Players.LocalPlayer.Name].ChildAdded:Connect(function (v)
    pcall(function ()
    if v.Name == "Action" or v.Name == "IFrame" or v.Name == "WalkDisable"  then
        getgenv().STOP_Dodge = true
        repeat task.wait() until not v.Parent 
        getgenv().STOP_Dodge = false
        if getgenv().CheckForSome then
            Check_To_Dodge()
            getgenv().CheckForSome = false
        end
    end
    if v.Name ~= "CombatAction" and v.Name ~= "JumpDisable" 
    and v.Name ~= "InCombat" and v.Name ~= "EquipType" and v.Name ~= "Race"
    and v.Name ~= "DamageList" and v.Name ~= "Target" and v.Name ~= "Level"
    and v.Name ~= "Weapon" and v.Name ~= "OnBleedDamage" and v.Name ~= "OnFireDamage" 
    and v.Name ~= "IFrame" and v.Name ~= "WalkDisable" and v.Name ~= "Action" and v.Name ~= "Stun" then
        game.CoreGui:FindFirstChild("StatusZuz"):FindFirstChild("TextLabel").Text = "Player Using Skill . . ."..v.Name
        end
    end)
end)

coroutine.resume(coroutine.create(function()
    getgenv().Distance = 7.15
    while task.wait() do pcall(function ()
        if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or game.Workspace.Lives:FindFirstChild(game.Players.LocalPlayer.Name) == nil  then
        else
            if Options.AutoPortal.Value and getgenv().Dodge and not getgenv().STOP_Dodge then
                game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
                repeat task.wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getclosest().HumanoidRootPart.CFrame * CFrame.new(0,-200,5)
                until not getgenv().Dodge or not Options.AutoPortal.Value or getclosest().Humanoid.Health <= 0 or getgenv().STOP_Dodge or game.Players.LocalPlayer.Character.Humanoid.Health <= 0
        elseif Options.AutoPortal.Value and not getgenv().Dodge then
            game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
            repeat task.wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getclosest().HumanoidRootPart.CFrame * CFrame.new(0,0,getgenv().Distance)
            until getgenv().Dodge or not Options.AutoPortal.Value or getclosest().Humanoid.Health <= 0 or game.Players.LocalPlayer.Character.Humanoid.Health <= 0
        end
    end
    end)
end
end))

local a = getrawmetatable(game)
local backs =  a.__namecall
local Macro = {}
setreadonly(a,false)
a.__namecall = newcclosure(function(self,...)
    if tostring(self) == "SendTPData"  then
        print("Bypass Anti_Cheat")
        return wait(9e9)
    end
    return backs(self,...)
end)
setreadonly(a,true)

coroutine.resume(coroutine.create(function()
    while wait() do pcall(function ()  
if not game.Players.LocalPlayer.Character:FindFirstChild("CrazyDay_NO") and game.PlaceId == 16644455867 then
    local NO_CLIP_PART = Instance.new("Part",game.Players.LocalPlayer.Character)
    NO_CLIP_PART.Name = "CrazyDay_NO"
    NO_CLIP_PART.CanCollide = true
    NO_CLIP_PART.Anchored = true
    NO_CLIP_PART.Transparency = 1
    NO_CLIP_PART.Size = Vector3.new(2,1,2)
elseif game.Players.LocalPlayer.Character:FindFirstChild("CrazyDay_NO") and game.PlaceId == 16644455867 then
    repeat
        task.wait()
        game.Players.LocalPlayer.Character:FindFirstChild("CrazyDay_NO").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-3.5,0)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
     until not game.Players.LocalPlayer.Character:FindFirstChild("CrazyDay_NO") or game.PlaceId ~= 16644455867
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
                    game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v.Name))
                end
                if  Options.Weapon.Value == "Sword" and SwordTable and not game.Players.LocalPlayer.Character:FindFirstChild(v.Name) and dist <= 25
                and not getgenv().NoEquip  then
                    game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v.Name))
                end
                if  Options.Weapon.Value == "DemonFruit" and DemonFruitTable and not game.Players.LocalPlayer.Character:FindFirstChild(v.Name) and dist <= 25 
                and not getgenv().NoEquip then
                    game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v.Name))
                end       
                end
                    end
                end
            end
        end)
    end
end))

function Dist()
    local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - getclosest().HumanoidRootPart.Position).Magnitude
    return dist
end

function FindPlayerSkill()
    for i,v in pairs(game.ReplicatedStorage.Settings[game.Players.LocalPlayer.Name]:GetChildren()) do
        if v.Name == "IFrame" or v.Name == "Action" or v.Name == "WalkDisable" then
            return true
        end
    end
end

coroutine.resume(coroutine.create(function()
	while task.wait() do pcall(function()
        if not FindPlayerSkill() then
        else
            if Dist() <= 10 then
            game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
            wait(.5)
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1200,672))
        end
    end
end)
end
end))


coroutine.resume(coroutine.create(function()
    while task.wait(.15) do pcall(function()
        if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or game.Workspace.Lives:FindFirstChild(game.Players.LocalPlayer.Name) == nil  then
        else
        if getgenv().AutoSkillV and Dist() <= 30 and getclosest().Humanoid.Health > 0 and not FindPlayerSkill() then
            game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, nil)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, nil)
        end
        if getgenv().AutoSkillZ and Dist() <= 30 and getclosest().Humanoid.Health > 0 and not FindPlayerSkill() then
            game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, nil)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, nil)
        end
        if getgenv().AutoSkillX and Dist() <= 30 and getclosest().Humanoid.Health > 0 and not FindPlayerSkill() then
            game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, nil)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, nil)
        end
        if getgenv().AutoSkillC and Dist() <= 30 and getclosest().Humanoid.Health > 0 and not FindPlayerSkill() then
            game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, nil)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, nil)
        end
        if getgenv().AutoSkillF and Dist() <= 30 and getclosest().Humanoid.Health > 0 and not FindPlayerSkill() then
            game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "F", false, nil)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "F", false, nil)
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

    function Webhook()
        local timeInfo = os.date("*t")
        local Full = table.concat(RewardCollage,"\n[+1] ")
        BBody = game:GetService("HttpService"):JSONEncode({
            content = nil,
            embeds = {{
                ["author"] = {
                    ["name"] = "CrazyDay",
                    ["icon_url"] = "https://yt3.ggpht.com/ytc/AIdro_ka8akbqZkZq1vfNvenQ4CUg1mDkmo1msvUFaRTBbkl2AQ=s600-c-k-c0x00ffffff-no-rj-rp-mo"
                },
                ["title"] = "Second Piece", 
                ["icon_url"] = "https://tr.rbxcdn.com/514ca219675a6e1e89b4c205898db194/150/150/Image/Png",
                ["footer"] = {
                    ["text"] = "Time : " .. timeInfo.hour .. ":" .. timeInfo.min,
                    ["icon_url"] = "https://tr.rbxcdn.com/514ca219675a6e1e89b4c205898db194/150/150/Image/Png"
                
                },
                ["color"] = tonumber(0xFFD700),
                ["url"] = "https://www.roblox.com/games/15049111150/X2-Second-Piece",
                ["fields"] = {
                
                                {
                        ["name"] = "Dungeon Reward",
                        ["value"] = "Username : ".."||**"..game.Players.LocalPlayer.Name.."**||".."\n[+1] "..Full.."\n"..game.Players.LocalPlayer.PlayerGui.Dungeon.Wave.Text,
                        ["inline"] = false
                        
                    },
                    
                }
                }}
            })
        local response = http_request or request or HttpPost or syn.request
        response({
        Url = Options.WebhookLink.Value,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = BBody
        })    

    end

    function WebhookQuestTask()
    for i,v in pairs(game.Players.LocalPlayer.PlayerGui.ItemRewardGui.Interface.ItemRewardFrame:GetChildren()) do
    if v.ClassName == "Frame" then
    for _,v2 in pairs(v:GetDescendants()) do
    if v2.Name == "WorldModel" then
        for l,v3 in pairs(v2:GetChildren()) do
            local timeInfo = os.date("*t")
            
            BBody = game:GetService("HttpService"):JSONEncode({
                content = nil,
                embeds = {{
                    ["author"] = {
                        ["name"] = "CrazyDay",
                        ["icon_url"] = "https://yt3.ggpht.com/ytc/AIdro_ka8akbqZkZq1vfNvenQ4CUg1mDkmo1msvUFaRTBbkl2AQ=s600-c-k-c0x00ffffff-no-rj-rp-mo"
                    },
                    ["title"] = "Second Piece", 
                    ["icon_url"] = "https://tr.rbxcdn.com/514ca219675a6e1e89b4c205898db194/150/150/Image/Png",
                    ["footer"] = {
                        ["text"] = "Time : " .. timeInfo.hour .. ":" .. timeInfo.min,
                        ["icon_url"] = "https://tr.rbxcdn.com/514ca219675a6e1e89b4c205898db194/150/150/Image/Png"
                    
                    },
                    ["color"] = tonumber(0xFFD700),
                    ["url"] = "https://www.roblox.com/games/15049111150/X2-Second-Piece",
                    ["fields"] = {
                    
                                    {
                            ["name"] = "Quest Hunter Reward",
                            ["value"] = "Username : ".."||**"..game.Players.LocalPlayer.Name.."**||".."\n[+1] "..v3.Name,
                            ["inline"] = false
                            
                        },
                        
                    }
                    }}
                })
            local response = http_request or request or HttpPost or syn.request
            response({
            Url = Options.WebhookLink.Value,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = BBody
            })    
        end
        end
    end
    end
    end
    end

    function WebhookMerchant()
        for i,v in pairs(game.Players.LocalPlayer.PlayerGui.NotifyUI.Frame:GetChildren()) do
            if v.Name == "NotifyText" and string.find(v.Text.Text,"You received") then
                local Split_V = string.split(v.Text.Text, ">")
                local Split_A = string.split(Split_V[2], "<")
        local timeInfo = os.date("*t")
        BBody = game:GetService("HttpService"):JSONEncode({
            content = nil,
            embeds = {{
                ["author"] = {
                    ["name"] = "CrazyDay",
                    ["icon_url"] = "https://yt3.ggpht.com/ytc/AIdro_ka8akbqZkZq1vfNvenQ4CUg1mDkmo1msvUFaRTBbkl2AQ=s600-c-k-c0x00ffffff-no-rj-rp-mo"
                },
                ["title"] = "Second Piece", 
                ["icon_url"] = "https://tr.rbxcdn.com/514ca219675a6e1e89b4c205898db194/150/150/Image/Png",
                ["footer"] = {
                    ["text"] = "Time : " .. timeInfo.hour .. ":" .. timeInfo.min,
                    ["icon_url"] = "https://tr.rbxcdn.com/514ca219675a6e1e89b4c205898db194/150/150/Image/Png"
                
                },
                ["color"] = tonumber(0xFFD700),
                ["url"] = "https://www.roblox.com/games/15049111150/X2-Second-Piece",
                ["fields"] = {
                
                                {
                        ["name"] = "Traveling Merchant",
                        ["value"] = "Username : ".."||**"..game.Players.LocalPlayer.Name.."**||".."\nYou received : "..Split_A[1],
                        ["inline"] = false
                        
                    },
                    
                }
                }}
            })
        local response = http_request or request or HttpPost or syn.request
        response({
        Url = Options.WebhookLink.Value,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = BBody
        })    
    end
    end
    end

    coroutine.resume(coroutine.create(function()
        pcall(function ()
            game.Players.LocalPlayer.PlayerGui.ItemRewardGui.Interface:GetPropertyChangedSignal("Visible"):Connect(function()
            if Options.AutoWebhookDungeon.Value and game.PlaceId ~= 15049111150 then
                wait(.15)
            for i,v in next,game.Players.LocalPlayer.PlayerGui.ItemRewardGui.Interface.ItemRewardFrame:GetChildren() do
                if v.ClassName == "Frame" then
                    for a,b in next,v:GetDescendants() do
                        if b.Name == "WorldModel" then
                            for c,d in next,b:GetChildren() do
                                table.insert(RewardCollage,d.Name)
                                warn("Insert")
                            end
                            end
                    end
                end
            end
        end
        end)
    end)
    end))


    coroutine.resume(coroutine.create(function()
        pcall(function ()
            game.Players.LocalPlayer.PlayerGui.ItemRewardGui.Interface:GetPropertyChangedSignal("Visible"):Connect(function()
                wait(.35)
            if Options.AutoWebhookBountyTask.Value and game.PlaceId == 15049111150 then
                WebhookQuestTask()
                end
            end)
        end)
    end))
        

    coroutine.resume(coroutine.create(function()
        pcall(function () 
            game.Players.LocalPlayer.PlayerGui.Dungeon.Wave:GetPropertyChangedSignal("Text"):Connect(function()
            if Options.AutoWebhookDungeon.Value and game.PlaceId ~= 15049111150 then
                if string.find(game.Players.LocalPlayer.PlayerGui.Dungeon.Wave.Text,"Ended") then
                wait(1)
            Webhook()
                end
                end
            end)
        end)
    end))


    coroutine.resume(coroutine.create(function()
            pcall(function()
                    game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(Kick)
                        if ((Kick.Name == "ErrorPrompt") and Kick:FindFirstChild("MessageArea") and Kick.MessageArea:FindFirstChild("ErrorFrame")) then
                            if Options.AutoRejoinError.Value then
                            game:GetService("TeleportService"):Teleport(15049111150)
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


        end -- End Of If
