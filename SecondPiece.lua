repeat wait() until game:IsLoaded()
repeat task.wait() until game.Workspace.Lives:FindFirstChild(game.Players.LocalPlayer.Name)
game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")

if game.CoreGui:FindFirstChild("CrazyDay") == nil then
    warn("Loading Gui..")

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Second Piece",
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
    

coroutine.resume(coroutine.create(function()
    pcall(function()
for i,v in pairs(game.Workspace.Quest:GetDescendants()) do
    if v.Name == "Quest" then
        table.insert(QuestTable,v.Value)
             end
           end
    end)
end))

do
    Tabs.Main:AddDropdown("SelectQuest", {
        Title = "Select Quest",
        Values = QuestTable,
        Multi = false,
        Default = nil,
    })

    Tabs.Main:AddToggle("AutoQuest", {Title = "Auto Quest", Default = false })
    Tabs.Main:AddToggle("AutoGem", {Title = "Auto Gem", Default = false })
    Tabs.Main:AddToggle("AutoBossSpawn", {Title = "Auto Boss Spawn", Default = false })

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

     Tabs.Main:AddToggle("AutoAttack", {Title = "Auto Attack", Default = false })
     Tabs.Main:AddToggle("AutoChests", {Title = "Auto Chest", Default = false })

     Tabs.Main:AddSection("Portal")


    local PortalDropdown = Tabs.Main:AddDropdown("Portal", {
        Title = "Select Portal",
        Description = "Tier",
        Values = {"Common", "Uncommon", "Legendary"},
        Multi = true,
        Default = {nil},
    })

        Tabs.Main:AddDropdown("DungeonSelect", {
        Title = "Select World",
        Description = "[Legendary Only]",
        Values = {"Tokyo Prefectural Jujutsu High School"},
        Multi = false,
        Default = 1,
    })

    Tabs.Main:AddToggle("AutoPortal", {Title = "Auto Portal", Default = false })
    Tabs.Main:AddToggle("AutoSpawnPortal", {Title = "Auto Spawn Portal", Default = false })

    Tabs.Main:AddSection("Bounty Task")

    Tabs.Main:AddSlider("HealthDetech", 
{
    Title = "Health % ",
    Description = "Calculated as the max percentage of health",
    Default = 60,
    Min = 10,
    Max = 100,
    Rounding = 0,
    })

    Tabs.Main:AddToggle("AutoBountyHunter", {Title = "Auto Bounty Task", Default = false })


    PortalDropdown:OnChanged(function(Value)
        local Values = {}
        for Value, State in next, Value do
            table.insert(Values, Value)
        end
        if table.find(Values,"Common") then
            getgenv().Common = true
        end
        if table.find(Values,"Uncommon") then
            getgenv().Uncommon = true
        end
        if table.find(Values,"Legendary") then
            getgenv().Legendary = true
        end
        if not table.find(Values,"Common") and getgenv().Common then
            getgenv().Common = false
        end
        if not table.find(Values,"Uncommon") and getgenv().Uncommon then
            getgenv().Uncommon = false
        end
        if not table.find(Values,"Legendary") and getgenv().Legendary then
            getgenv().Legendary = false
        end
    end)

    SkillDropdown:OnChanged(function(Value)
        local Values = {}
        for Value, State in next, Value do
            table.insert(Values, Value)
        end
        if table.find(Values,"Z") then
            getgenv().AutoSkillZ = true
        end
        if table.find(Values,"X") then
            getgenv().AutoSkillX = true
        end
        if table.find(Values,"C") then
            getgenv().AutoSkillC = true
        end
        if table.find(Values,"V") then
            getgenv().AutoSkillV = true
        end
        if table.find(Values,"F") then
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
    Tabs.Other:AddSection("Traveling Merchant")

    local MerchantDropdown = Tabs.Other:AddDropdown("MerchantSelect", {
        Title = "Merchant Item",
        Description = nil,
        Values = {"[Tier 1] Summon Ticket","[Tier 2] Summon Ticket","[Tier 3] Summon Ticket","Demon Fruit Remove Potion","Artifact Remove Potion","Busoshoku Haki Book","Kenbunshoku Haki Book",
        "Infinity Orb","Sukuna Finger","Fishing Rod","Lightning Orb","Holy Grail","Operation Fruit","God Light Fruit","Solar Fruit","Light Fruit","Flame Fruit","Quake Fruit"},
        Multi = true,
        Default = {nil},
    })

    MerchantDropdown:OnChanged(function(Value)
        local Values = {}
        for Value, State in next, Value do
            table.insert(Values, Value)
        end
        if table.find(Values,"[Tier 1] Summon Ticket") and not getgenv().MerchantTicket1 then
            getgenv().MerchantTicket1 = true
        end
        if table.find(Values,"[Tier 2] Summon Ticket") and not getgenv().MerchantTicket2 then
            getgenv().MerchantTicket2 = true
        end
        if table.find(Values,"[Tier 3] Summon Ticket") and not getgenv().MerchantTicket3 then
            getgenv().MerchantTicket3 = true
        end
        if table.find(Values,"Demon Fruit Remove Potion") and not getgenv().DemonRemove then
            getgenv().DemonRemove = true
        end
        if table.find(Values,"Artifact Remove Potion") and not getgenv().ArtifactRemove then
            getgenv().ArtifactRemove = true
        end
        if table.find(Values,"Busoshoku Haki Book") and not getgenv().MerchantBusoHaki then
            getgenv().MerchantBusoHaki = true
        end
        if table.find(Values,"Kenbunshoku Haki Book") and not getgenv().MerchantKenHaki then
            getgenv().MerchantKenHaki = true
        end
        if table.find(Values,"Infinity Orb") and not getgenv().MerchantInfOrb then
            getgenv().MerchantInfOrb = true
        end
        if table.find(Values,"Sukuna Finger") and not getgenv().MerchantSukuna then
            getgenv().MerchantSukuna = true
        end
        if table.find(Values,"Fishing Rod") and not getgenv().MerchantFishRod then
            getgenv().MerchantFishRod = true
        end
        if table.find(Values,"Lightning Orb") and not getgenv().MerchantLightOrb then
            getgenv().MerchantLightOrb = true
        end
        if table.find(Values,"Holy Grail") and not getgenv().MerchantHolyGrail then
            getgenv().MerchantHolyGrail = true
        end
        if table.find(Values,"Operation Fruit") and not getgenv().MerchantOperation then
            getgenv().MerchantOperation = true
        end
        if table.find(Values,"God Light Fruit") and not getgenv().MerchantGodLight then
            getgenv().MerchantGodLight = true
        end
        if table.find(Values,"Solar Fruit") and not getgenv().MerchantSolar then
            getgenv().MerchantSolar = true
        end
        if table.find(Values,"Light Fruit") and not getgenv().MerchantLight then
            getgenv().MerchantLight = true
        end
        if table.find(Values,"Flame Fruit") and not getgenv().MerchantFlame then
            getgenv().MerchantFlame = true
        end
        if table.find(Values,"Quake Fruit") and not getgenv().MerchantQuake then
            getgenv().MerchantQuake = true
        end

        if not table.find(Values,"[Tier 1] Summon Ticket") and getgenv().MerchantTicket1 then
            getgenv().MerchantTicket1 = false
        end
        if not table.find(Values,"[Tier 2] Summon Ticket") and getgenv().MerchantTicket2 then
            getgenv().MerchantTicket2 = false
        end
        if not table.find(Values,"[Tier 3] Summon Ticket") and getgenv().MerchantTicket3 then
            getgenv().MerchantTicket3 = false
        end
        if not table.find(Values,"Demon Fruit Remove Potion") and getgenv().DemonRemove then
            getgenv().DemonRemove = false
        end
        if not table.find(Values,"Artifact Remove Potion") and getgenv().ArtifactRemove then
            getgenv().ArtifactRemove = false
        end
        if not table.find(Values,"Busoshoku Haki Book") and getgenv().MerchantBusoHaki then
            getgenv().MerchantBusoHaki = false
        end
        if not table.find(Values,"Kenbunshoku Haki Book") and getgenv().MerchantKenHaki then
            getgenv().MerchantKenHaki = false
        end
        if not table.find(Values,"Infinity Orb") and getgenv().MerchantInfOrb then
            getgenv().MerchantInfOrb = false
        end
        if not table.find(Values,"Sukuna Finger") and getgenv().MerchantSukuna then
            getgenv().MerchantSukuna = false
        end
        if not table.find(Values,"Fishing Rod") and getgenv().MerchantFishRod then
            getgenv().MerchantFishRod = false
        end
        if not table.find(Values,"Lightning Orb") and getgenv().MerchantLightOrb then
            getgenv().MerchantLightOrb = false
        end
        if not table.find(Values,"Holy Grail") and getgenv().MerchantHolyGrail then
            getgenv().MerchantHolyGrail = false
        end
        if not table.find(Values,"Operation Fruit") and getgenv().MerchantOperation then
            getgenv().MerchantOperation = false
        end
        if not table.find(Values,"God Light Fruit") and getgenv().MerchantGodLight then
            getgenv().MerchantGodLight = false
        end
        if not table.find(Values,"Solar Fruit") and getgenv().MerchantSolar then
            getgenv().MerchantSolar = false
        end
        if not table.find(Values,"Light Fruit") and  getgenv().MerchantLight then
            getgenv().MerchantLight = false
        end
        if not table.find(Values,"Flame Fruit") and  getgenv().MerchantFlame then
            getgenv().MerchantFlame = false
        end
        if not table.find(Values,"Quake Fruit") and  getgenv().MerchantQuake then
            getgenv().MerchantQuake = false
        end

    end)

    Tabs.Other:AddToggle("AutoBuyMerchantItem", {Title = "Auto Merchant", Default = false })

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
    Tabs.Other:AddToggle("AutoKenhaki", {Title = "Auto Ken Haki", Default = false })
    Tabs.Other:AddToggle("AutoBusohaki", {Title = "Auto Buso Haki", Default = false })
    Tabs.Other:AddToggle("AutoRejoinError", {Title = "Auto Rejoin When Disconnect ", Default = false })
    Tabs.Other:AddToggle("AutoWhiteScreen", {Title = "Auto White Screen", Default = false })
    Tabs.Other:AddToggle("AutoCloseAfterExecute", {Title = "Auto Close Gui After Execute", Default = false })
    Tabs.Other:AddToggle("AutoExecuteScript", {Title = "Auto Execute Script", Default = false })

    local UpdateLog = Tabs.Other:AddSection("Update Log")

    UpdateLog:AddParagraph({
        Title = "Last Update April/07/2024",
        Content = "[+] Auto Merchant\n[+] Webhook Merchant\n[+] Auto Spawn Portal\n[+] Auto Close Gui After Execute\n[+] Auto Execute Script\n     [-] Working for some executor"
    })
    

end -- End Of Do

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

coroutine.resume(coroutine.create(function()
    while wait() do pcall(function ()
            for i,v in next, BackPackGet do
                local MeleeTable = table.find(MeeleeWeapon,v.Name)
                local SwordTable = table.find(SwordWeapon,v.Name)
                local DemonFruitTable = table.find(FruitsWeapon,v.Name)
                for _,c in next,game.Workspace.Lives:GetChildren() do
                    if c.ClassName == "Model" and c.Name ~= game.Players.LocalPlayer.Name then
                    local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - c.HumanoidRootPart.Position).Magnitude
                if Options.Weapon.Value == "Melee" and MeleeTable and not game.Players.LocalPlayer.Character:FindFirstChild(v.Name) and dist <= 25 
                and not getgenv().NoEquip then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v.Name))
                end
                if  Options.Weapon.Value == "Sword" and SwordTable and not game.Players.LocalPlayer.Character:FindFirstChild(v.Name) and dist <= 25
                and not getgenv().NoEquip  then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v.Name))
                end
                if  Options.Weapon.Value == "DemonFruit" and DemonFruitTable and not game.Players.LocalPlayer.Character:FindFirstChild(v.Name) and dist <= 25 
                and not getgenv().NoEquip then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v.Name))
                        end
                    end
                end
            end
        end)
    end
