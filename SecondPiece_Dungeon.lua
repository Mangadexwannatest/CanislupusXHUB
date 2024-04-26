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
    SubTitle = "Last Update April/26/2024 [YT:CrazyDay/edek#1004]",
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
local GetPlayers = {}
local RewardCollage = {}
local Weapon = {}
local method
local METHOD
do
coroutine.resume(coroutine.create(function()
    pcall(function ()
    for i,v in pairs(game.Players:GetChildren()) do
            table.insert(GetPlayers,v.Name)
        end
    end)
end))

coroutine.resume(coroutine.create(function() pcall(function ()
game.Players.ChildAdded:Connect(function ()
    GetPlayers = {}
          for i,v in pairs(game.Players:GetChildren()) do
            table.insert(GetPlayers,v.Name)
            end
        end)
    end)
end))
    

for i,v in pairs(game.Players.LocalPlayer:WaitForChild("Backpack"):GetChildren()) do
    if v:IsA("Tool") then
        table.insert(Weapon,v.Name)
    end
end

Tabs.Main:AddDropdown("Method", {
    Title = "Select Method",
    Values = {"Behind","Over"},
    Multi = false,
    Default = 1,
})

Tabs.Main:AddSlider("DistanceForMon", 
{
    Title = "Distance",
    Description = nil,
    Default = 6.45,
    Min = 0,
    Max = 10,
    Rounding = 1,
    })

local SelectWp = Tabs.Main:AddDropdown("WeaponSelect", {
    Title = "Select Weapon",
    Values = Weapon,
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

    Tabs.Main:AddButton({
        Title = "Refresh Weapons",
        Description = nil,
        Callback = function()
            Weapon = {}
            for i,v in pairs(game.Players.LocalPlayer:WaitForChild("Backpack"):GetChildren()) do
                if v:IsA("Tool") then
                    table.insert(Weapon,v.Name)
                    SelectWp:SetValue(nil)
                    SelectWp:SetValues(Weapon)
                end
            end
        end
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

    Tabs.Webhook:AddToggle("AutoWebhookDungeon", {Title = "Dungeon Reward", Default = false })
    Tabs.Webhook:AddToggle("AutoWebhookBountyTask", {Title = "Bounty Task Reward", Default = false })
    Tabs.Webhook:AddToggle("AutoWebhookMerchant", {Title = "Merchant Reward", Default = false })
    Tabs.Webhook:AddToggle("MiningWebhook", {Title = "Mining Reward", Default = false })
    Tabs.Webhook:AddParagraph({
        Title = "Chest Reward",
        Content = "(WAIT FOR UPDATE)"
    })
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
        Title = "Last Update April/26/2024",
        Content = "[*] All Bug Shoud be fixed\n[*] Change traget boss spawn first\n[*] Fixed Attack Dummy in dungeon\n[*] Fixed stop farm after merchant\n[*] Fixed after player dead cna't using skill"
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

local function getclosest()
    local MinDistance = math.huge
       local ClosestObject
       for i,v in pairs(game.Workspace.Lives:GetChildren()) do
               local PlayersTable = table.find(GetPlayers,v.Name)
               if not PlayersTable and not v.Name:match("Dummy") and v.Humanoid.Health > 0 then
               local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
               if dist < MinDistance then
                   MinDistance, ClosestObject = dist, v
               end
           end
       end
    return ClosestObject
end


local DiscccccccLAWLDA
local function onCharacterAdded(character)
    local player = game:GetService("Players").LocalPlayer
    local humanoid = character:WaitForChild("Humanoid", 5)
    if not humanoid then
        return
    end
    humanoid.Died:Connect(function()
        getgenv().STOP_ALL = true
        print("PLAYER DEADE : STOP ALL")
        DiscccccccLAWLDA = game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
                game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
                task.wait(1)
                getgenv().STOP_ALL = false
                print("PLAYER SPAWN : START ALL")
                DiscccccccLAWLDA:Disconnect()
        end)
    end)
end

coroutine.resume(coroutine.create(function()
    pcall(function ()
game:GetService("Players").LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
do 
    local alreadyExistingCharacter = game:GetService("Players").LocalPlayer.Character
    if alreadyExistingCharacter then
        onCharacterAdded(alreadyExistingCharacter )
            end
        end
    end)
end))

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
                task.wait(0.5)
                getgenv().Started = true
                end
           end) 
          if getgenv().Started then
            break
        end
    end
end))

  
coroutine.resume(coroutine.create(function()
    while task.wait(1) do pcall(function ()
        if Options.Method.Value == "Behind" then
            method = CFrame.new(0,0,Options.DistanceForMon.Value)
            METHOD = CFrame.new(0,0,100)
        elseif Options.Method.Value == "Over" then
            method = CFrame.new(0,Options.DistanceForMon.Value,0) * CFrame.Angles(math.rad(-90),0,0)
            METHOD = CFrame.new(0,100,0) * CFrame.Angles(math.rad(-90),0,0)
        end
      end)
    end
end))



