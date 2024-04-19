        repeat wait() until game:IsLoaded()
        repeat task.wait() until game.Workspace.Lives:FindFirstChild(game.Players.LocalPlayer.Name)
        game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
        game.ReplicatedStorage:WaitForChild("ToolsHandle")
        repeat wait() until game.ReplicatedStorage:FindFirstChild("ToolsHandle")

        if game.CoreGui:FindFirstChild("CrazyDay") == nil and game.PlaceId == 15049111150 then
            warn("Loading Gui..")

        local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
        local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
        local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

        local Window = Fluent:CreateWindow({
            Title = "Second Piece",
            SubTitle = "Last Update April/18/2024 [YT:CrazyDay/edek#1004]",
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
        local ItemInDropdown = {}
        local Travelingitem = {}

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
            pcall(function ()
        game.Players.ChildAdded:Connect(function ()
            for i,v in pairs(game.Players:GetChildren()) do
            table.clear(GetPlayers)
            table.insert(GetPlayers,v.Name)
            end
                end)
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
            local QuestDDD = Tabs.Main:AddDropdown("SelectQuest", {
                Title = "Select Quest",
                Values = {"Bandit Leader","Bandit","Clown Pirate","Marine","Monkey","Monkey King","Snow Bandit"},
                Multi = false,
                Default = 1,
            })

            function Get_Mon_QuestID()
                for i,v in pairs(game.Workspace.Lives:GetChildren()) do
                    if Options.SelectQuest.Value == "Bandit" and v.Name:match(Options.SelectQuest.Value) and not v.Name:match("Snow") and not v.Name:match("Leader") and v.Humanoid.Health > 0 then
                        return v
                    elseif Options.SelectQuest.Value == "Bandit Leader" and v.Name:match(Options.SelectQuest.Value) and not v.Name:match("Snow") and v.Humanoid.Health > 0 then
                        return v
                    elseif  Options.SelectQuest.Value == "Clown Pirate" and v.Name:match(Options.SelectQuest.Value) and v.Humanoid.Health > 0 then
                        return v
                    elseif Options.SelectQuest.Value == "Marine" and v.Name:match(Options.SelectQuest.Value) and not v.Name:match("Lieutenant") and v.Humanoid.Health > 0 then
                        return v
                    elseif Options.SelectQuest.Value == "Monkey" and v.Name:match(Options.SelectQuest.Value) and not v.Name:match("King") and v.Humanoid.Health > 0 then
                        return v
                    elseif Options.SelectQuest.Value == "Monkey King" and v.Name:match(Options.SelectQuest.Value) and v.Humanoid.Health > 0 then
                        return v
                    elseif Options.SelectQuest.Value == "Snow Bandit" and v.Name:match(Options.SelectQuest.Value) and not v.Name:match("Leader") and v.Humanoid.Health > 0 then
                        return v
                    end
                end
            end
            

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

            Tabs.Main:AddToggle("AutoChests", {Title = "Auto Chest", Default = false })
            Tabs.Main:AddToggle("AutoMining", {Title = "Auto Mining", Default = false })



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
                Values = {"Tokyo Prefectural Jujutsu High School","King's Trial"},
                Multi = false,
                Default = 1,
            })

            Tabs.Main:AddToggle("AutoPortal", {Title = "Auto Portal", Default = false })
            Tabs.Main:AddToggle("AutoSpawnPortal", {Title = "Auto Spawn Portal", Default = false })

            Tabs.Main:AddSection("Bounty Task")

            Tabs.Main:AddToggle("AutoBountyHunter", {Title = "Auto Bounty Task", Default = false })
            Tabs.Main:AddToggle("Dodge_Skill_BountyHunt", {Title = "Dodge Skill [Bounty Task Only]", Default = false })



            PortalDropdown:OnChanged(function(Value)
                local Values = {}
                for Value, State in next, Value do
                    table.insert(Values, Value)
                end
                if table.find(Values,"Common") and not getgenv().Common then
                    getgenv().Common = true
                end
                if table.find(Values,"Uncommon") and not getgenv().Uncommon then
                    getgenv().Uncommon = true
                end
                if table.find(Values,"Legendary") and not getgenv().Legendary then
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


            local ItemName = {}
    
            for i,v in next,game:GetService("ReplicatedStorage").ItemHandle:GetChildren() do
                table.insert(ItemName,v.Name)
            end
        
            local MerchantDropdown = Tabs.Other:AddDropdown("MerchantSelect", {
                Title = "Merchant Item",
                Description = nil,
                Values = ItemName,
                Multi = true,
                Default = {nil},
            })


        MerchantDropdown:OnChanged(function(Value)
            table.clear(ItemInDropdown)
            for Value, State in next, Value do
                table.insert(ItemInDropdown, Value)
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
                Title = "Last Update April/18/2024",
                Content = "[*] Auto Update Merchant Item\n[*] Fixed Auto Chest\n[*] Fixed Auto Mining\n[+] Webhook Mining\n[*] Fixed Auto Merchant lag/not buy items\n[*] Fixed Webhook Traveling"
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

        local a = getrawmetatable(game)
        local backs =  a.__namecall
        local Macro = {}
        setreadonly(a,false)
        a.__namecall = newcclosure(function(self,...)
            if tostring(self) == "SendTPData" then
                print("Bypass Anti_Cheat")
                return wait(9e9)
            end
            return backs(self,...)
        end)
        setreadonly(a,true)

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

        local function CheckBossSpawn()
            if Options.AutoBossSpawn.Value then
            for i,v in pairs(game.Workspace.Lives:GetChildren()) do
                if v.Name:match("Natsu") or v.Name:match("Tatsumaki") or v.Name:match("Artoria") or v.Name:match("Sukuna") or v.Name:match("Gojo") or v.Name:match("Kashimo") 
                then
                return v.Name
                end
            end
            end    
        end

        local firesignal = function(signal, arg2)
            if getconnections(signal) then
                firesignal(signal, arg2)
            end
        end
    

        function Chestawd()
            if Options.AutoChests.Value then
            for i,v in pairs(game.Workspace.Chests:GetDescendants()) do
                if v.Name == "Handle" and tostring(v.Owner.Text.Text) == game.Players.LocalPlayer.Name then
                    return true
                end
                end
            end    
        end
        

        coroutine.resume(coroutine.create(function()
            while wait() do pcall(function ()
                if not Options.AutoMining.Value then 
                else
                if Options.AutoMining.Value and getgenv().InBossHunt or getgenv().STOP or CheckBossSpawn() or getgenv().InMerchant or Chestawd() then
                    getgenv().InMining = false
                    if game.Players.LocalPlayer.Character:FindFirstChild("InputHandle"):FindFirstChild("Mining") 
                    and game.ReplicatedStorage.Settings[game.Players.LocalPlayer.Name]:FindFirstChild("Mining") then
                        repeat wait()
                        game:GetService("Players").LocalPlayer.Character.InputHandle.Mining:FireServer()
                        getgenv().InMining = false
                        until game.Players.LocalPlayer.Character:FindFirstChild("InputHandle"):FindFirstChild("Mining") == nil or
                        game.ReplicatedStorage.Settings[game.Players.LocalPlayer.Name]:FindFirstChild("Mining") == nil
                    end
                else

                if Options.AutoMining.Value and getgenv().QuestHuntOnCoolDown and not getgenv().InBossHunt and not getgenv().STOP and CheckBossSpawn() == nil and not getgenv().InMerchant  and not Chestawd() 
                and game.Players.LocalPlayer.Character:FindFirstChild("InputHandle"):FindFirstChild("Mining")
                and game.ReplicatedStorage.Settings[game.Players.LocalPlayer.Name]:FindFirstChild("Mining") == nil then
                    repeat wait()
                getgenv().InMining = true
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace:FindFirstChild("Part_Detechtions").CFrame
                game:GetService("Players").LocalPlayer.Character.InputHandle.Mining:FireServer()
                    until game.ReplicatedStorage.Settings[game.Players.LocalPlayer.Name]:FindFirstChild("Mining")
                    or game.Players.LocalPlayer.Character:FindFirstChild("InputHandle"):FindFirstChild("Mining") == nil or not Options.AutoMining.Value
                    or CheckBossSpawn() or getgenv().InMerchant or Chestawd() or not getgenv().QuestHuntOnCoolDown or getgenv().InBossHunt
                    or getgenv().STOP
                end
                   if not getgenv().InMining and game.Players.LocalPlayer.Character:FindFirstChild("InputHandle"):FindFirstChild("Mining") 
                   and game.ReplicatedStorage.Settings[game.Players.LocalPlayer.Name]:FindFirstChild("Mining") then
                    game:GetService("Players").LocalPlayer.Character.InputHandle.Mining:FireServer()
                    end
                   end
                end
                if Chestawd() or CheckBossSpawn() or getgenv().InBossHunt or not getgenv().QuestHuntOnCoolDown or getgenv().STOP then   
                else
                local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace:FindFirstChild("Part_Detechtions").Position).Magnitude
                if Options.AutoMining.Value and dist <= 10 and game.ReplicatedStorage.Settings[game.Players.LocalPlayer.Name]:FindFirstChild("Mining") == nil 
                and not game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored then
                game.Players.LocalPlayer.Character.Humanoid.Health = 0
                end
                end
            end)
        end
    end
))

     while true do wait()
        if not game.Workspace:FindFirstChild("Part_Detechtions") then
        local NO_CLIP_PART = Instance.new("Part",game.Workspace)
        NO_CLIP_PART.Name = "Part_Detechtions"
        NO_CLIP_PART.CanCollide = false
        NO_CLIP_PART.Anchored = true
        NO_CLIP_PART.Transparency = 1
        NO_CLIP_PART.Size = Vector3.new(3,10,3)
        NO_CLIP_PART.CFrame = CFrame.new(-848.71759, 34.1361351, 1140.66943, 0.999684393, 5.45161427e-09, -0.0251219478, -4.90989382e-09, 1, 2.16253202e-08, 0.0251219478, -2.14951488e-08, 0.999684393)
        end
        if game.Workspace:FindFirstChild("Part_Detechtions") then
        break
        end
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
                if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or game.Workspace.Lives:FindFirstChild(game.Players.LocalPlayer.Name) == nil 
                or FindPlayerSkill()  then
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
                if getgenv().AutoSkillX and Dist() <= 30 and getclosest().Humanoid.Health > 0 and not FindPlayerSkill()  then
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
            while wait() do pcall(function ()
                if not Chestawd() then 
                else
                if Options.AutoChests.Value and not getgenv().InMerchant and not getgenv().STOP then
                    for i,v in pairs(game.Workspace.Chests:GetDescendants()) do
                        if v.Name == "ProximityPrompt" and tostring(v.Parent.Owner.Text.Text) == game.Players.LocalPlayer.Name and not getgenv().STOP then
                            repeat task.wait()
                            fireproximityprompt(v)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
                            getgenv().InChest = true
                            until not v.Parent or getgenv().InMerchant or getgenv().STOP or not Chestawd()
                           end
                        end            
                    end
                end
                end)  
            end 
        end))


        coroutine.resume(coroutine.create(function()
            while wait() do pcall(function ()
                if not Options.AutoKenhaki.Value or game.Lighting:FindFirstChild("KenHaki").Enabled == true then
                else
                if Options.AutoKenhaki.Value and game.Lighting:FindFirstChild("KenHaki").Enabled == false then
                game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
                repeat
                game:GetService("ReplicatedStorage").Remotes.SkillHolder:FireServer("KenHaki")  
                wait(1.35)
                until game.Lighting:FindFirstChild("KenHaki").Enabled == true or not Options.AutoKenhaki.Value
                    end
                end   
            end)   
            end
        end))

        coroutine.resume(coroutine.create(function()
            while wait() do pcall(function ()
                if not Options.AutoBusohaki.Value or game.Players.LocalPlayer.Character:FindFirstChild("Right Arm"):FindFirstChild("Haki") then
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
        
        function FINDPortal()
            for i,v in pairs(game.Workspace.World.Portal:GetChildren()) do
                if v:IsA("BasePart") then
                    return true
                end
            end
        end

        coroutine.resume(coroutine.create(function()
            while task.wait() do pcall(function ()
                if FINDPortal() == nil then
                else
                if Options.AutoPortal.Value and game.PlaceId == 15049111150 and not getgenv().InPorTal then
                    for i,v in pairs(game.Workspace.World.Portal:GetChildren()) do
                        if getgenv().Common and v.Name == "1" and not getgenv().InPorTal then
                                getgenv().STOP = true
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0,-8,0)
                                getgenv().EnterNow = true
                            end
                        if getgenv().Uncommon and v.Name == "2" and not getgenv().InPorTal then
                                getgenv().STOP = true
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0,-8,0)
                                getgenv().EnterNow = true
                            end
                        if getgenv().Legendary and v.Name == "3" and v.BillboardGui.TextLabel.Text == Options.DungeonSelect.Value and not getgenv().InPorTal then
                                getgenv().STOP = true
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0,-8,0)
                                getgenv().EnterNow = true
                        end
                            end
                        end
                    end
                end) 
            end
        end))


        coroutine.resume(coroutine.create(function()
            while wait() do pcall(function ()
                if FINDPortal() == nil then 
                else
                if Options.AutoPortal.Value and game.PlaceId == 15049111150  then
                    for i,v in pairs(game.Workspace.World.Portal:GetDescendants()) do
                        if v.Name == "Frame" and v:FindFirstChild(game.Players.LocalPlayer.Name) == nil then
                            local clickThis = v.Parent.Parent.ProximityPrompt
                            if getgenv().EnterNow  then
                                repeat task.wait()
                                fireproximityprompt(clickThis)
                                until v:FindFirstChild(game.Players.LocalPlayer.Name) ~= nil
                            getgenv().InPorTal = true
                            end
                        end
                        end
                    end
                end
            end)
            end
        end))

            coroutine.resume(coroutine.create(function()
                while wait() do
                    pcall(function ()
                        if not Options.AutoQuest.Value or getgenv().STOP or getgenv().DontAcceptQuest then 
                        else
                        if Options.AutoQuest.Value and not getgenv().DontAcceptQuest  and game.PlaceId == 15049111150 and not getgenv().STOP and getgenv().QuestHuntOnCoolDown 
                        and not getgenv().InMerchant and not getgenv().InMining  and not Chestawd() then
                            for i,v in pairs(game.Players.LocalPlayer:GetChildren()) do 
                                if v.Name == "PlayerGui" and v:FindFirstChild("QuestUI") == nil then
                                    getgenv().NoQuest = true
                                elseif v:FindFirstChild("QuestUI") ~= nil then
                                    getgenv().NoQuest = false
                                end
                                end
                            end
                        end
                    end)
                end
            end))
            
            coroutine.resume(coroutine.create(function()
                while wait() do pcall(function ()
                    if not Options.AutoQuest.Value or getgenv().DontAcceptQuest or getgenv().STOP or getgenv().InBossHunt then
                    else
                    if Options.AutoQuest.Value and not getgenv().DontAcceptQuest and not getgenv().STOP and not getgenv().InBossHunt and getgenv().QuestHuntOnCoolDown and game.PlaceId == 15049111150 
                    and not getgenv().InMerchant and not getgenv().InMining and not Chestawd() then
                        for i,v in pairs(game.Workspace.Quest:GetDescendants()) do
                            if v.Name == "Quest" then
                                if v.Value == Options.SelectQuest.Value then
                                    if getgenv().NoQuest and not getgenv().DontAcceptQuest then
                                        game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
                                        repeat 
                                            wait()
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.Parent.CFrame
                                        fireproximityprompt(v.Parent)
                                        until not Options.AutoQuest.Value or not getgenv().NoQuest or getgenv().DontAcceptQuest or getgenv().InBossHunt or not getgenv().QuestHuntOnCoolDown or getgenv().InMerchant or getgenv().InMining or Chestawd()
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
                while  wait() do pcall(function ()
                    if not Options.AutoQuest.Value or getgenv().DontAcceptQuest or getgenv().STOP or getgenv().InBossHunt then
                    else
                    if Options.AutoQuest.Value and not getgenv().DontAcceptQuest and not getgenv().STOP and not getgenv().InBossHunt and getgenv().QuestHuntOnCoolDown and game.PlaceId == 15049111150 
                    and not getgenv().InMerchant and not getgenv().InMining  and not Chestawd() then
                        for i,v in pairs(game.Workspace.Quest:GetDescendants()) do
                            if v.Name == "Quest" and v.Value == Options.SelectQuest.Value and not getgenv().NoQuest then
                                game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
                                                    repeat task.wait()
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Get_Mon_QuestID().HumanoidRootPart.CFrame * CFrame.new(0,0,4)
                                                until Get_Mon_QuestID().Humanoid.Health <= 0 or not Options.AutoQuest.Value or getgenv().NoQuest or getgenv().DontAcceptQuest
                                                or getgenv().InBossHunt or getgenv().STOP or not getgenv().QuestHuntOnCoolDown or getgenv().InMerchant or getgenv().InMining or Chestawd()
                                            end
                                end
                            end
                        end
                end)
                end
            end))

            coroutine.resume(coroutine.create(function()
                while wait() do pcall(function ()
                    if not Options.AutoGem.Value or getgenv().StopFarmGem or getgenv().STOP or getgenv().InBossHunt then
                    else
                    if  Options.AutoGem.Value and not getgenv().StopFarmGem and not getgenv().STOP and not getgenv().InBossHunt and getgenv().QuestHuntOnCoolDown and game.PlaceId == 15049111150 
                    and not getgenv().InMerchant and not getgenv().InMining  and not Chestawd() then
                        for i,v in pairs(game.Workspace.Lives:GetChildren()) do
                            if string.find(v.Name,BossTable[1]) or string.find(v.Name,BossTable[2]) 
                            or string.find(v.Name,BossTable[3]) or string.find(v.Name,BossTable[4])  
                            and not getgenv().InMerchant then
                                if v.Humanoid.Health > 0 then
                                    game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
                                    repeat
                                        task.wait()
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,4)
                                        getgenv().DontAcceptQuest = true
                                until v.Humanoid.Health <= 0 or not Options.AutoGem.Value or getgenv().StopFarmGem or getgenv().InBossHunt or getgenv().STOP or not getgenv().QuestHuntOnCoolDown
                                    getgenv().DontAcceptQuest = false or getgenv().InMerchant or getgenv().InMining  or Chestawd()
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
                    if not Options.AutoBossSpawn.Value or getgenv().STOP or getgenv().InBossHunt or CheckBossSpawn() == nil then
                    else
                    if Options.AutoBossSpawn.Value and not getgenv().STOP and not getgenv().InBossHunt and getgenv().QuestHuntOnCoolDown and game.PlaceId == 15049111150 
                    and not getgenv().InMerchant and not Chestawd() then
                        for i,v in pairs(game.Workspace.Lives:GetChildren()) do
                            if v.Name:match("Natsu") or v.Name:match("Tatsumaki") or v.Name:match("Artoria") or v.Name:match("Sukuna") or v.Name:match("Gojo") or v.Name:match("Kashimo") 
                            and not getgenv().STOP and not getgenv().InBossHunt
                            and not getgenv().InMerchant  then
                                if v.Humanoid.Health > 0 and getgenv().QuestHuntOnCoolDown then
                                    game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
                                    repeat task.wait()
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,7)
                                        getgenv().DontAcceptQuest = true
                                        getgenv().StopFarmGem = true
                                        until v.Humanoid.Health <= 0 or getgenv().STOP or not Options.AutoBossSpawn.Value or getgenv().InBossHunt or not getgenv().QuestHuntOnCoolDown or getgenv().InMerchant or Chestawd()
                                        getgenv().DontAcceptQuest = false   
                                        getgenv().StopFarmGem = false
                                    end
                                end
                            end
                        end
                        if not Options.AutoBossSpawn.Value and getgenv().DontAcceptQuest then
                            getgenv().DontAcceptQuest = false
                        end
                        if not Options.AutoBossSpawn.Value and getgenv().StopFarmGem then
                            getgenv().StopFarmGem = false
                        end
                    end
                end)
                end
            end))
            
            
            coroutine.resume(coroutine.create(function()
                pcall(function ()
            game.Players.LocalPlayer.PlayerGui.NotifyUI.Frame.ChildAdded:Connect(function (v)
                if Options.AutoBountyHunter.Value then
                if v.Name == "NotifyText" then
                    if string.find(v.Text.Text,"on cooldown") or string.find(v.Text.Text,"gotten the reward") then
                        getgenv().QuestHuntOnCoolDown = true
                        getgenv().InBossHunt = false
                        wait(30.5)
                        getgenv().QuestHuntOnCoolDown = false
                    end
                    end
                end
            end)
        end)
        end))

        coroutine.resume(coroutine.create(function()
            pcall(function ()
                game.Players.LocalPlayer.PlayerGui.NotifyUI.Frame.ChildAdded:Connect(function (v)
                    if v.Name == "NotifyText" then
                        if string.find(v.Text.Text,"gotten the reward") then
                            if Options.AutoWebhookBountyTask.Value then
                            wait(1)
                            local timeInfo = os.date("*t")
                            local Split_V = string.split(v.Text.Text, ">")
                            local Split_A = string.split(Split_V[2], "<")
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
                                            ["value"] = "Username : ".."||**"..game.Players.LocalPlayer.Name.."**||".."\n"..Split_A[1],
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
                end)
            end)
            end))
            
            local TimeChecker = 0

            coroutine.resume(coroutine.create(function()
                while wait(1) do pcall(function ()
                    if not Options.AutoBountyHunter.Value then 
                    else
                    if Options.AutoBountyHunter.Value  then
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
                        end
                    end) 
            end
        end))


        function CriminalCheck()
            for i,v in pairs(game.Workspace.Lives:GetChildren()) do
                if v.Name:match("Criminal") and v.Humanoid.Health > 0 and v.TaskBy.Value == game.Players.LocalPlayer.Name then
                    return v
                end
            end        
        end

        game.Workspace.Lives.ChildAdded:Connect(function(v)
            pcall(function ()
                wait(.5)
                if v.Name:match("Criminal") and v.Humanoid.Health > 0 and v.TaskBy.Value == game.Players.LocalPlayer.Name then
                getgenv().InBossHunt = true
                warn("START BOSS HUNT")
                repeat task.wait() until not v.Parent or v.Humanoid.Health <= 0
                getgenv().InBossHunt = false
                warn("ENED BOSS HUNT")
            end
            end)
        end)

        function Check_To_Dodge()
            for i,v in pairs(game.ReplicatedStorage.Settings:GetChildren()) do
                if v.Name ==  CriminalCheck().Name  then
                    for _,vv in next,v:GetChildren() do
                        if vv.Name == "Action" or vv.Name == "IFrame" or vv.Name == "WalkDisable" then
                            getgenv().Dodge_Criminal = true 
                            repeat task.wait() until not vv.Parent
                            getgenv().Dodge_Criminal = false
                            getgenv().CheckForSome = true
                        end
                    end
                end
            end
        end
        
        local ConnectCriminal
        game.ReplicatedStorage.Settings.ChildAdded:Connect(function(v)
            pcall(function ()
            if v.Name == CriminalCheck().Name and Options.Dodge_Skill_BountyHunt.Value then
                ConnectCriminal = game.ReplicatedStorage.Settings[v.Name].ChildAdded:Connect(function(c)
                    if c.Name == "Action" or c.Name == "IFrame" or v.Name == "WalkDisable" 
                    and not getgenv().STOP_Dodge and Options.Dodge_Skill_BountyHunt.Value then
                        getgenv().Dodge_Criminal = true
                    repeat task.wait() until not c.Parent or getgenv().STOP_Dodge or not Options.Dodge_Skill_BountyHunt.Value
                    wait(.25)
                    getgenv().Dodge_Criminal = false
                    getgenv().CheckForSome = true
                    repeat task.wait() until not v.Parent or not Options.Dodge_Skill_BountyHunt.Value
                    ConnectCriminal:Disconnect()
                    end
                end)
        end
        end)
        end)
        coroutine.resume(coroutine.create(function()
            while wait() do pcall(function ()  
        if not Options.Dodge_Skill_BountyHunt.Value then 
                else
        if not game.Players.LocalPlayer.Character:FindFirstChild("CrazyDay_NO") then
            local NO_CLIP_PART = Instance.new("Part",game.Players.LocalPlayer.Character)
            NO_CLIP_PART.Name = "CrazyDay_NO"
            NO_CLIP_PART.CanCollide = true
            NO_CLIP_PART.Anchored = true
            NO_CLIP_PART.Transparency = 1
            NO_CLIP_PART.Size = Vector3.new(2,1,2)
        elseif game.Players.LocalPlayer.Character:FindFirstChild("CrazyDay_NO") and Options.Dodge_Skill_BountyHunt.Value then
            repeat
                task.wait()
                game.Players.LocalPlayer.Character:FindFirstChild("CrazyDay_NO").CanCollide = true
                game.Players.LocalPlayer.Character:FindFirstChild("CrazyDay_NO").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-3.5,0)
             until not game.Players.LocalPlayer.Character:FindFirstChild("CrazyDay_NO") or not Options.Dodge_Skill_BountyHunt.Value
             game.Players.LocalPlayer.Character:FindFirstChild("CrazyDay_NO").CanCollide = false
            end
            end
        end)
        end
        end))
        

        game.ReplicatedStorage.Settings[game.Players.LocalPlayer.Name].ChildAdded:Connect(function (v)
            pcall(function ()
            if v.Name == "Action" or v.Name == "IFrame" or v.Name == "WalkDisable"
            and Options.Dodge_Skill_BountyHunt.Value then
                getgenv().STOP_Dodge = true
                getgenv().Dodge_Criminal = false
                repeat task.wait() until not v.Parent or not Options.Dodge_Skill_BountyHunt.Value
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
                    if getgenv().STOP or getgenv().InMerchant or not Options.AutoBountyHunter.Value then 
                    else
                    if Options.AutoBountyHunter.Value and not getgenv().InBossHunt and not getgenv().QuestHuntOnCoolDown and not getgenv().STOP
                    and not getgenv().InMerchant and not CriminalCheck() and not Chestawd()  then
                            if not getgenv().STOP and not getgenv().InBossHunt and not getgenv().QuestHuntOnCoolDown and not CriminalCheck() and not Chestawd() then
                                game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
                                getgenv().InMining = false
                                repeat 
                                wait(.85)
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.NPC.Kuru.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
                                    fireproximityprompt(game.Workspace.NPC.Kuru.HumanoidRootPart.Task)
                                    until getgenv().InBossHunt or getgenv().QuestHuntOnCoolDown or not Options.AutoBountyHunter.Value or getgenv().STOP 
                                    or getgenv().InMerchant or CriminalCheck() or Chestawd() or getgenv().InMerchant
                                end
                                end
                        end
                    end)
                end
            end))
            

            coroutine.resume(coroutine.create(function()
                while task.wait() do pcall(function ()
                    if getgenv().STOP or Chestawd() or getgenv().InMerchant or not Options.AutoBountyHunter.Value then
                    else
                    if Options.AutoBountyHunter.Value and not getgenv().STOP and not getgenv().InMerchant and getgenv().InBossHunt and not Chestawd() then
                        if not getgenv().STOP and getgenv().Dodge_Criminal  then
                            game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
                            repeat task.wait()
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CriminalCheck().HumanoidRootPart.CFrame * CFrame.new(0,150,0)
                            until CriminalCheck().Humanoid.Health <= 0 or getgenv().STOP or not Options.AutoBountyHunter.Value or game.PlaceId ~= 15049111150
                            or not getgenv().Dodge_Criminal or getgenv().InMerchant or not getgenv().InBossHunt or Chestawd() or getgenv().InMerchant

                        elseif not getgenv().STOP and not getgenv().Dodge_Criminal  then
                            game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
                            repeat task.wait()
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CriminalCheck().HumanoidRootPart.CFrame * CFrame.new(0,0,7)
                            until CriminalCheck().Humanoid.Health <= 0 or getgenv().STOP or not Options.AutoBountyHunter.Value or game.PlaceId ~= 15049111150
                            or getgenv().InMerchant or getgenv().Dodge_Criminal or not getgenv().InBossHunt or Chestawd() or getgenv().InMerchant
                        end
                        end
                    end
                end)
                end
            end))
            

            game.Players.LocalPlayer.PlayerGui.ItemRewardGui.Interface.ItemRewardFrame.ChildAdded:Connect(function(v)
                pcall(function ()
                if v.ClassName == "Frame" and Options.AutoBountyHunter.Value then
                    pcall(function ()
                        getgenv().QuestHuntOnCoolDown = true
                        getgenv().InBossHunt = false
                        wait(30.5)
                        getgenv().QuestHuntOnCoolDown = false
                    end)
                end
                end)
            end)

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



        game.Players.LocalPlayer.PlayerGui.NotifyUI.Frame.ChildAdded:Connect(function (v)
            pcall(function ()
            if Options.MiningWebhook.Value and game.ReplicatedStorage.Settings[game.Players.LocalPlayer.Name]:FindFirstChild("Mining") 
            and game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored and v.Name == "NotifyText" and not string.find(v.Text.Text,"on cooldown") then
                pcall(function ()
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
                                ["name"] = "Mining Reward",
                                ["value"] = "Username : ".."||**"..game.Players.LocalPlayer.Name.."**||".."\n".."[Mining Mastery Increased]\n".."You received : "..Split_A[1],
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
            end)
            end
        end)
    end)


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
                if not Options.AutoSpawnPortal.Value then 
                else
                if Options.AutoSpawnPortal.Value and game.PlaceId == 15049111150 and not getgenv().EnterNow then
                    for i,v in pairs(game.Players.LocalPlayer.PlayerGui.MainUI.Interface.Inventory.ItemsFrame:GetChildren()) do
                        for _,k in pairs(game.Players.LocalPlayer:GetChildren()) do 
                        if getgenv().Legendary and string.find(v.Name,"Legendary") then
                        getgenv().SpawnLegend = true getgenv().SpawnLegendDetech = true getgenv().NoEquip = true
                        end
                        if getgenv().Uncommon and string.find(v.Name,"Rare") and not getgenv().SpawnLegend and not getgenv().SpawnLegendDetech then
                        getgenv().SpawnRare = true getgenv().SpawnRareDetech = true getgenv().NoEquip = true
                        end
                        if getgenv().Common and string.find(v.Name,"Common") and not getgenv().SpawnLegend and not getgenv().SpawnRare and not getgenv().SpawnLegendDetech and not getgenv().SpawnRareDetech then
                        getgenv().SpawnCommon = true getgenv().NoEquip = true 
                        end
                        if not getgenv().Legendary and getgenv().SpawnLegend and getgenv().SpawnLegendDetech then 
                            getgenv().SpawnLegend = false
                            getgenv().SpawnLegendDetech = false
                        end
                        if not getgenv().Uncommon and getgenv().SpawnRare and getgenv().SpawnRareDetech then
                            getgenv().SpawnRare = false
                            getgenv().SpawnRareDetech =false
                        end
                        
                        if k.Name == "PlayerGui" and k:FindFirstChild("ItemUseUI") == nil and
                        getgenv().Legendary and getgenv().SpawnLegend and getgenv().SpawnLegendDetech
                        and game.Players.LocalPlayer.Character:FindFirstChild("[Tier 3] Summon Ticket") and not getgenv().EnterNow 
                        and not getgenv().STOPUserTicket then
                            game:GetService("ReplicatedStorage").Remotes.UseItemFromClient:FireServer("[Tier 3] Summon Ticket")
                            wait(1)
                        end
                        if k.Name == "PlayerGui" and k:FindFirstChild("ItemUseUI") == nil and
                        getgenv().Uncommon and getgenv().SpawnRare and getgenv().SpawnRareDetech
                        and not getgenv().SpawnLegend and not getgenv().SpawnLegendDetech
                    and game.Players.LocalPlayer.Character:FindFirstChild("[Tier 2] Summon Ticket") and not getgenv().EnterNow 
                    and not getgenv().STOPUserTicket then
                    game:GetService("ReplicatedStorage").Remotes.UseItemFromClient:FireServer("[Tier 2] Summon Ticket")
                        wait(1)
                    end
                    if k.Name == "PlayerGui" and k:FindFirstChild("ItemUseUI") == nil and
                    getgenv().Common and getgenv().SpawnCommon and not getgenv().SpawnLegend and not getgenv().SpawnLegendDetech and not getgenv().SpawnRare and not getgenv().SpawnRareDetech 
                    and game.Players.LocalPlayer.Character:FindFirstChild("[Tier 1] Summon Ticket") and not getgenv().EnterNow 
                    and not getgenv().STOPUserTicket then
                        game:GetService("ReplicatedStorage").Remotes.UseItemFromClient:FireServer("[Tier 1] Summon Ticket")
                        wait(1)
                    end   

                    if k.Name == "PlayerGui" and k:FindFirstChild("ItemUseUI") ~= nil and k:FindFirstChild("DungeonSelect") == nil and not getgenv().EnterNow 
                    and not getgenv().STOPPressYes then
                        getgenv().STOPUserTicket = true
                        firesignal(k.ItemUseUI.Interface.ItemFrame.Menu.Yes.MouseButton1Click,game.Players.LocalPlayer)
                    end
                    if k.Name == "PlayerGui" and k:FindFirstChild("DungeonSelect") ~= nil and not getgenv().EnterNow then 
                        getgenv().STOPPressYes = true
                        firesignal(k.DungeonSelect.Interface.Frame.List[Options.DungeonSelect.Value].Label.MouseButton1Down,game.Players.LocalPlayer)
                    end
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
            while wait() do pcall(function ()
            if not Options.AutoSpawnPortal.Value then 
            else
            if Options.AutoSpawnPortal.Value and game.PlaceId == 15049111150 and not getgenv().EnterNow then
                
                if  getgenv().Legendary and getgenv().SpawnLegend and getgenv().SpawnLegendDetech 
                and game.Players.LocalPlayer.Backpack:FindFirstChild("[Tier 3] Summon Ticket")  then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("[Tier 3] Summon Ticket"))
                    getgenv().JustEquipTicket3 = true
                end
                if  getgenv().Uncommon and getgenv().SpawnRare and not getgenv().SpawnLegend and not getgenv().SpawnLegendDetech
                and game.Players.LocalPlayer.Backpack:FindFirstChild("[Tier 2] Summon Ticket")  then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("[Tier 2] Summon Ticket"))
                    getgenv().JustEquipTicket2 = true
                end
                if  getgenv().Common and getgenv().SpawnCommon and not getgenv().SpawnLegend and not getgenv().SpawnLegendDetech and not getgenv().SpawnRare and not getgenv().SpawnRareDetech
                and game.Players.LocalPlayer.Backpack:FindFirstChild("[Tier 1] Summon Ticket")  then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("[Tier 1] Summon Ticket"))
                    getgenv().JustEquipTicket1 = true
                end

                -- 2
                if getgenv().SpawnLegend and getgenv().SpawnLegendDetech 
                and not game.Players.LocalPlayer.Backpack:FindFirstChild("[Tier 3] Summon Ticket")
                and not getgenv().JustEquipTicket3 then
                game:GetService("ReplicatedStorage").Remotes.EquipItem:FireServer("[Legendary] Portal Summon Ticket")
            end
            if getgenv().SpawnRare and not getgenv().SpawnLegend and not getgenv().SpawnLegendDetech 
            and not game.Players.LocalPlayer.Backpack:FindFirstChild("[Tier 2] Summon Ticket")
            and not getgenv().JustEquipTicket2 then
                game:GetService("ReplicatedStorage").Remotes.EquipItem:FireServer("[Rare] Portal Summon Ticket")
            end
            if getgenv().SpawnCommon and not getgenv().SpawnLegend and not getgenv().SpawnLegendDetech and not getgenv().SpawnRare and not getgenv().SpawnRareDetech
                and not game.Players.LocalPlayer.Backpack:FindFirstChild("[Tier 1] Summon Ticket")
            and not getgenv().JustEquipTicket1 then
                game:GetService("ReplicatedStorage").Remotes.EquipItem:FireServer("[Common] Portal Summon Ticket")
            end
            end
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
            while wait() do pcall(function ()
                if not Options.AutoBuyMerchantItem.Value or getgenv().AlrBuy or getgenv().STOP then 
                else
                if Options.AutoBuyMerchantItem.Value and not getgenv().AlrBuy and not getgenv().STOP then
                for i,v in pairs(game.Workspace.NPC:GetChildren()) do
                    if v.Name == "Traveling merchant" then
                    repeat
                    wait(.5)
                    fireproximityprompt(v.HumanoidRootPart.Merchant)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,5,0)
                    firesignal(game.Players.LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("MerchantUI"):FindFirstChild("Interface"):FindFirstChild("Merchant"):FindFirstChild("Close"):FindFirstChild("Close").MouseButton1Click,game.Players.LocalPlayer)
                    getgenv().InMerchant = true
                    until not Options.AutoBuyMerchantItem.Value or getgenv().AlrBuy or getgenv().STOP
                    getgenv().InMerchant = false
                end
            end
                    end
                end
            end)
        end
        end))


        coroutine.resume(coroutine.create(function()
            while wait() do pcall(function ()
                if not Options.AutoBuyMerchantItem.Value then 
                else
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
                    wait(12)
                    game.Players.LocalPlayer.PlayerGui.MerchantUI.Enabled = false
                end
            end
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
    function WebhookMerchant()
        local timeInfo = os.date("*t")
        local ItemIn = table.concat(Travelingitem,"\n")
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
                        ["value"] = "Username : ".."||**"..game.Players.LocalPlayer.Name.."**||".."\n"..ItemIn,
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
        game.Players.LocalPlayer.PlayerGui.NotifyUI.Frame.ChildAdded:Connect(function (v)
            pcall(function () 
            if Options.AutoWebhookMerchant.Value and v.Name == "NotifyText" and string.find(v.Text.Text,"You received") and getgenv().InMerchant then
                local Split_V = string.split(v.Text.Text, ">")
                local Split_A = string.split(Split_V[2], "<")
                table.insert(Travelingitem,Split_A[1])
            end
            end)
        end)
        end)
    end))

    coroutine.resume(coroutine.create(function()
        while wait() do pcall(function ()
            if Options.AutoWebhookMerchant.Value and getgenv().InMerchant then
                repeat wait() until not getgenv().InMerchant
                    wait(1)
                        WebhookMerchant()
                        wait(1)
                        table.clear(Travelingitem)
            end
         end)
        end
    end))

        
            local IntertFaceMerChant = game.Players.LocalPlayer.PlayerGui.MerchantUI.Interface.Merchant.ItemFrame
            coroutine.resume(coroutine.create(function()
                while wait() do pcall(function ()
                if not Options.AutoBuyMerchantItem.Value then  
                else
                if Options.AutoBuyMerchantItem.Value and game.PlaceId == 15049111150 and game.Players.LocalPlayer.PlayerGui.MerchantUI.Enabled then
                    local DISTSTUCK = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace:FindFirstChild("NPC"):FindFirstChild("Traveling merchant"):FindFirstChild("HumanoidRootPart").Position).Magnitude
                    for i,v in next,game.Players.LocalPlayer.PlayerGui.MerchantUI.Interface.Merchant.ItemFrame:GetChildren() do
                        local FindItem = table.find(ItemInDropdown,v.Name)
                        if FindItem  then
                            repeat wait()
                            local split = string.split(v.Name," ")
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant",split[1])
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant",v.Name)
                            until not Options.AutoBuyMerchantItem.Value or not game.Players.LocalPlayer.PlayerGui.MerchantUI.Enabled
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant",v.Name)
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant",split[1])
                        end
                        ---------------- // Black List Dog Item \\ --------------
        
                        if table.find(ItemInDropdown,"God Light Fruit") and IntertFaceMerChant:FindFirstChild("God Light Fruit") then
                            repeat wait()
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","GodLight")
                            until not table.find(ItemInDropdown,"God Light Fruit") or IntertFaceMerChant:FindFirstChild("God Light Fruit") == nil or not Options.AutoBuyMerchantItem.Value or not game.Players.LocalPlayer.PlayerGui.MerchantUI.Enabled
                        end
                        if table.find(ItemInDropdown,"[Tier 1] Summon Ticket") and IntertFaceMerChant:FindFirstChild("[Tier 1] Summon Ticket") then
                            repeat wait()
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","[Common] Portal Summon Ticket")
                        until not table.find(ItemInDropdown,"[Tier 1] Summon Ticket") or IntertFaceMerChant:FindFirstChild("[Tier 1] Summon Ticket") == nil or not Options.AutoBuyMerchantItem.Value or not game.Players.LocalPlayer.PlayerGui.MerchantUI.Enabled
                        end
                        if table.find(ItemInDropdown,"[Tier 2] Summon Ticket")  and IntertFaceMerChant:FindFirstChild("[Tier 2] Summon Ticket") then
                            repeat wait()
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","[Rare] Portal Summon Ticket")
                        until not table.find(ItemInDropdown,"[Tier 2] Summon Ticket") or IntertFaceMerChant:FindFirstChild("[Tier 2] Summon Ticket") == nil or not Options.AutoBuyMerchantItem.Value or not game.Players.LocalPlayer.PlayerGui.MerchantUI.Enabled
                    end
                        if table.find(ItemInDropdown,"[Tier 3] Summon Ticket")  and IntertFaceMerChant:FindFirstChild("[Tier 3] Summon Ticket") then
                            repeat wait()
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","[Legendary] Portal Summon Ticket")
                        until not table.find(ItemInDropdown,"[Tier 3] Summon Ticket") or IntertFaceMerChant:FindFirstChild("[Tier 3] Summon Ticket") == nil or not Options.AutoBuyMerchantItem.Value or not game.Players.LocalPlayer.PlayerGui.MerchantUI.Enabled
                    end
                       
                        if table.find(ItemInDropdown,"Sukuna Finger") and IntertFaceMerChant:FindFirstChild("Sukuna Finger") then
                            repeat wait()
                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer("Traveling Merchant","SukunaFinger")
                        until not table.find(ItemInDropdown,"Sukuna Finger") or IntertFaceMerChant:FindFirstChild("Sukuna Finger") == nil or not Options.AutoBuyMerchantItem.Value or not game.Players.LocalPlayer.PlayerGui.MerchantUI.Enabled
                    end 
                    end
                    if DISTSTUCK <= 12.5 or game.Players.LocalPlayer.PlayerGui.MerchantUI.Enabled then
                            wait(11)
                            getgenv().AlrBuy = true
                            getgenv().InMerchant = false
                            game.Players.LocalPlayer.PlayerGui.MerchantUI.Enabled = false
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


        end -- End Of If

        