end))

coroutine.resume(coroutine.create(function()
	while task.wait(.35) do pcall(function()
		if Options.AutoAttack.Value and not getgenv().STOP then
            for i,v in pairs(game.Workspace.Lives:GetChildren()) do
                if v.ClassName == "Model" and v.Name ~= game.Players.LocalPlayer.Name then
                    local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                    if dist <= 25 then
            game:GetService'VirtualUser':CaptureController()
            game:GetService'VirtualUser':Button1Down(Vector2.new(1200,672))
                    end
                end
            end
            end
	   end)
	end
end))

coroutine.resume(coroutine.create(function()
	while task.wait(.5) do pcall(function()
		if getgenv().AutoSkillZ and not getgenv().STOP then
            for i,v in pairs(game.Workspace.Lives:GetChildren()) do
                if v.ClassName == "Model" and v.Name ~= game.Players.LocalPlayer.Name then
                    local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                    if dist <=25 then
			game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, nil)
			game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, nil)
                    end
                end
               end
		   end
	   end)
	end
end))

coroutine.resume(coroutine.create(function()
	while task.wait(.75) do pcall(function()
		if getgenv().AutoSkillX and not getgenv().STOP then
            for i,v in pairs(game.Workspace.Lives:GetChildren()) do
                if v.ClassName == "Model" and v.Name ~= game.Players.LocalPlayer.Name then
                    local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                    if dist <= 25 then
			game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, nil)
			game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, nil)
                    end
                end
            end
		   end
	   end)
	end