game.ReplicatedStorage.Settings.ChildAdded:Connect(function (v)
    pcall(function ()
    if v.Name:match("Shadow") and game.PlaceId ~= 15049111150 then
        game.ReplicatedStorage.Settings[v.Name].ChildAdded:Connect(function (c)
            if c.Name == "Action" or c.Name == "IFrame" and not getgenv().STOP_Dodge then
            getgenv().Dodge = true 
            repeat task.wait() until not c.Parent or getgenv().STOP_Dodge
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
                if vv.Name == "Action" or vv.Name == "IFrame" then
                    getgenv().Dodge = true 
                    repeat task.wait() until not vv.Parentw or getgenv().STOP_Dodge
                    getgenv().Dodge = false
                    getgenv().CheckForSome = true
                end
            end
        end
    end
end

game.ReplicatedStorage.Settings[game.Players.LocalPlayer.Name].ChildAdded:Connect(function (v)
    pcall(function ()
    if v.Name == "Action" or v.Name == "IFrame" then
        getgenv().STOP_Dodge = true
        repeat task.wait() until not v.Parent 
        getgenv().STOP_Dodge = false
        if getgenv().CheckForSome then
            Check_To_Dodge()
            getgenv().CheckForSome = false
             end
         end
    end)
end)

coroutine.resume(coroutine.create(function()
    while task.wait() do pcall(function ()
        if getgenv().STOP_ALL then
        else
            if Options.AutoPortal.Value and getgenv().Dodge and not getgenv().STOP_Dodge then
        repeat
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getclosest().HumanoidRootPart.CFrame * METHOD
            task.wait()
        until not getgenv().Dodge or not Options.AutoPortal.Value or getclosest().Humanoid.Health <= 0 
        or getgenv().STOP_Dodge or getgenv().STOP_ALL
        elseif Options.AutoPortal.Value and not getgenv().Dodge then
            game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
        repeat
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getclosest().HumanoidRootPart.CFrame * method
            task.wait()    
        until getgenv().Dodge or not Options.AutoPortal.Value or getclosest().Humanoid.Health <= 0 or getgenv().STOP_ALL
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

local bv = Instance.new("BodyVelocity")
coroutine.resume(coroutine.create(function()
    while wait() do
        pcall(function()
if getget().STOP_ALL then
    game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
    bv.Parent = nil
else
if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
    if Options.AutoPortal.Value then
        game.Players.LocalPlayer.Character.Humanoid.PlatformStand=true
        bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        bv.MaxForce = Vector3.new(10000,10000,10000)
        bv.Velocity = Vector3.new(0,0,0)
    elseif not Options.AutoPortal.Value then
                game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                bv.Parent = nil
                end
            end
         end
      end)
    end
end))

local function Dist()
    local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - getclosest().HumanoidRootPart.Position).Magnitude
    return dist
end

local function FindPlayerSkill()
    for i,v in pairs(game.ReplicatedStorage.Settings[game.Players.LocalPlayer.Name]:GetChildren()) do
        if v.Name == "IFrame" or v.Name == "Action" or v.Name == "WalkDisable" then
            return v
        end
    end
end

coroutine.resume(coroutine.create(function()
    while wait() do pcall(function ()
        if getgenv().STOP_ALL or FindPlayerSkill() then
            repeat task.wait() until not getgenv().STOP_ALL
            task.wait(0.25)
        else
        if Dist() > 30 or game.Players.LocalPlayer.Character:FindFirstChild(Options.WeaponSelect.Value) then
        else
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v.Name == Options.WeaponSelect.Value then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(Options.WeaponSelect.Value))
                end    
                end
                end
            end
        end)
    end
end))


coroutine.resume(coroutine.create(function()
	while task.wait() do pcall(function()
        if getgenv().STOP_ALL or FindPlayerSkill() then
            repeat task.wait() until not getgenv().STOP_ALL
            task.wait(0.25)
        else
        if Dist() <= 10 then
            game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
            task.wait(0.5)
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1200,672))
        end
    end
end)
end
end))


coroutine.resume(coroutine.create(function()
    while task.wait(0.15) do pcall(function()
        if getgenv().STOP_ALL or FindPlayerSkill() then
            repeat task.wait() until not getgenv().STOP_ALL
            task.wait(0.25)
        else
        if getgenv().AutoSkillV and Dist() <= 999 and getclosest().Humanoid.Health > 0 and not FindPlayerSkill() then
            game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, nil)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, nil)
        end
        if getgenv().AutoSkillZ and Dist() <= 999 and getclosest().Humanoid.Health > 0 and not FindPlayerSkill() then
            game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, nil)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, nil)
        end
        if getgenv().AutoSkillX and Dist() <= 999 and getclosest().Humanoid.Health > 0 and not FindPlayerSkill() then
            game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, nil)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, nil)
        end
        if getgenv().AutoSkillC and Dist() <= 999 and getclosest().Humanoid.Health > 0 and not FindPlayerSkill() then
            game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, nil)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, nil)
        end
        if getgenv().AutoSkillF and Dist() <= 999 and getclosest().Humanoid.Health > 0 and not FindPlayerSkill() then
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
             warn("break")
           break
       end
     end