end))

coroutine.resume(coroutine.create(function()
	while task.wait(.55) do pcall(function()
		if getgenv().AutoSkillC and not getgenv().STOP then
            for i,v in pairs(game.Workspace.Lives:GetChildren()) do
                if v.ClassName == "Model" and v.Name ~= game.Players.LocalPlayer.Name then
                    local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                    if dist <= 25 then
			game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, nil)
			game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, nil)
                    end
                end

            end
		   end
	   end)
	end
end))

coroutine.resume(coroutine.create(function()
	while task.wait(.75) do pcall(function()
		if getgenv().AutoSkillV and not getgenv().STOP then
            for i,v in pairs(game.Workspace.Lives:GetChildren()) do
                if v.ClassName == "Model" and v.Name ~= game.Players.LocalPlayer.Name then
                    local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                    if dist <= 25 then
			game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, nil)
			game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, nil)
                    end
                end
            end
		   end
	   end)
	end
end))

coroutine.resume(coroutine.create(function()
	while task.wait(.55) do pcall(function()
		if getgenv().AutoSkillF and not getgenv().STOP then
            for i,v in pairs(game.Workspace.Lives:GetChildren()) do
                if v.ClassName == "Model" and v.Name ~= game.Players.LocalPlayer.Name then
                    local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                    if dist <= 25 then
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
    while task.wait() do pcall(function ()
        if Options.AutoChests.Value then
            for i,v in pairs(game.Workspace.Chests:GetDescendants()) do
                if v.Name == "ProximityPrompt" then
                    fireproximityprompt(v)
                   end
                end            
             end
         end)  
    end 
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
	while task.wait() do pcall(function ()
		if Options.AutoPortal.Value and game.PlaceId == 15049111150 and not getgenv().InPorTal then
			for i,v in pairs(game.Workspace.World.Portal:GetChildren()) do
				if getgenv().Common and v.Name == "1" and not getgenv().InPorTal then
                        getgenv().STOP = true
                        getgenv().StopHealthDetech = true
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0,-8,0)
                        getgenv().EnterNow = true
					   end
                if getgenv().Uncommon and v.Name == "2" and not getgenv().InPorTal then
                        getgenv().STOP = true
                        getgenv().StopHealthDetech = true
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0,-8,0)
                        getgenv().EnterNow = true
					   end
                if getgenv().Legendary and v.Name == "3" and not getgenv().InPorTal then
                        getgenv().STOP = true
                        getgenv().StopHealthDetech = true
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0,-8,0)
                        getgenv().EnterNow = true
					   end
				 end
			  end
		  end) 
	   end
  end))


  coroutine.resume(coroutine.create(function()
    while wait() do pcall(function ()
        if Options.AutoPortal.Value and game.PlaceId == 15049111150  then
            for i,v in pairs(game.Workspace.World.Portal:GetDescendants()) do
                if v.Name == "Frame" and v:FindFirstChild(game.Players.LocalPlayer.Name) == nil then
                    local clickThis = v.Parent.Parent.ProximityPrompt
                    if getgenv().EnterNow and not getgenv().InBossHunt then
                        repeat task.wait()
                        fireproximityprompt(clickThis)
                        until v:FindFirstChild(game.Players.LocalPlayer.Name) ~= nil
                    getgenv().InPorTal = true
                   end
                end
            end
         end
     end)
    end
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
        while task.wait() do pcall(function ()
            if Options.AutoPortal.Value and game.PlaceId ~= 15049111150 then
              if getclosest().Humanoid.Health > 0 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                repeat 
                    task.wait()
                    game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getclosest().HumanoidRootPart.CFrame * CFrame.new(0,0,4)
                until getclosest().Humanoid.Health <= 0 or not Options.AutoPortal.Value
                  end
               end
            end)  
            if Options.AutoPortal.Value and game.PlaceId ==  15049111150 then
              print("Not In Dungeon. . .")
                break
            end
        end
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

    coroutine.resume(coroutine.create(function()
        while wait() do
            pcall(function ()
                if Options.AutoQuest.Value and not getgenv().DontAcceptQuest  and game.PlaceId == 15049111150 and not getgenv().STOP and getgenv().QuestHuntOnCoolDown 
                and not getgenv().InMerchant then
                    for i,v in pairs(game.Players.LocalPlayer:GetChildren()) do 
                        if v.Name == "PlayerGui" and v:FindFirstChild("QuestUI") == nil then
                            getgenv().NoQuest = true
                        elseif v:FindFirstChild("QuestUI") ~= nil then
                            getgenv().NoQuest = false
                        end
                    end
                end
            end)
        end
    end))
    
    coroutine.resume(coroutine.create(function()
        while wait() do pcall(function ()
            if Options.AutoQuest.Value and not getgenv().DontAcceptQuest and not getgenv().STOP and not getgenv().InBossHunt and getgenv().QuestHuntOnCoolDown and game.PlaceId == 15049111150 
            and not getgenv().InMerchant then
                for i,v in pairs(game.Workspace.Quest:GetDescendants()) do
                    if v.Name == "Quest" then
                        if v.Value == Options.SelectQuest.Value then
                            if getgenv().NoQuest and not getgenv().DontAcceptQuest then
                                repeat 
                                    wait()
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.Parent.CFrame
                                fireproximityprompt(v.Parent)
                                until not Options.AutoQuest.Value or not getgenv().NoQuest or getgenv().DontAcceptQuest or getgenv().InBossHunt or not getgenv().QuestHuntOnCoolDown or getgenv().InMerchant
                            end
                        end
                    end
                end
            end
          end)
        end
    end))



     coroutine.resume(coroutine.create(function()
        while  wait() do pcall(function ()
            if Options.AutoQuest.Value and not getgenv().DontAcceptQuest and not getgenv().STOP and not getgenv().InBossHunt and getgenv().QuestHuntOnCoolDown and game.PlaceId == 15049111150 
            and not getgenv().InMerchant then
                for i,v in pairs(game.Workspace.Quest:GetDescendants()) do
                    if v.Name == "Quest" and v.Value == Options.SelectQuest.Value and not getgenv().NoQuest then
                                for _,mon in pairs(game.Workspace.Lives:GetChildren()) do
                                    if string.find(mon.Name,Options.SelectQuest.Value) then
                                        if mon.Humanoid.Health > 0 then
                                            repeat task.wait()
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = mon.HumanoidRootPart.CFrame * CFrame.new(0,0,4)
                                        until mon.Humanoid.Health <= 0 or not Options.AutoQuest.Value or getgenv().NoQuest or getgenv().DontAcceptQuest
                                        or getgenv().InBossHunt or getgenv().STOP or not getgenv().QuestHuntOnCoolDown or getgenv().InMerchant
                                    end
                                end
                            end
                        end
                    end
                end
           end)
        end
    end))

    coroutine.resume(coroutine.create(function()
        while wait() do pcall(function ()
            if  Options.AutoGem.Value and not getgenv().StopFarmGem and not getgenv().STOP and not getgenv().InBossHunt and getgenv().QuestHuntOnCoolDown and game.PlaceId == 15049111150 
            and not getgenv().InMerchant then
                for i,v in pairs(game.Workspace.Lives:GetChildren()) do
                    if string.find(v.Name,BossTable[1]) or string.find(v.Name,BossTable[2]) 
                    or string.find(v.Name,BossTable[3]) or string.find(v.Name,BossTable[4])  
                    and not getgenv().InMerchant then
                        if v.Humanoid.Health > 0 then
                            repeat
                                task.wait()
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,4)
                                getgenv().DontAcceptQuest = true
                         until v.Humanoid.Health <= 0 or not Options.AutoGem.Value or getgenv().StopFarmGem or getgenv().InBossHunt or getgenv().STOP or not getgenv().QuestHuntOnCoolDown
                            getgenv().DontAcceptQuest = false or getgenv().InMerchant
                        end
                    end
                    end
                end
            
            end)
        end 
    end))

    coroutine.resume(coroutine.create(function()
        while wait() do pcall(function ()
            if Options.AutoBossSpawn.Value and not getgenv().STOP and not getgenv().InBossHunt and getgenv().QuestHuntOnCoolDown and game.PlaceId == 15049111150 
            and not getgenv().InMerchant then
                game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
                for i,v in pairs(game.Workspace.Lives:GetChildren()) do
                    if string.find(v.Name,"Natsu") or string.find(v.Name,"Tatsumaki") or string.find(v.Name,"Artoria") or string.find(v.Name,"Sukuna") or string.find(v.Name,"Gojo") or string.find(v.Name,"Kashimo") 
                    or string.find(v.Name,"Choso") or string.find(v.Name,"Killua")  or string.find(v.Name,"Chxmei") or string.find(v.Name,"Cid") and not getgenv().STOP and not getgenv().InBossHunt
                    and not getgenv().InMerchant  then
                        if v.Humanoid.Health > 0 and getgenv().QuestHuntOnCoolDown then
                            repeat task.wait()
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,4)
                                getgenv().DontAcceptQuest = true
                                getgenv().StopFarmGem = true
                                until v.Humanoid.Health <= 0 or getgenv().STOP or not Options.AutoBossSpawn.Value or getgenv().InBossHunt or not getgenv().QuestHuntOnCoolDown or getgenv().InMerchant
                                getgenv().DontAcceptQuest = false   
                                getgenv().StopFarmGem = false
                        end
                    end
                 end
               end
          end)
        end
    end))
    
    coroutine.resume(coroutine.create(function()
        while wait() do pcall(function ()
            if not Options.AutoBossSpawn.Value and getgenv().DontAcceptQuest then
                getgenv().DontAcceptQuest = false
            end
            if not Options.AutoBossSpawn.Value and getgenv().StopFarmGem then
                getgenv().StopFarmGem = false
            end 
          end) 
        end
    end))
    

    coroutine.resume(coroutine.create(function()
        while wait() do pcall(function ()
            if not game.Workspace:FindFirstChild("Safe Part") and game.PlaceId == 15049111150 then
                local SafePart = Instance.new("Part" , Workspace)
                SafePart.Name = "Safe Part"
                SafePart.CanCollide = true
                SafePart.Transparency = 0
                SafePart.Anchored = true
                SafePart.Size = Vector3.new(10,2,10)
                SafePart.CFrame = game.Workspace.NPC.Kuru.HumanoidRootPart.CFrame * CFrame.new(0,1000,0)
                end
          end)
          if game.Workspace:FindFirstChild("Safe Part") or game.PlaceId ~= 15049111150 then
            break
        end
        end
    end))


    coroutine.resume(coroutine.create(function()
        while wait() do pcall(function ()
            if Options.AutoBountyHunter.Value and game.PlaceId == 15049111150 and not getgenv().StopHealthDetech  then
                local HPTax = game.Players.LocalPlayer.PlayerGui.MainUI.Interface.PlayerStatus.Hp.Frame.TextLabel.Text
                local HpSplit = string.split(HPTax, "/")
                local HealthPercent = Options.HealthDetech.Value * (HpSplit[2] / 100)  
            if game.Players.LocalPlayer.Character.Humanoid.Health <= tonumber(HealthPercent) then
                getgenv().STOP = true
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace:FindFirstChild("Safe Part").CFrame * CFrame.new(0,3,0)
            else
                getgenv().STOP = false
                   end
                end
           end)
        end
    end))

    coroutine.resume(coroutine.create(function()
        while task.wait() do pcall(function ()
            if Options.AutoBountyHunter.Value then
                for i,v in pairs(game.Players.LocalPlayer.PlayerGui.NotifyUI.Frame:GetChildren()) do
                    if v.Name == "NotifyText" then
                        if string.find(v.Text.Text,"on cooldown") then
                            getgenv().QuestHuntOnCoolDown = true
                            getgenv().InBossHunt = false
                            wait(30.5)
                            getgenv().QuestHuntOnCoolDown = false

                        end
                    end
                end
              end
           end)  
        end
    end))
    
    local TimeChecker = 0

    coroutine.resume(coroutine.create(function()
        while wait(1) do pcall(function ()
            if Options.AutoBountyHunter.Value then
                local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace.NPC.Kuru.HumanoidRootPart.Position).Magnitude
                if dist <= 15 then
                    TimeChecker = TimeChecker + 1
                    if tonumber(TimeChecker) >= tonumber(45) then
                        print("SET : "..TimeChecker)
                        TimeChecker = 0
                        game.Players.LocalPlayer.Character.Humanoid.Health = 0
                    end
                 end
                     if getgenv().InBossHunt and TimeChecker ~= 0 then
                        TimeChecker = 0
                     end
                    if getgenv().QuestHuntOnCoolDown and TimeChecker ~= 0 then
                        TimeChecker = 0
                    end
                    if getgenv().STOP and TimeChecker ~= 0 then
                        TimeChecker = 0
                        end
                 end
            end) 
     end
end))


    
      coroutine.resume(coroutine.create(function()
        while task.wait() do pcall(function ()
            if Options.AutoBountyHunter.Value and not getgenv().InBossHunt and not getgenv().QuestHuntOnCoolDown and not getgenv().STOP
            and not getgenv().InMerchant then
                    if not getgenv().STOP and not getgenv().InBossHunt and not getgenv().QuestHuntOnCoolDown then
                        repeat 
                           wait(.85)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.NPC.Kuru.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
                            fireproximityprompt(game.Workspace.NPC.Kuru.HumanoidRootPart.Task)
                            until getgenv().InBossHunt or getgenv().QuestHuntOnCoolDown or not Options.AutoBountyHunter.Value or getgenv().STOP 
                            or getgenv().InMerchant
                        end
                   end
            end)
         end
    end))
    

    coroutine.resume(coroutine.create(function()
        while wait() do pcall(function ()
            if Options.AutoBountyHunter.Value and not getgenv().STOP and not getgenv().InMerchant then
            for i,v in pairs(game.Workspace.Lives:GetChildren()) do
                if string.find(v.Name,"Criminal") and v.Humanoid.Health > 0 and v.TaskBy.Value == game.Players.LocalPlayer.Name and not getgenv().STOP then
                    getgenv().InBossHunt = true
                    repeat task.wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,4)
                    until v.Humanoid.Health <= 0 or getgenv().STOP or not Options.AutoBountyHunter.Value or game.PlaceId ~= 15049111150
                    or getgenv().InMerchant
                    getgenv().InBossHunt = false
                    end
                end
             end
          end)
        end
    end))
    
    
    coroutine.resume(coroutine.create(function()
        while wait() do pcall(function ()
            if Options.AutoBountyHunter.Value then
                for i,v in pairs(game.Players.LocalPlayer.PlayerGui.ItemRewardGui.Interface.ItemRewardFrame:GetChildren()) do
                    if v.ClassName == "Frame" then
                        getgenv().QuestHuntOnCoolDown = true
                        getgenv().InBossHunt = false
                        wait(30.5)
                        getgenv().QuestHuntOnCoolDown = false
                    end
                end
              end
           end) 
        end
    end))

    local function onCharacterAdded(character)
        local player = game:GetService("Players").LocalPlayer
        local humanoid = character:WaitForChild("Humanoid", 5)
        if not humanoid then
            return
        end
        humanoid.Died:Connect(function()
            if Options.AutoBountyHunter.Value then
                game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
                    game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
                    wait(.5)
                    getgenv().InBossHunt = false
                    getgenv().QuestHuntOnCoolDown = false
                    getgenv().InMerchant = false
                end)
            end
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
      while wait() do pcall(function ()
      if not Options.AutoBountyHunter.Value and not getgenv().QuestHuntOnCoolDown then
          getgenv().QuestHuntOnCoolDown = true
          getgenv().DoubleCheck = true
      elseif Options.AutoBountyHunter.Value and getgenv().QuestHuntOnCoolDown and getgenv().DoubleCheck then
          getgenv().QuestHuntOnCoolDown = false
          getgenv().DoubleCheck = false
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
      local response = syn.request({
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
          local response = syn.request({
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
      local response = syn.request({
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
        while wait() do
            pcall(function()
                if Options.AutoWhiteScreen.Value then
                    game:GetService("RunService"):Set3dRenderingEnabled(false)
                elseif not Options.AutoWhiteScreen.Value then
                    game:GetService("RunService"):Set3dRenderingEnabled(true)
                    end
                end)
            end
        end))

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
                if v.Name == "Frame" and i == 2 then
                    v.Visible = not v.Visible
                            end
                        end
                end)
            end)
        end))
        

        coroutine.resume(coroutine.create(function()
            while wait() do pcall(function ()
                if Options.AutoBuyMerchantItem.Value and not game.Players.LocalPlayer.PlayerGui.MerchantUI.Enabled and not getgenv().AlrBuy and not getgenv().STOP then
                    for i,v in pairs(game.Workspace.NPC:GetChildren()) do
                        if v.Name == "Traveling merchant" then
                    repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,5,0)
                    fireproximityprompt(v.HumanoidRootPart.Merchant)
                    getgenv().InMerchant = true
                    until not Options.AutoBuyMerchantItem.Value or game.Players.LocalPlayer.PlayerGui.MerchantUI.Enabled or getgenv().AlrBuy or getgenv().STOP
                    getgenv().InMerchant = false
                end
            end
                end
              end)
           end
        end))

        coroutine.resume(coroutine.create(function()
            while wait() do pcall(function ()
                if game.PlaceId == 15049111150 then
                    for i,v in pairs(game.Workspace.NPC:GetChildren()) do
                if game.Workspace.NPC:FindFirstChild("Traveling merchant") == nil and getgenv().InMerchant then
                    getgenv().InMerchant = false
                end
                if game.Workspace.NPC:FindFirstChild("Traveling merchant") == nil and getgenv().AlrBuy then
                    getgenv().AlrBuy = false
                end
                if v.Name == "Traveling merchant" then 
                    local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                if dist >= 20 then
                    wait(7.5)
                    game.Players.LocalPlayer.PlayerGui.MerchantUI.Enabled = false
                end
                 end
                    end
                 end
            end)
        end
    end))
    


        
        coroutine.resume(coroutine.create(function()
            while wait() do pcall(function ()
            if Options.AutoBuyMerchantItem.Value and game.PlaceId == 15049111150 and game.Players.LocalPlayer.PlayerGui.MerchantUI.Enabled then
                    for i,v in pairs(game.Players.LocalPlayer.PlayerGui.MerchantUI.Interface.Merchant.ItemFrame:GetChildren()) do
                        if getgenv().MerchantTicket1 and v.Name == "[Tier 1] Summon Ticket" then
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","[Common] Portal Summon Ticket")
                            wait(.25)
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","[Common] Portal Summon Ticket")
                            v:Destroy()
                            wait(1)
                            getgenv().AlrBuy = true
                            getgenv().InMerchant = false
                        end
                        if getgenv().MerchantTicket2 and v.Name == "[Tier 2] Summon Ticket" then
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","[Rare] Portal Summon Ticket")
                            wait(.25)
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","[Rare] Portal Summon Ticket")
                            v:Destroy()
                            wait(1)
                            getgenv().AlrBuy = true
                            getgenv().InMerchant = false
                        end
                        if getgenv().MerchantTicket3 and v.Name == "[Tier 3] Summon Ticket" then
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","[Legendary] Portal Summon Ticket")
                            wait(.25)
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","[Legendary] Portal Summon Ticket")
                            v:Destroy()
                            wait(1)
                            getgenv().AlrBuy = true
                            getgenv().InMerchant = false
                        end
                        if getgenv().DemonRemove  and v.Name == "Demon Fruit Remove Potion" then
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Demon Fruit Remove Potion")
                            wait(.25)
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Demon Fruit Remove Potion")
                            v:Destroy()
                            wait(1)
                            getgenv().AlrBuy = true
                            getgenv().InMerchant = false
                        end
                        if getgenv().ArtifactRemove  and v.Name == "Artifact Remove Potion" then
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Artifact Remove Potion")
                            wait(.25)
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Artifact Remove Potion")
                            v:Destroy()
                            wait(1)
                            getgenv().AlrBuy = true
                            getgenv().InMerchant = false
                        end
                        if getgenv().MerchantBusoHaki  and v.Name == "Busoshoku Haki Book" then
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Busoshoku Haki Book")
                            wait(.25)
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Busoshoku Haki Book")
                            v:Destroy()
                            wait(1)
                            getgenv().AlrBuy = true
                            getgenv().InMerchant = false
                        end
                        if getgenv().MerchantKenHaki  and v.Name == "Kenbunshoku Haki Book" then
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Kenbunshoku Haki Book")
                            wait(.25)
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Kenbunshoku Haki Book")
                            v:Destroy()
                            wait(1)
                            getgenv().AlrBuy = true
                            getgenv().InMerchant = false
                        end
                        if getgenv().MerchantInfOrb and v.Name == "Infinity Orb" then
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Infinity Orb")
                            wait(.25)
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Infinity Orb")
                            v:Destroy()
                            wait(1)
                            getgenv().AlrBuy = true
                            getgenv().InMerchant = false
                        end
                        if getgenv().MerchantSukuna and v.Name == "Sukuna Finger" then
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","SukunaFinger")
                            wait(.25)
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","SukunaFinger")
                            v:Destroy()
                            wait(1)
                            getgenv().AlrBuy = true
                            getgenv().InMerchant = false
                        end
                        if getgenv().MerchantFishRod and v.Name == "Fishing Rod" then
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Fishing Rod")
                            wait(.25)
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Fishing Rod")
                            v:Destroy()
                            wait(1)
                            getgenv().AlrBuy = true
                            getgenv().InMerchant = false
                        end
                        if getgenv().MerchantLightOrb and v.Name == "Lightning Orb" then
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Lightning Orb")
                            wait(.25)
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Lightning Orb")
                            v:Destroy()
                            wait(1)
                            getgenv().AlrBuy = true
                            getgenv().InMerchant = false
                        end
                        if getgenv().MerchantHolyGrail  and v.Name == "Holy Grail" then
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Holy Grail")
                            wait(.25)
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Holy Grail")
                            v:Destroy()
                            wait(1)
                            getgenv().AlrBuy = true
                            getgenv().InMerchant = false
                        end
                        if getgenv().MerchantOperation  and v.Name == "Operation Fruit" then
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Operation")
                            wait(.25)
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Operation")
                            v:Destroy()
                            wait(1)
                            getgenv().AlrBuy = true
                            getgenv().InMerchant = false
                        end
                        if getgenv().MerchantGodLight and v.Name == "God Light Fruit" then
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","GodLight")
                            wait(.25)
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","GodLight")
                            v:Destroy()
                            wait(1)
                            getgenv().AlrBuy = true
                            getgenv().InMerchant = false
                        end
                        if getgenv().MerchantSolar and v.Name == "Solar Fruit" then
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Solar")
                            wait(.25)
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Solar")
                            v:Destroy()
                            wait(1)
                            getgenv().AlrBuy = true
                            getgenv().InMerchant = false
                        end
                        if getgenv().MerchantLight  and v.Name == "Light Fruit" then
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Light")
                            wait(.25)
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Light")
                            v:Destroy()
                            wait(1)
                            getgenv().AlrBuy = true
                            getgenv().InMerchant = false
                        end
                        if getgenv().MerchantFlame and v.Name == "Flame Fruit" then
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Flame")
                            wait(.25)
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Flame")
                            v:Destroy()
                            wait(1)
                            getgenv().AlrBuy = true
                            getgenv().InMerchant = false
                        end
                        if getgenv().MerchantQuake  and v.Name == "Quake Fruit" then
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Quake")
                            wait(.25)
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","Quake")
                            v:Destroy()
                            wait(1)
                            getgenv().AlrBuy = true
                            getgenv().InMerchant = false
                        end
                end
            end
        end)
            end
        end))

        coroutine.resume(coroutine.create(function()
            while wait() do pcall(function ()
                if Options.AutoWebhookMerchant.Value and game.PlaceId == 15049111150 then
                    if game.Players.LocalPlayer.PlayerGui.MerchantUI.Enabled then
                    for i,v in pairs(game.Players.LocalPlayer.PlayerGui.NotifyUI.Frame:GetChildren()) do
                        if v.Name == "NotifyText" and string.find(v.Text.Text,"You received") then
                            WebhookMerchant()
                            wait(1)
                        end
                        end
                    end
                end
            end)
        end
    end))


    coroutine.resume(coroutine.create(function()
        while wait() do pcall(function ()
        if Options.AutoSpawnPortal.Value and game.PlaceId == 15049111150 and not getgenv().EnterNow then
            for i,v in pairs(game.Players.LocalPlayer.PlayerGui.MainUI.Interface.Inventory.ItemsFrame:GetChildren()) do
                for _,k in pairs(game.Players.LocalPlayer:GetChildren()) do 
                if getgenv().Legendary and string.find(v.Name,"Legendary") then
                getgenv().SpawnLegend = true getgenv().SpawnLegendDetech = true getgenv().NoEquip = true
                if game.Players.LocalPlayer.Backpack:FindFirstChild("[Tier 3] Summon Ticket") == nil and not game.Players.LocalPlayer.Character:FindFirstChild("[Tier 3] Summon Ticket") 
                and not getgenv().STOPEquipTicket then
                   game:GetService("ReplicatedStorage").Remotes.EquipItem:FireServer("[Legendary] Portal Summon Ticket")
                end
                end
                if getgenv().Uncommon and string.find(v.Name,"Rare") and not getgenv().SpawnLegend and not getgenv().SpawnLegendDetech then
                getgenv().SpawnRare = true getgenv().SpawnRareDetech = true getgenv().NoEquip = true
                if game.Players.LocalPlayer.Backpack:FindFirstChild("[Tier 2] Summon Ticket") == nil and not game.Players.LocalPlayer.Character:FindFirstChild("[Tier 2] Summon Ticket") 
                and not getgenv().STOPEquipTicket then
                   game:GetService("ReplicatedStorage").Remotes.EquipItem:FireServer("[Rare] Portal Summon Ticket")
                end
                end
                if getgenv().Common and string.find(v.Name,"Common") and not getgenv().SpawnLegend and not getgenv().SpawnRare and not getgenv().SpawnLegendDetech and not getgenv().SpawnRareDetech then
                getgenv().SpawnCommon = true getgenv().NoEquip = true 
                if game.Players.LocalPlayer.Backpack:FindFirstChild("[Tier 1] Summon Ticket") == nil and not game.Players.LocalPlayer.Character:FindFirstChild("[Tier 1] Summon Ticket") 
                and not getgenv().STOPEquipTicket then
                    game:GetService("ReplicatedStorage").Remotes.EquipItem:FireServer("[Common] Portal Summon Ticket")
                end
                end
                if not getgenv().Legendary and getgenv().SpawnLegend and getgenv().SpawnLegendDetech then 
                    getgenv().SpawnLegend = false
                    getgenv().SpawnLegendDetech = false
                end
                if not getgenv().Uncommon and getgenv().SpawnRare and getgenv().SpawnRareDetech then
                    getgenv().SpawnRare = false
                    getgenv().SpawnRareDetech =false
                end

                if  getgenv().SpawnLegend and not game.Players.LocalPlayer.Character:FindFirstChild("[Tier 3] Summon Ticket")  then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("[Tier 3] Summon Ticket"))
                end
                if  getgenv().SpawnRare and not game.Players.LocalPlayer.Character:FindFirstChild("[Tier 2] Summon Ticket")  then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("[Tier 2] Summon Ticket"))
                end
                if  getgenv().SpawnCommon and not game.Players.LocalPlayer.Character:FindFirstChild("[Tier 1] Summon Ticket")  then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("[Tier 1] Summon Ticket"))
                end
    
                if k.Name == "PlayerGui" and k:FindFirstChild("ItemUseUI") == nil and
                getgenv().Legendary and getgenv().SpawnLegend and game.Players.LocalPlayer.Character:FindFirstChild("[Tier 3] Summon Ticket") and not getgenv().EnterNow 
                and not getgenv().STOPUserTicket then
                    getgenv().STOPEquipTicket = true
                    game:GetService("ReplicatedStorage").Remotes.UseItemFromClient:FireServer("[Tier 3] Summon Ticket")
                    wait(1)
                end
                if k.Name == "PlayerGui" and k:FindFirstChild("ItemUseUI") == nil and
                getgenv().Uncommon and getgenv().SpawnRare and game.Players.LocalPlayer.Character:FindFirstChild("[Tier 2] Summon Ticket") and not getgenv().EnterNow 
                and not getgenv().STOPUserTicket then
                    getgenv().STOPEquipTicket = true
                    game:GetService("ReplicatedStorage").Remotes.UseItemFromClient:FireServer("[Tier 2] Summon Ticket")
                    wait(1)
                end
                if k.Name == "PlayerGui" and k:FindFirstChild("ItemUseUI") == nil and
                getgenv().Common and getgenv().SpawnCommon and game.Players.LocalPlayer.Character:FindFirstChild("[Tier 1] Summon Ticket") and not getgenv().EnterNow 
                and not getgenv().STOPUserTicket then
                    getgenv().STOPEquipTicket = true
                    game:GetService("ReplicatedStorage").Remotes.UseItemFromClient:FireServer("[Tier 1] Summon Ticket")
                    wait(1)
                end   

                if k.Name == "PlayerGui" and k:FindFirstChild("ItemUseUI") ~= nil and k:FindFirstChild("DungeonSelect") == nil and not getgenv().EnterNow 
                and not getgenv().STOPPressYes then
                    getgenv().STOPUserTicket = true
                    firesignal(k.ItemUseUI.Interface.ItemFrame.Menu.Yes.MouseButton1Click)
                end
                if k.Name == "PlayerGui" and k:FindFirstChild("DungeonSelect") ~= nil and not getgenv().EnterNow then 
                    getgenv().STOPPressYes = true
                    firesignal(k.DungeonSelect.Interface.Frame.List[Options.DungeonSelect.Value].Label.MouseButton1Down)
                end
            end
        end
    end
        if not Options.AutoSpawnPortal.Value and getgenv().NoEquip then
            getgenv().NoEquip = false
        end
    end)
    end
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
        pcall(function ()
            repeat wait() until game:IsLoaded()
            repeat wait() until Options.AutoExecuteScript.Value
            warn("Active Auto Execute")
            local queue_teleport = queueonteleport or queue_on_teleport
            local script = 
            [[
            loadstring(game:HttpGet('https://raw.githubusercontent.com/CanisLupusXL/CanislupusXHub/main/SecondPieceTestTrail.lua'))()
            ]]
            if (queue_teleport) and Options.AutoExecuteScript.Value then
                queue_teleport(script)
             end
             local success = pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/CanisLupusXL/CanislupusXHub/main/SecondPieceTestTrail.lua"))()
             end)
             
             print(success)
             if not success and Options.AutoExecuteScript.Value then
                wait(20)
                loadstring(game:HttpGet("https://raw.githubusercontent.com/CanisLupusXL/CanislupusXHub/main/SecondPieceTestTrail.lua"))()
             end
        end)
    end))

    end -- End Of If

    