end))


coroutine.resume(coroutine.create(function()
    local Button = game.CoreGui:FindFirstChild("Close/Open"):FindFirstChild("TextButton")
    Button.InputBegan:Connect(function(input)
        if  (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
    for i,v in pairs(game.CoreGui.CrazyDay:GetChildren()) do
            if v.Name == "Frame" and i == 2 then
                v.Visible = not v.Visible
                        end
                    end
                end
           end)
    end))


    coroutine.resume(coroutine.create(function()
        while wait() do pcall(function ()
            if not Options.AutoKenhaki.Value or game.Lighting:FindFirstChild("KenHaki").Enabled then
            else
            if Options.AutoKenhaki.Value and not game.Lighting:FindFirstChild("KenHaki").Enabled then
            game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
            repeat
            game:GetService("ReplicatedStorage").Remotes.SkillHolder:FireServer("KenHaki")  
            wait(1.35)
            until game.Lighting:FindFirstChild("KenHaki").Enabled or not Options.AutoKenhaki.Value
                end
            end   
        end)   
    end
 end))

coroutine.resume(coroutine.create(function()
    while wait() do pcall(function ()
        if not Options.AutoBusohaki.Value or game.Players.LocalPlayer.Character:FindFirstChild("Right Arm"):FindFirstChild("Haki") or getgenv().STOP_ALL then
        else
        if Options.AutoBusohaki.Value then
            game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
            if game.Players.LocalPlayer.Character:FindFirstChild("Right Arm"):FindFirstChild("Haki") == nil then
            game:GetService("ReplicatedStorage").Remotes.SkillHolder:FireServer("BusoHaki")
                    end
                 end
             end  
        end)   
     end
end))

    function Webhook()
        local timeInfo = os.date("*t")
        local Full = table.concat(RewardCollage,"\n[+] ")
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
                        ["value"] = "Username : ".."||**"..game.Players.LocalPlayer.Name.."**||".."\n[+] "..Full.."\n"..game.Players.LocalPlayer.PlayerGui.Dungeon.Wave.Text,
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

    coroutine.resume(coroutine.create(function()
        pcall(function ()
            game.Players.LocalPlayer.PlayerGui.ItemRewardGui.Interface:GetPropertyChangedSignal("Visible"):Connect(function()
            if Options.AutoWebhookDungeon.Value  then
            task.wait(0.15)
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
            game.Players.LocalPlayer.PlayerGui.Dungeon.Wave:GetPropertyChangedSignal("Text"):Connect(function()
            if Options.AutoWebhookDungeon.Value  and string.find(game.Players.LocalPlayer.PlayerGui.Dungeon.Wave.Text,"Ended") then
                task.wait(1)
                Webhook()
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

                local success = pcall(function()
                repeat wait() until game:IsLoaded()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Mangadexwannatest/CanislupusXHUB/main/SecondPiece.lua"))()
                end)
                 
                if not success then
                wait(20)
                repeat wait() until game:IsLoaded()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Mangadexwannatest/CanislupusXHUB/main/SecondPiece.lua"))()
                end
                ]]
                if State == Enum.TeleportState.InProgress and Options.AutoExecuteScript.Value then
                    QueueOnTeleport(script)
                    end
            end)
            end))


        end -- End Of If
