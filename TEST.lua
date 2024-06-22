
--local script_loaded,script_error = pcall(function ()
repeat wait() until game:IsLoaded()
if not string.find(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,"Anime Dimension") then return end

--// Variable
local G = getgenv()
G["response"] = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or (request)
local Playing_Mode = 0
local CardStepNumber = 0
local Tween_Info = nil
local Rarity, CardUpgrade =
    {},
    {}
local Plr, LocalPlr, CoreGui, Workspace, ReplicatedStorage, HttpService, RunService, PlrGui, TweenService =
    game:GetService "Players",
    game:GetService "Players".LocalPlayer,
    game:GetService "CoreGui",
    game:GetService "Workspace",
    game:GetService "ReplicatedStorage",
    game:GetService "HttpService",
    game:GetService "RunService",
    game:GetService "Players".LocalPlayer.PlayerGui,
    game:GetService "TweenService"
local instance_S, instance_I, instance_F, instance_U1, instance_U2, bv =
    Instance.new("ScreenGui"),
    Instance.new("ImageButton"),
    Instance.new("Frame"),
    Instance.new("UICorner"),
    Instance.new("UIStroke"),
    Instance.new("BodyVelocity")
local Connect1, Connect2
local RemoteEvent , RemoteFunction =
    ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("MainRemoteEvent"),
    ReplicatedStorage:WaitForChild("RemoteFunctions"):WaitForChild("MainRemoteFunction")
local LocalID, Game, Update, BlackList_Characters, Currency_Items, Room =
    Plr:GetUserIdFromNameAsync(LocalPlr.Name),
    "Anime Dimensions Simulator (Rework)",
    " 1.0.1",
    {"Naruto","Sasuke"},
    {"Gold","TraitToken","RaidCurrency","BossRushCurrency","Gem"},
    {
        "Titan Dimension",
        "Demon Dimension",
        "Curse Dimension",
        "Villain Dimension",
        "Sword Dimension",
        "Ghoul Dimension",
        "Fate Dimension",
        "Slime Dimension",
        "Devil Dimension",
        "Pirate Dimension",
        "Alien Dimension",
        "Level Dimension"
    }
local StatDisplay, Level, CrazyDayF, Item_Rewards, Currency_Rewards =
    ReplicatedStorage:WaitForChild(LocalPlr.Name.."StatDisplay"),
    LocalPlr.leaderstats.Level,
    "CrazyDay/"..Game.."/"..LocalID.."/",
    {"`None      `"},
    {"`None     `"}
    if not LocalPlr.Character then LocalPlr.CharacterAdded:Wait()wait()end
    if CoreGui:FindFirstChild("CrazyDay") then return end
    if not isfolder("CrazyDay") then repeat makefolder("CrazyDay") task.wait(0) until isfolder("CrazyDay") makefolder("CrazyDay/"..Game)
    elseif isfolder("CrazyDay") and not isfolder("CrazyDay/"..Game) then makefolder("CrazyDay/"..Game) end
    --// local function
        local function Gui_CrazyDay()
            if CoreGui:FindFirstChild("CrazyDay") then
                for i,v in ipairs(CoreGui.CrazyDay:GetChildren()) do
                    if v.Name == "Frame" and i == 2 then
                        return v
                    end
                end
            end
        end
        local function uiinfo(sectionI,sectionV)
            if Gui_CrazyDay() then
                G["The Gui"] = nil
                for i,v in ipairs(Gui_CrazyDay().CanvasGroup:GetChildren()) do
                    if v:IsA("ScrollingFrame") and i == sectionI then
                        for g,k in ipairs(v:GetChildren()) do
                            if k.Name == "Frame" and k:FindFirstChild("TextLabel") and k.TextLabel.Text == sectionV then
                                G["The Gui"] = k:FindFirstChild("Frame")
                            end
                        end
                    end
                end
            end
        end
        local function SetParagraphValue(sectionI,sectionV,sectionA,values,Type)
            if Type == 3 then
                if Gui_CrazyDay() then
                    uiinfo(sectionI,sectionV)
                    for i,v in ipairs(G["The Gui"]:GetChildren()) do
                        if v.Name == "TextButton" and i == sectionA + 1 then
                            for k,g in ipairs(v.Frame:GetChildren()) do
                                if k == 3 and g:IsA("TextLabel") then
                                    g.Text = values
                                end
                            end
                        end
                    end
                end
            else
                if Gui_CrazyDay() then
                    uiinfo(sectionI,sectionV)
                    for i,v in ipairs(G["The Gui"]:GetDescendants()) do
                        if v:IsA("TextLabel") and (v.Text == sectionA or string.find(v.Text,sectionA)) then
                            for g,k in ipairs(v.Parent:GetChildren()) do
                                if g == 4 and k:IsA("TextLabel") then
                                    k.Text = values
                                end
                            end
                        end
                    end
                end
            end
        end
        local function NotEquip()
            local a = PlrGui.MainGui.CenterUIFrame.Inventory.Frame.InvOverlayOuterFrame.EquippedOverlay
            if StatDisplay.CardsOwned.Value >= 3 then
                if (a.Slot1.ItemImage.Image == "" or a.Slot2.ItemImage.Image == "" or a.Slot3.ItemImage.Image == "") then
                    return true
                else
                    return false
                end
            elseif StatDisplay.CardsOwned.Value == 2 then
                if (a.Slot1.ItemImage.Image == "" or a.Slot2.ItemImage.Image == "") then
                    return true
                else
                    return false
                end
            elseif StatDisplay.CardsOwned.Value == 1 then
                if (a.Slot1.ItemImage.Image == "") then
                    return true
                else
                    return false
                end
            elseif StatDisplay.CardsOwned.Value == 0 then
                return "Zero"
            end
        end
        local function UnEquip()
            if (game.PlaceId ~= 7338881230 and game.PlaceId ~= 6938803436 and game.PlaceId ~= 7274690025) then return end
            for i,v in ipairs(StatDisplay:GetChildren()) do
                if string.find(v.Name,"Slot") and v.Value ~= "" then
                    RemoteFunction:InvokeServer("UnequipCard",v.Value)
                end
            end
        end
        local function get_valueCard(name)
            if name == "Level" then
                return tonumber(PlrGui.MainGui.CenterUIFrame.Inventory.Frame.InvOverlayOuterFrame.CardInventoryOverlay.UpgradeFrame.CardLevel.Text:split(". ")[2]:split(" / ")[1])
            elseif name == "Gold" then
                return tonumber(PlrGui.MainGui.CenterUIFrame.Inventory.Frame.InvOverlayOuterFrame.CardInventoryOverlay.UpgradeFrame.GoldCost.Text)
            end
        end
        local function stringofnum(values)
            local tablead = {"K","M","B"}
            local num = 1
                for i,v in pairs(tablead) do
                    values = string.gsub(values, v ,function ()
                    num = num * (10 ^ (i * 3))
                    return ''
                end)
            end
            return num * values
        end
        local function roundNumber(numberHere,Notation)
            local DigitsInNumber = math.max(math.ceil(math.log10(numberHere+1)),1)
            local FormattedNumber
            local NotationToUse
            if Notation == 1 then
                FormattedNumber = string.sub(tostring(numberHere/10^(DigitsInNumber-1)),1,3)
                NotationToUse = FormattedNumber.."e"..DigitsInNumber-1
            elseif (Notation and Notation == 2) or not Notation then
                local TableOfLetters = {
                    "",
                    "K",
                    "M",
                    "B",
                    "T",
                    "Qa",
                    "Qi",
                    "Sx",
                    "Sp",
                    "Oc",
                    "No",
                    "Dc",
                    "Ud",
                    "Dd"
                }
                local NumberOfDigitsToShow = 1.5*(DigitsInNumber%3)^2 - 3.5*(DigitsInNumber%3) + 5
                FormattedNumber = string.sub(tostring(numberHere/10^(DigitsInNumber-1)),1,NumberOfDigitsToShow) 
                local FinalNumber = string.sub(FormattedNumber*(10^((DigitsInNumber-1)%3)),1,NumberOfDigitsToShow) 
                if DigitsInNumber == 3 then 
                    FinalNumber = tostring(math.ceil(tonumber(FinalNumber)))
                end
                NotationToUse = FinalNumber..TableOfLetters[math.ceil(DigitsInNumber/3)]
            end
            return NotationToUse
        end
        local function enemy(name)
            local dist, thing = math.huge, false
            for i, v in ipairs(Workspace.Folders.Monsters:GetChildren()) do
                if name == "AllMob" then
                    if v:FindFirstChildOfClass("BillboardGui") and tonumber(v.EnemyHealthBarGui.HealthText.Text) > 0 then
                        local mag = (LocalPlr.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
                        if mag < dist then
                            dist = mag
                            thing = v
                        end
                    end
                elseif name == "Boss" then
                    if v:FindFirstChildOfClass("BillboardGui") and tonumber(v.EnemyHealthBarGui.HealthText.Text) > 0 and v.EnemyHealthBarGui.Enabled == false then
                        local mag = (LocalPlr.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
                        if mag < dist then
                            dist = mag
                            thing = v
                        end
                    end
                elseif name == "Bring" then
                    if v:FindFirstChildOfClass("BillboardGui") and tonumber(v.EnemyHealthBarGui.HealthText.Text) > 0 and v.Head.Transparency ~= 10 then
                        local mag = (LocalPlr.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
                        if mag < dist then
                            dist = mag
                            thing = v
                        end
                    end
                end
            end
        return thing
        end
        local function enemy_Normal()
            for i,v in ipairs(Workspace.Folders.Monsters:GetChildren()) do
                if v:FindFirstChildOfClass("BillboardGui") and tonumber(v.EnemyHealthBarGui.HealthText.Text) > 0 then
                    return v
                end
            end
        end
        local function enemy_count()
            local CCCCCCC = {}
            for i,v in ipairs(Workspace.Folders.Monsters:GetChildren()) do
                if v:FindFirstChildOfClass("BillboardGui") and tonumber(v.EnemyHealthBarGui.HealthText.Text) > 0 then
                    table.insert(CCCCCCC,v.Name)
                end
            end
            return #CCCCCCC
        end
        local function toHex(color)
            local int = math.floor(color.r*255)*256^2+math.floor(color.g*255)*256+math.floor(color.b*255)
            local current = int
            local final = ""
            local hexChar = {"a", "b", "c", "d", "e", "f"}

            repeat local remainder = current % 16
                local char = tostring(remainder)
                if remainder >= 10 then
                    char = hexChar[1 + remainder - 10]
                end
                current = math.floor(current/16)
                final = final..char
            until current <= 0
            return "0x"..string.reverse(final)
        end
        local function is_usingskill()
            local aim = {}
            for i,v in ipairs(LocalPlr.Character.Humanoid:GetPlayingAnimationTracks()) do
                if v.Name == "Animation" then
                    table.insert(aim,v.Name)
                end
            end
            if LocalPlr.Character.Humanoid.WalkSpeed == 0 then
                table.insert(aim,"Animation")
            end
            return #aim
        end
        local function Boss_Actived()
            return PlrGui.BattleGui.CenterUIFrame.BossHealthFrame.Visible
        end
        local function dist_enemy(part)
            return (LocalPlr.Character.HumanoidRootPart.Position - part.Position).magnitude
        end
        local function tween_function(partX,cframeX,speedX)
            Tween_Info = TweenService:Create(LocalPlr.Character.HumanoidRootPart,TweenInfo.new((partX.Position - LocalPlr.Character.HumanoidRootPart.Position).Magnitude/speedX,Enum.EasingStyle.Linear),{CFrame = partX.CFrame * cframeX})
        end
        local function setCollide(value)
            for i,v in ipairs(LocalPlr.Character:GetChildren()) do
                if v:IsA("BasePart") and v.CanCollide ~= value then
                    v.CanCollide = value
                end
            end
        end
        local function ResultUIR()
            for i,v in ipairs(PlrGui.UniversalGui.UniversalCenterUIFrame.RaidResultUI.Frame:GetDescendants()) do
                if v.Name == "RaidRewardGridFrame" and v.Parent.Name == 'Shadow' then
                    return v
                end
            end
        end
        local function get_value(name)
            if name == "exp" then
                return PlrGui.UniversalGui.LeftUIFrame.OwnHealthBarFrame.Exp.Text:split("%")[1].."/100%"
            elseif name == "BossRush" then
                return PlrGui.MainGui.CenterUIFrame.BossRushShop.BossRushShopCurrencyCounter.BossRushShopCurrencyAmount.Text
            elseif name == "RaidToken" then
                return PlrGui.MainGui.CenterUIFrame.Shop.Frame.ShopRaidTokenCounter.ShopRaidTokenAmount.Text
            elseif name == "TraitToken" then
                return PlrGui.MainGui.CenterUIFrame.CharacterTraitFrame.Frame.TraitGearChangeTrait.Text
            elseif name == "ShadowCoin" then
                return PlrGui.MainGui.CenterUIFrame.RaidShop.SpeedRaidShopUIHolder.SpeedRaidShopCurrencyCounter.SpeedRaidShopCurrencyAmount.Text
            elseif name == "Gold" then
                for i,v in ipairs(PlrGui.UniversalGui.LeftUIFrame.OwnHealthBarFrame:GetDescendants()) do
                    if v.Name == "Gold" and v:IsA("TextLabel") then
                        return v.Text
                    end
                end
            elseif name == "Gem" then
                for i,v in ipairs(PlrGui.UniversalGui.LeftUIFrame.OwnHealthBarFrame:GetDescendants()) do
                    if v.Name == "Gem" and v:IsA("TextLabel") then
                        return v.Text
                    end
                end
            end
        end
        local function Stage()
            return LocalPlr.RespawnLocation.Name:split("SpawnLocation")[2]
        end
        local function teleport_circle()
            local dist, thing = 100, false
            for i,v in ipairs(game:GetService("Workspace").GameMap:FindFirstChildOfClass("Model"):GetChildren()) do
                if string.find(v.Name,"Teleport") and not string.find(v.Name,"Destination") then
                    local mag = (LocalPlr.Character.HumanoidRootPart.Position - v.Position).magnitude
                    if mag < dist and dist_enemy(enemy("AllMob").HumanoidRootPart) > 75 then
                        Playing_Mode = 0
                        dist = mag
                        thing = v
                    end
                end
            end
            return thing
        end
        --// Loading Gui
        local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
        local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
        local O = Fluent.Options
        local Window = Fluent:CreateWindow({
            Title = Game..Update,
            SubTitle = " [YT : @crazyday3693]",
            TabWidth = 160, Size = UDim2.fromOffset(580, 460),
            Acrylic = false,
            Theme = "Amethyst",
            MinimizeKey = nil
        })
        local Tabs = {
            Join = Window:AddTab({ Title = "Join", Icon = "rbxassetid://17629903752"}),
            Game = Window:AddTab({ Title = "Game", Icon = "rbxassetid://17629899973"}),
            Skill = Window:AddTab({ Title = "Skill", Icon = "rbxassetid://17789519521"}),
            Webhook = Window:AddTab({ Title = "Webhook", Icon = "rbxassetid://17789550683"}),
            Settings = Window:AddTab({ Title = "Settings", Icon = "rbxassetid://17630002584"})
        }
        for i,v in pairs(CoreGui:GetChildren()) do
            if v.Name == "ScreenGui" or v.Name == "CrazyDay" then
                for k,g in pairs(v:GetDescendants()) do
                    if g.Name == "TextLabel" and (g.Text == Game..Update or string.find(g.Text,Game)) then
                        for _,imageidof in pairs(g.Parent.Parent:GetChildren()) do
                            if imageidof.Name == "TextButton" and imageidof:FindFirstChild("Icon") and imageidof.Icon.Image == "rbxassetid://9886659276" then
                                imageidof.Visible = false
                            end
                        end
                    end
                end
            end
        end
        while task.wait() do
            if CoreGui:FindFirstChild("CrazyDay") == nil then
                for i,v in pairs(CoreGui:GetChildren()) do
                    if v.Name == "ScreenGui" then
                        for k,g in pairs(v:GetDescendants()) do
                            if g.Name == "TextLabel" and (g.Text == Game..Update or string.find(g.Text,Game)) then
                                g.Parent.Parent.Parent.Parent.Name = "CrazyDay"
                            end
                        end
                    end
                end
            end
            if CoreGui:FindFirstChild("CrazyDay") then
                G["Loading (Gui)"] = true
                Fluent:Notify({Title = "Successfully loaded", Content = "Time: "..tostring(Workspace.DistributedGameTime), SubContent = nil, Duration = 10})
                break
            end
        end
        --// Settings Tabs
        local interface_S = Tabs.Settings:AddSection("Interfaces")
        local setting_S = Tabs.Settings:AddSection("Settings")
        interface_S:AddDropdown("Them", {
            Title = "Them",
            Description = "Changes the interface theme.",
            Values = {
                "Dark",
                "Darker",
                "Light",
                "Aqua",
                "Amethyst",
                "Rose"
            },
            Multi = false,
            Default = 5,
            Callback = function (v)
                Fluent:SetTheme(v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        interface_S:AddToggle("Acrylic", {
            Title = "Acrylic",
            Description = "The blurred background requires graphic quallity 8 +.",
            Default = false,
            Callback = function (v)
                Fluent:ToggleAcrylic(v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        interface_S:AddToggle("Transparency", {
            Title = "Transparency",
            Description = "Makes the interface transparent.",
            Default = false,
            Callback = function (v)
                Fluent:ToggleTransparency(v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        setting_S:AddToggle("Auto Save", {
            Title = "Auto Save",
            Description = "Automatically saves all configuration settings.",
            Default = true,
            Callback = function (v)
                if G["Loading (Gui)"] == false then SaveManager:Save("Configs") end
            end
        })
        setting_S:AddToggle("Auto Hide Gui", {
            Title = "Auto Hide Gui",
            Description = "Automatically hide your gui after execute the script.",
            Default = false,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
                if v == true and Gui_CrazyDay() and not G["Successfully Hide"] then
                    if CoreGui.CrazyDay:FindFirstChild("ToggleClose") then
                        Gui_CrazyDay().Visible = false
                        CoreGui.CrazyDay:FindFirstChild("ToggleClose").Image = "rbxassetid://17789926070"
                        G["Successfully Hide"] = true
                    end
                end
            end
        })
        setting_S:AddToggle("Black Screen", {
            Title = "Black Screen",
            Description = "Disable 3DRendering for best performance.",
            Default = false,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
                if CoreGui:FindFirstChild("CrazyDay") and CoreGui.CrazyDay:FindFirstChild("Black Screen") then
                    CoreGui.CrazyDay["Black Screen"].Visible = v
                    RunService:Set3dRenderingEnabled(not v)
                end
            end
        })
        setting_S:AddButton({
            Title = "Reset all configs",
            Description = "Press the button to reset all configuration to default.",
            Callback = function()
                Window:Dialog({
                    Title = "Notify",
                    Content = "Do you want to reset all configuration?",
                    Buttons = {
                        {
                            Title = "Yes",
                            Callback = function()
                                writefile(CrazyDayF.."settings/Configs.json",[[
                                    {"objects":[{"idx":"Current Dimension","type":"Dropdown","mutli":false,"value":"Titan Dimension"},{"idx":"Max Upgrade","type":"Slider","value":"5"},{"idx":"Auto Save","type":"Toggle","value":true},{"idx":"Current Time Type","type":"Dropdown","mutli":false,"value":"Minute"},{"idx":"Auto Claim (Quest)","type":"Toggle","value":false},{"idx":"Them","type":"Dropdown","mutli":false,"value":"Amethyst"},{"idx":"Auto Equip","type":"Toggle","value":false},{"idx":"Current Difficulty","type":"Dropdown","mutli":false,"value":"Easy"},{"idx":"Health to Safe","type":"Slider","value":"55"},{"idx":"Auto Join (Raid)","type":"Toggle","value":false},{"idx":"Current Distance","type":"Slider","value":"6.5"},{"idx":"Transparency","type":"Toggle","value":false},{"idx":"Skill Two","type":"Dropdown","mutli":false,"value":"2"},{"idx":"Auto Hide Gui","type":"Toggle","value":false},{"idx":"Current Assists","type":"Dropdown","mutli":true,"value":{"Assist2":true,"Fruit1":true,"Fruit2":true,"Assist1":true}},{"idx":"Hard core","type":"Toggle","value":false},{"idx":"Auto Join (Speed Raid)","type":"Toggle","value":false},{"idx":"Acrylic","type":"Toggle","value":false},{"idx":"Auto Join (Raid Challenge)","type":"Toggle","value":false},{"idx":"Auto Equip Character","type":"Toggle","value":false},{"idx":"Webhook URL","type":"Input","text":""},{"idx":"Skill Third","type":"Dropdown","mutli":false,"value":"3"},{"idx":"Auto Skill","type":"Toggle","value":true},{"idx":"Current Skill Distance","type":"Slider","value":"35"},{"idx":"Skill Fifth","type":"Dropdown","mutli":false,"value":"5"},{"idx":"Auto Join (Current Dimension)","type":"Toggle","value":false},{"idx":"Auto Set Distance","type":"Toggle","value":false},{"idx":"Auto Join (Infinite Mode)","type":"Toggle","value":false},{"idx":"Auto Back to Lobby","type":"Toggle","value":false},{"idx":"Send Webhook","type":"Toggle","value":false},{"idx":"Current Attack Method","type":"Dropdown","mutli":false,"value":"Remote"},{"idx":"Skill One","type":"Dropdown","mutli":false,"value":"1"},{"idx":"Dash no cooldown","type":"Toggle","value":false},{"idx":"Auto Retry","type":"Toggle","value":false},{"idx":"Auto Claim (Speed Raid)","type":"Toggle","value":false},{"idx":"Black Screen","type":"Toggle","value":false},{"idx":"Current Time","type":"Slider","value":"15"},{"idx":"Auto Join (Boss Rush)","type":"Toggle","value":false},{"idx":"Auto Upgrade","type":"Toggle","value":false},{"idx":"Auto Safe","type":"Toggle","value":false},{"idx":"Current Rarity","type":"Dropdown","mutli":true,"value":{"Common":true,"Uncommon":true}},{"idx":"Auto Sell","type":"Toggle","value":false},{"idx":"Auto Join (Highnest)","type":"Toggle","value":false},{"idx":"Current Farm Mode","type":"Dropdown","mutli":false,"value":"Bring Mode"},{"idx":"Webhook Color","type":"Colorpicker","transparency":0,"value":"7d7d7d"},{"idx":"Current Method","type":"Dropdown","mutli":false,"value":"Over"},{"idx":"Friends Only","type":"Toggle","value":false},{"idx":"Dodge Skill","type":"Toggle","value":true},{"idx":"Skill Fourth","type":"Dropdown","mutli":false,"value":"4"},{"idx":"Current Raid","type":"Dropdown","mutli":false,"value":"Titan Raid"}]}
                                    ]])
                                    task.wait(0.35)
                                    do
                                        SaveManager:Load("Configs")
                                    end
                                    Fluent:Notify({
                                        Title = "Successfully reseted configs",
                                        Content = " ",
                                        SubContent = nil,
                                        Duration = 3.5
                                    })
                            end
                        },
                        {
                            Title = "No",
                            Callback = function()
                               --// setclipboard(tostring(readfile(CrazyDayF.."settings/Configs.json")))
                            end
                        }
                    }
                })
            end
        })
        --// Join Tabs
        local gen1 = Tabs.Join:AddSection("Dimension")
        gen1:AddDropdown("Current Dimension", {
            Title = "Select Dimension",
            Description = nil,
            Values = Room,
            Multi = false,
            Default = 1,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
                if G["Loading (Gui)"] == false then
                    if (v == Room[5] or v == Room[6] or v == Room[7] or v == Room[8]) and O["Current Difficulty"].Value == "Hard" then
                        O["Current Difficulty"]:SetValue("Easy")
                    elseif (v == Room[9] or v == Room[10] or v == Room[11] or v == Room[12]) and G["Current Difficulty"] ~= "Nightmare" then
                        O["Current Difficulty"]:SetValue("Nightmare")
                    end
                end
            end
        })
        gen1:AddDropdown("Current Difficulty", {
            Title = "Select Difficulty",
            Description = nil,
            Values = {
                "Easy",
                "Hard",
                "Nightmare"
            },
            Multi = false,
            Default = 1,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
                if G["Loading (Gui)"] == false then
                    local Val = O["Current Dimension"].Value
                    if (Val == Room[5] or Val == Room[6] or Val == Room[7] or Val == Room[8]) and v == "Hard" then
                        O["Current Difficulty"]:SetValue("Easy")
                    elseif (Val == Room[9] or Val == Room[10] or Val == Room[11] or Val == Room[12]) and v ~= "Nightmare" then
                        O["Current Difficulty"]:SetValue("Nightmare")
                    end
                end
            end
        })
        gen1:AddToggle("Hard core", {
            Title = "Hard core",
            Description = nil,
            Default = false,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        gen1:AddToggle("Friends Only", {
            Title = "Friends Only",
            Description = nil,
            Default = false,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        gen1:AddToggle("Auto Retry", {
            Title = "Auto Retry",
            Description = "Automatically replay the game if the game ends.",
            Default = false,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        gen1:AddToggle("Auto Join (Current Dimension)", {
            Title = "Auto Join (Current Dimension)",
            Description = "Automatically creates and starts the selected dimension.",
            Default = false,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        gen1:AddToggle("Auto Join (Highnest)", {
            Title = "Auto Join (Highnest)",
            Description = "Automatically create and start the highest dimension.",
            Default = false,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
                if v == true and (game.PlaceId == 7338881230 or game.PlaceId == 6938803436 or game.PlaceId == 7274690025) then
                    local Val1 = O["Current Difficulty"]
                    local Val2 = O["Current Dimension"]
                    if Level.Value > 0 and Level.Value < 6 then
                        Val1.Value = "Easy"
                        Val2.Value = "Titan Dimension"
                    elseif Level.Value > 5 and Level.Value < 11 then
                        Val1.Value = "Hard"
                        Val2.Value = "Titan Dimension"
                    elseif Level.Value > 10 and Level.Value < 16 then
                        Val1.Value = "Nightmare"
                        Val2.Value = "Titan Dimension"
                    elseif Level.Value > 15 and Level.Value < 21 then
                        Val1.Value = "Easy"
                        Val2.Value = "Demon Dimension"
                    elseif Level.Value > 20 and Level.Value < 26 then
                        Val1.Value = "Hard"
                        Val2.Value = "Demon Dimension"
                    elseif Level.Value > 25 and Level.Value < 31 then
                        Val1.Value = "Nightmare"
                        Val2.Value = "Demon Dimension"
                    elseif Level.Value > 30 and Level.Value < 36 then
                        Val1.Value = "Easy"
                        Val2.Value = "Curse Dimension"
                    elseif Level.Value > 35 and Level.Value < 41 then
                        Val1.Value = "Hard"
                        Val2.Value = "Curse Dimension"
                    elseif Level.Value > 40 and Level.Value < 46 then
                        Val1.Value = "Nightmare"
                        Val2.Value = "Curse Dimension"
                    elseif Level.Value > 45 and Level.Value < 51 then
                        Val1.Value = "Easy"
                        Val2.Value = "Villain Dimension"
                    elseif Level.Value > 50 and Level.Value < 56 then
                        Val1.Value = "Hard"
                        Val2.Value = "Villain Dimension"
                    elseif Level.Value > 55 and Level.Value < 61 then
                        Val1.Value = "Nightmare"
                        Val2.Value = "Villain Dimension"
                    elseif Level.Value > 60 and Level.Value < 68 then
                        Val1.Value = "Easy"
                        Val2.Value = "Sword Dimension"
                    elseif Level.Value > 67 and Level.Value < 76 then
                        Val1.Value = "Nightmare"
                        Val2.Value = "Sword Dimension"
                    elseif Level.Value > 75 and Level.Value < 83 then
                        Val1.Value = "Easy"
                        Val2.Value = "Ghoul Dimension"
                    elseif Level.Value > 82 and Level.Value < 91 then
                        Val1.Value = "Nightmare"
                        Val2.Value = "Ghoul Dimension"
                    elseif Level.Value > 90 and Level.Value < 98 then
                        Val1.Value = "Easy"
                        Val2.Value = "Fate Dimension"
                    elseif Level.Value > 97 and Level.Value < 106 then
                        Val1.Value = "Nightmare"
                        Val2.Value = "Fate Dimension"
                    elseif Level.Value > 105 and Level.Value < 113 then
                        Val1.Value = "Easy"
                        Val2.Value = "Slime Dimension"
                    elseif Level.Value > 112 and Level.Value < 121 then
                        Val1.Value = "Nightmare"
                        Val2.Value = "Slime Dimension"
                    elseif Level.Value > 120 and Level.Value < 131 then
                        Val1.Value = "Nightmare"
                        Val2.Value = "Devil Dimension"
                    elseif Level.Value > 130 and Level.Value < 141 then
                        Val1.Value = "Nightmare"
                        Val2.Value = "Pirate Dimension"
                    elseif Level.Value > 140 and Level.Value < 151 then
                        Val1.Value = "Nightmare"
                        Val2.Value = "Alien Dimension"
                    elseif Level.Value > 150  then
                        Val1.Value = "Nightmare"
                        Val2.Value = "Level Dimension"
                    end
                end
            end
        })
        local gen2 = Tabs.Join:AddSection("Raid")
        gen2:AddDropdown("Current Raid", {
            Title = "Select Raid",
            Description = nil,
            Values = {
                "Blue Devil Raid",
                "Titan Raid",
                "Tengoku Raid",
                "Hirito Raid",
                "Psycho Student Raid",
                "Buff Boy Raid",
                "Gear 5 Fluffy Raid"
            },
            Multi = false,
            Default = 1,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        gen2:AddToggle("Auto Join (Raid)", {
            Title = "Auto Join (Raid)",
            Description = "Automatically creates and starts the selected raid",
            Default = false,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        gen2:AddToggle("Auto Join (Raid Challenge)", {
            Title = "Auto Join (Raid Challenge)",
            Description = "Automatically join the raid challenge if reward available.",
            Default = false,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        gen2:AddToggle("Auto Join (Speed Raid)", {
            Title = "Auto Join (Speed Raid)",
            Description = "Automatically join the speed raid if not cooldown.",
            Default = false,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        local gen3 = Tabs.Join:AddSection("Misc")
        gen3:AddToggle("Auto Join (Boss Rush)", {
            Title = "Auto Join (Boss Rush)",
            Description = "Automatically join the boss rush if have free ticket.",
            Default = false,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        gen3:AddToggle("Auto Join (Infinite Mode)", {
            Title = "Auto Join (Infinite Mode)",
            Description = "Automatically join the infinite mode if reward available.",
            Default = false,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        gen3:AddButton({
            Title = "Return to Lobby",
            Description = "Press the button to return to the lobby.",
            Callback = function()
                Window:Dialog({
                    Title = "Notify",
                    Content = "Do you want to teleport to the lobby?",
                    Buttons = {
                        {
                            Title = "Yes",
                            Callback = function()
                                game:GetService("TeleportService"):Teleport(6938803436)
                            end
                        },
                        {
                            Title = "No",
                            Callback = function()
                            end
                        }
                    }
                })
            end
        })
        --// Game Tabs
        local gam1 = Tabs.Game:AddSection("Main")
        gam1:AddDropdown("Current Farm Mode", {
            Title = "Select Mode",
            Description = nil,
            Values = {
                "Normal Mode",
                "Bring Mode"
            },
            Multi = false,
            Default = 2,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
                G["Bringing"] = false
                Playing_Mode = 0
            end
        })
        gam1:AddDropdown("Current Method", {
            Title = "Select Method",
            Description = nil,
            Values = {
                "Behind",
                "Front",
                "Over",
                "Under"
            },
            Multi = false,
            Default = 3,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        gam1:AddSlider("Current Distance",{
            Title = "Current Distance",
            Description = nil,
            Default = 6.55,
            Min = 0,
            Max = 10,
            Rounding = 1,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        gam1:AddSlider("Health to Safe",{
            Title = "Health",
            Description = "Choose the health \nif player below x % HP",
            Default = 50,
            Min = 10,
            Max = 100,
            Rounding = 0,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        gam1:AddToggle("Auto Set Distance", {
            Title = "Auto Set Distance",
            Description = "Automatically set the distance calculated from the size of the enemy.",
            Default = false,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        gam1:AddToggle("Dodge Skill", {
            Title = "Dodge Skill",
            Description = "Dodge all enemy skills.",
            Default = true,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        gam1:AddToggle("Auto Safe", {
            Title = "Auto Safe",
            Description = "Stop all farm if player below x % HP.",
            Default = false,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        local gam2 = Tabs.Game:AddSection("Character")
        gam2:AddParagraph({
            Title = "Current Character",
            Content = "nil\nnil\nnil"
        })
        if isfile(CrazyDayF.."Character Save.json") and string.find(readfile(CrazyDayF.."Character Save.json"),"Character") then
            local CLha = HttpService:JSONDecode(readfile(CrazyDayF.."Character Save.json"))
            SetParagraphValue(2,"Character","Current Character",
            CLha["Character1"].."\n"..
            CLha["Character2"].."\n"..
            CLha["Character3"],
            4
        )
        end
        gam2:AddToggle("Auto Equip Character", {
            Title = "Auto Equip Character",
            Description = "Automatically equips characters.",
            Default = false,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        gam2:AddButton({
            Title = "Save Character",
            Description = "Press the button to save your characters.",
            Callback = function()
                local CLSa = {}
                CLSa["Character1"] = StatDisplay.CharacterName.Value
                CLSa["Character2"] = StatDisplay.AssistCharacterName1.Value
                CLSa["Character3"] = StatDisplay.AssistCharacterName2.Value
                CLSa["Character"] = PlrGui.UniversalGui.LeftUIFrame.OwnHealthBarFrame.CharacterTriIcon.Image:split("rbxassetid://")[2]
                Fluent:Notify({
                    Title = "Successfully saved",
                    Content = CLSa["Character1"].."\n"..CLSa["Character2"].."\n"..CLSa["Character3"],
                    SubContent = nil,
                    Duration = 5
                })
                writefile(CrazyDayF.."Character Save.json",HttpService:JSONEncode(CLSa))
                SetParagraphValue(2,"Character","Current Character",
                CLSa["Character1"].."\n"..
                CLSa["Character2"].."\n"..
                CLSa["Character3"],
                4
            )
            end
        })
        local gam3 = Tabs.Game:AddSection("Card")
        gam3:AddDropdown("Current Rarity", {
            Title = "Select Rarity",
            Description = nil,
            Values = {
                "Common",
                "Uncommon",
                "Rare",
                "Epic",
                "Legendary",
                "Mythic"
            },
            Multi = true,
            Default = {
                "Common",
                "Uncommon"
            },
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
                CardStepNumber = 0
                G["Rarity Insert"] = true G["Number of cards"] = tonumber(StatDisplay.CardsOwned.Value)
                Rarity = {}
                for Key,Value in pairs(v) do
                    if Value == true then
                        table.insert(Rarity,Key)
                    end
                end
            end
        })
        gam3:AddSlider("Max Upgrade",{
            Title = "Current Max Upgrade",
            Description = "Select the value you want for upgrade your card.",
            Default = 5,
            Min = 1,
            Max = 25,
            Rounding = 0,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        gam3:AddToggle("Auto Sell", {
            Title = "Auto Sell",
            Description = "Automatically sell all of the selected cards (rarity).",
            Default = false,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
                if v == true then CardStepNumber = 0 G["Number of cards"] = tonumber(StatDisplay.CardsOwned.Value) end
            end
        })
        gam3:AddToggle("Auto Equip", {
            Title = "Auto Equip",
            Description = "Automatically equip your best card.",
            Default = false,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
                if v == true and NotEquip() ~= "Zero" then UnEquip() end
            end
        })
        gam3:AddToggle("Auto Upgrade", {
            Title = "Auto Upgrade",
            Description = "Automatically upgrade all your equipped cards.",
            Default = false,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        local gam4 = Tabs.Game:AddSection("Time")
        gam4:AddParagraph({
            Title = "Time: 00:00:00",
            Content = nil
        })
        if isfile(CrazyDayF.."Timer.json") then
            local r = {
                string.find(readfile(CrazyDayF.."Timer.json"),"H"),
                string.find(readfile(CrazyDayF.."Timer.json"),"M"),
                string.find(readfile(CrazyDayF.."Timer.json"),"S")
            }
            if r[1] and r[2] and r[3] then
                local T = HttpService:JSONDecode(readfile(CrazyDayF.."Timer.json"))

                local h, m, s

                if string.len(T["S"]) == 1 then
                    s = "0"..T["S"]
                else
                    s = T["S"]
                end
                if string.len(T["M"]) == 1 then
                    m = "0"..T["M"]
                else
                    m = T["M"]
                end
                if string.len(T["H"]) == 1 then
                    h = "0"..T["H"]
                else
                    h = T["H"]
                end

                SetParagraphValue(2,"Time",1,"Time: "..h..":"..m..":"..s,3)
            end
        end
        gam4:AddDropdown("Current Time Type", {
            Title = "Select Type",
            Description = nil,
            Values = {
                "Second",
                "Minute",
                "Hour"
            },
            Multi = false,
            Default = 2,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        gam4:AddSlider("Current Time",{
            Title = "Current Time",
            Description = nil,
            Default = 15,
            Min = 1,
            Max = 60,
            Rounding = 0,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        gam4:AddToggle("Auto Back to Lobby", {
            Title = "Auto Back to Lobby",
            Description = "Automatically teleport to the lobby \nif the time reach x current time.",
            Default = false,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        local gam5 = Tabs.Game:AddSection("Misc")
        gam5:AddToggle("Auto Claim (Quest)", {
            Title = "Auto Claim (Quest)",
            Description = "Automatically claim all of the daily // weekly quests.",
            Default = false,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        gam5:AddToggle("Auto Claim (Speed Raid)", {
            Title = "Auto Claim (Speed Raid)",
            Description = "Automatically claim all of the speed raid reward.",
            Default = false,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        gam5:AddToggle("Dash no cooldown", {
            Title = "Dash no cooldown",
            Description = "Makes your dash have no cooldown.",
            Default = false,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
                StatDisplay.No_DashCooldown.Value = v
            end
        })
        gam5:AddButton({
            Title = "Redeem All Code",
            Description = "Press the button to redeem all code.",
            Callback = function()
                if game.PlaceId ~= 7338881230 and game.PlaceId ~= 6938803436 and game.PlaceId ~= 7274690025 then return end
                local Code = {}
                for i,v in pairs(Workspace.Leaderboards.MilestoneBoard.Center.Surface.ScrollingFrame:GetChildren()) do
                    if v:IsA("Frame") and v.MilestoneCode.Text ~= "LOCKED" then
                        RemoteFunction:InvokeServer("RedeemPromoCode",v.MilestoneCode.Text)
                        table.insert(Code,v.MilestoneCode.Text)
                    end
                end
                Fluent:Notify({
                    Title = "Successfully redeem code",
                    Content = table.concat(Code,"\n"),
                    SubContent = nil,
                    Duration = 3.5
                })
            end
        })
        --// Skill Tabs
        local ski1 = Tabs.Skill:AddSection("Skill")
        ski1:AddDropdown("Current Assists", {
            Title = "Select (Assists / Fruits)",
            Description = nil,
            Values = {
                "Assist1",
                "Assist2",
                "Fruit1",
                "Fruit2"
            },
            Multi = true,
            Default = {
                "Assist1",
                "Assist2",
                "Fruit1",
                "Fruit2"
            },
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
                G["Assists Insert"] = true
            end
        })
        ski1:AddDropdown("Current Attack Method", {
            Title = "Current Attack Method",
            Description = nil,
            Values = {
                "Remote",
                "Click"
            },
            Multi = false,
            Default = 1,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        ski1:AddDropdown("Skill One", {
            Title = "Skill One",
            Values = {
                "1",
                "2",
                "3",
                "4",
                "5"
            },
            Multi = false,
            Default = 1,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        ski1:AddDropdown("Skill Two", {
            Title = "Skill Two",
            Values = {
                "1",
                "2",
                "3",
                "4",
                "5"
            },
            Multi = false,
            Default = 2,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        ski1:AddDropdown("Skill Third", {
            Title = "Skill Third",
            Values = {
                "1",
                "2",
                "3",
                "4",
                "5"
            },
            Multi = false,
            Default = 3,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        ski1:AddDropdown("Skill Fourth", {
            Title = "Skill Fourth",
            Values = {
                "1",
                "2",
                "3",
                "4",
                "5"
            },
            Multi = false,
            Default = 4,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        ski1:AddDropdown("Skill Fifth", {
            Title = "Skill Fifth",
            Values = {
                "1",
                "2",
                "3",
                "4",
                "5"
            },
            Multi = false,
            Default = 5,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        ski1:AddSlider("Current Skill Distance",{
            Title = "Current Skill Distance",
            Description = "Choose the distance to attack and skill the enemy.",
            Default = 35,
            Min = 15,
            Max = 150,
            Rounding = 0,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        ski1:AddToggle("Auto Skill", {
            Title = "Auto Skill",
            Description = "Automatically attacks and skills on enemies.",
            Default = true,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        --// Webhook Tabs
        local web1 = Tabs.Webhook:AddSection("Webhook")
        web1:AddInput("Webhook URL", {
            Title = "Webhook URL.",
            Description = nil,
            Default = nil,
            Placeholder = "Url.",
            Numeric = false,
            Finished = false,
            Callback = function(v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        web1:AddColorpicker("Webhook Color", {
            Title = "Webhook Color",
            Description = "Choose the color of the webhook.",
            Default = Color3.fromRGB(125, 125, 125),
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
            end
        })
        web1:AddToggle("Send Webhook", {
            Title = "Send Webhook",
            Description = "Send a notifaction to your Discord when the game ends,displaying information about that match and what rewards you've received.",
            Default = false,
            Callback = function (v)
                if G["Loading (Gui)"] == false and O["Auto Save"].Value == true then SaveManager:Save("Configs") end
                if v == true and not string.find(O["Webhook URL"].Value,"https://discord.com/api/webhooks") then
                    O["Send Webhook"]:SetValue(false)
                    Fluent:Notify({
                        Title = "Send Webhook (Error)",
                        Content = "URL does not match the database.",
                        SubContent = nil,
                        Duration = 2.5
                    })
                end
            end
        })
        web1:AddButton({
            Title = "Check Webhook",
            Description = "Press the button see if the webhook working.",
            Callback = function()
                if not string.find(O["Webhook URL"].Value,"https://discord.com/api/webhooks") then
                return
                Fluent:Notify({
                    Title = "Send Webhook (Error)",
                    Content = "URL does not match the database.",
                    SubContent = nil,
                    Duration = 2.5
                })
                end
                local Data = game:GetService("HttpService"):JSONEncode({
                    ["username"] = "Anime Dimensions Simulator : Notification",
                    ["avatar_url"] = "https://tr.rbxcdn.com/1fb0c8f3fe70c5ec485cfab729d4ac44/150/150/Image/Webp",
                    content = nil,
                    embeds = {{
                      ["title"] = nil,
                      ["color"] = tonumber(toHex(O["Webhook Color"].Value)) or 0x7d7d7d,
                      ["description"] = nil,
                      ["footer"] = {
                        ["text"] = "Time: "..os.date("%c").."\nCredit: YT » @crazyday3693",
                        ["icon_url"] = "https://yt3.ggpht.com/yti/ANjgQV_KI8R3VhsnEhzYD0M1EJXUU29p0YC5gzrrhv8nWzA7j6s=s88-c-k-c0x00ffffff-no-rj"
                      },
                      ["thumbnail"] = {
                        ["url"] = "https://tr.rbxcdn.com/1fb0c8f3fe70c5ec485cfab729d4ac44/150/150/Image/Webp",
                      },
                      ["fields"] = {
                        {
                            ["name"] = "__**Status**__",
                            ["value"] = "__**||Username : "..tostring(LocalPlr.Name).."||**__\n`The webhook is working.`",
                            ["inline"] = false
                        }
                    },
                }}
                })
                G["response"]({Url = O["Webhook URL"].Value, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = Data})
            end
        })
        --//Load configuration
        do
            SaveManager:SetLibrary(Fluent)
            SaveManager:SetFolder("CrazyDay/"..Game.."/"..LocalID)
            SaveManager:IgnoreThemeSettings()
            Window:SelectTab(1)
            if isfile(CrazyDayF.."settings/Configs.json") then SaveManager:Load("Configs") end
            G["Loading (Gui)"] = false
            if not G["Rarity Insert"] then
                O["Current Rarity"]:SetValue({
                    ["Common"] = true,
                    ["Uncommon"] = true
                })
            end
            if not G["Assists Insert"] then
                O["Current Assists"]:SetValue({
                    ["Assist1"] = true,
                    ["Assist2"] = true,
                    ["Fruit1"] = true,
                    ["Fruit2"] = true
                })
            end
        end
        --// Loadfunction for the script
        repeat wait() until Gui_CrazyDay()

        local MainCenterUi, BattleCenterUi, GameMap =
            PlrGui:WaitForChild("MainGui"):WaitForChild("CenterUIFrame"),
            PlrGui:WaitForChild("BattleGui"):WaitForChild("CenterUIFrame"),
            Workspace:WaitForChild("GameMap"):FindFirstChildOfClass("Model").Name
        for i,v in ipairs(CoreGui:FindFirstChild("CrazyDay"):GetChildren()) do
            if v:IsA("Frame") then
                v.ZIndex = math.huge
            end
        end
        --// Instance Child
        instance_F.Name = "Black Screen"
        instance_F.Parent = CoreGui:FindFirstChild("CrazyDay")
        instance_F.AnchorPoint = Vector2.new(1, 1)
        instance_F.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        instance_F.BorderSizePixel = 0
        instance_F.ZIndex = 1
        instance_F.Position = UDim2.new(1.00222063, 0, 1.01891279, 0)
        instance_F.Size = UDim2.new(10, 0, 10, 0)
        instance_F.Visible = O["Black Screen"].Value or false
        RunService:Set3dRenderingEnabled(not O["Black Screen"].Value or true)

        instance_I.Name = "ToggleClose"
        instance_I.Parent = CoreGui:FindFirstChild("CrazyDay")
        instance_I.AnchorPoint = Vector2.new(0.5, 0.5)
        instance_I.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        instance_I.BorderColor3 = Color3.fromRGB(0, 0, 0)
        instance_I.BorderSizePixel = 0
        instance_I.ZIndex = 9999
        instance_I.Position = UDim2.new(0, 41, 0, 523)
        instance_I.Size = UDim2.new(0, 65, 0, 65)
        instance_I.Image = "rbxassetid://17789924997"

        instance_U1.Parent = instance_I
        instance_U1.CornerRadius = UDim.new(1, 1)

        instance_U2.Parent = instance_I
        instance_U2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        instance_U2.LineJoinMode = Enum.LineJoinMode.Round
        instance_U2.Thickness = 1
        instance_U2.Color = Color3.fromRGB(120, 120, 120)

        Connect1 = instance_I.InputBegan:Connect(function(input)
            if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                Gui_CrazyDay().Visible = not Gui_CrazyDay().Visible
                if not Gui_CrazyDay().Visible then
                    instance_I.Image = "rbxassetid://17789926070"
                else
                    instance_I.Image = "rbxassetid://17789924997"
                end
            end
        end)
        if O["Auto Hide Gui"].Value == true and not G["Successfully Hide"] then
            Gui_CrazyDay().Visible = false
            instance_I.Image = "rbxassetid://17789926070"
            G["Successfully Hide"] = true
        end

        coroutine.resume(coroutine.create(function () --// Unload Gui
            while true do
                if O["Auto Join (Raid)"].Value == true and Level.Value >= 15 and tonumber(os.date("!*t").min) <= 8 then
                    G["Auto Join (Raid)"] = true
                elseif O["Auto Join (Raid)"].Value == true and Level.Value >= 15 and tonumber(os.date("!*t").min) > 8 then
                    G["Auto Join (Raid)"] = false
                elseif O["Auto Join (Raid)"].Value == false and G["Auto Join (Raid)"] == true then
                    G["Auto Join (Raid)"] = false
                end
                if Fluent.Unloaded then
                    G["Auto Lobby (Actived)"] = false
                    Playing_Mode = 0
                    bv.Parent = nil
                    if LocalPlr.Character ~= nil then LocalPlr.Character.Humanoid.PlatformStand = false end
                    RunService:Set3dRenderingEnabled(true)
                    if Connect1 then Connect1:Disconnect() end
                    for i, v in ipairs(Workspace.Folders.Monsters:GetChildren()) do
                        if v:FindFirstChildOfClass("BillboardGui") and v:FindFirstChild("Head") then
                            v.Head.Transparency = 1
                        end
                    end
                    if Tween_Info ~= nil then Tween_Info:Cancel() end
                    break
                end
                wait(0.075)
            end
        end))

        if GameMap == "CharacterTest" then return Fluent:Notify({
            Title = "Failed to load function (Error)",
            Content = "This map is not supported.",
            SubContent = nil,
            Duration = 99999999
        })
        end

        local function auto_farm()
            if (O["Auto Join (Current Dimension)"].Value == false and O["Auto Join (Highnest)"].Value == false and O["Auto Join (Raid)"].Value == false and O["Auto Join (Raid Challenge)"].Value == false and O["Auto Join (Speed Raid)"].Value == false and O["Auto Join (Boss Rush)"].Value == false and O["Auto Join (Infinite Mode)"].Value == false) then
                return false
            elseif (O["Auto Join (Current Dimension)"].Value == true or O["Auto Join (Highnest)"].Value == true or O["Auto Join (Raid)"].Value == true or O["Auto Join (Raid Challenge)"].Value == true or O["Auto Join (Speed Raid)"].Value == true or O["Auto Join (Boss Rush)"].Value == true or O["Auto Join (Infinite Mode)"].Value == true) then
                return true
            end
        end

        coroutine.resume(coroutine.create(function () --// Character Connect
            if (game.PlaceId == 7338881230 or game.PlaceId == 6938803436 or game.PlaceId == 7274690025) or Fluent.Unloaded then coroutine.yield() end
            LocalPlr:GetPropertyChangedSignal("RespawnLocation"):Connect(function ()
                if Fluent.Unloaded then coroutine.yield() end
                Playing_Mode = 0
                G["Spawning Enemy"] = true
                task.wait(0.75)
                G["Spawning Enemy"] = false
            end)
            local function ontounching_ignore()
                pcall(function()
                    LocalPlr.Character.HumanoidRootPart.Touched:Connect(function(part)
                        if Fluent.Unloaded then coroutine.yield() end
                        if not G["Dodgeing"] and part.Name == "Ignore" then
                            G["Dodgeing"] = true
                            repeat task.wait(0) if Tween_Info ~= nil then Tween_Info:Cancel() end until not part.Parent
                            G["Dodgeing"] = false
                        end
                    end)
                end)
            end
            local function onCharacterAdded(char)
                local humanoid = char:WaitForChild("Humanoid", 5)
                if not humanoid then
                    return
                end
                humanoid.Died:Connect(function()
                    G["Dodgeing"] = false
                    G["Bringing"] = false
                    G["Safe Mode"] = false
                    G["Died"] = true
                    Playing_Mode = 0
                    Connect2 =  LocalPlr.CharacterAdded:Connect(function()
                        if Fluent.Unloaded then coroutine.yield() end
                        wait(1.15)
                        Playing_Mode = 0
                        G["Died"] = false
                        ontounching_ignore()
                        for i, v in ipairs(Workspace.Folders.Monsters:GetChildren()) do
                            if v:FindFirstChildOfClass("BillboardGui") and v:FindFirstChild("Head") then
                                v.Head.Transparency = 1
                            end
                        end
                        if Connect2 then Connect2:Disconnect() Connect2 = nil end
                    end)
                end)
            end
            LocalPlr.CharacterAdded:Connect(onCharacterAdded)
            do
                repeat wait() until tonumber(PlrGui.UniversalGui.LeftUIFrame.OwnHealthBarFrame.HealthAmount.Text) > 0
                local char = LocalPlr.Character or LocalPlr.CharacterAdded:Wait()
                if char then
                    ontounching_ignore()
                    onCharacterAdded(char)
                end
            end
            Workspace.Folders.Debris.ChildAdded:Connect(function (v)
                if Fluent.Unloaded then coroutine.yield() end
                if O["Dodge Skill"].Value == true and (v.Name == "FlameTrail" or table.find({"telegraph"},v.Name:lower())) and not v:IsA("Model") and not G["Bringing"] and not G["Safe Mode"] and not G["Bringing Infinite"] then
                    if v.Name == "FlameTrail" then
                        task.wait(0.055)
                        if v:FindFirstChild("P1") == nil then return
                        elseif v:FindFirstChild("P1") and v.P1.Texture ~= "rbxassetid://6169516856" then return
                        end
                    end
                    local a = v:Clone()
                    local side = math.clamp(3.75,0,10)
                    local Sizeto = v.Size + Vector3.new(side,100,side)
                    a.Size = Vector3.new(0,0,v.Size.Z)
                    if v.ClassName == "MeshPart" then
                        a.Size = Vector3.new(0,0,100)
                        Sizeto = v.Size + Vector3.new(side,side,100)
                    end
                    game:GetService("TweenService"):Create(a,TweenInfo.new(0.315),{Size = Sizeto}):Play()
                    a.CFrame = v.CFrame + Vector3.new(0,0,0)
                    a.Anchored = true
                    a.Transparency = 1
                    a.CanCollide = true
                    a.Name = "Ignore"
                    a.Parent = v.Parent
                    repeat task.wait(0) until not v.Parent or O["Dodge Skill"].Value == false or G["Bringing"] == true or G["Safe Mode"] == true or G["Bringing Infinite"] == true or enemy_count() == 0 or Fluent.Unloaded
                    a:Destroy()
                end
            end)
            if GameMap == "Infinite Mode" then
                BattleCenterUi.WaveClearClearText:GetPropertyChangedSignal("Text"):Connect(function ()
                    if Fluent.Unloaded then coroutine.yield() end
                    local Val = BattleCenterUi.WaveClearClearText.Text
                    if Val:len() == 2 and Val.find(Val,"0") == 2 then
                        G["Bringing Infinite"] = false
                    elseif Val:len() == 3 and Val.find(Val,"0") == 3 or (Val.find(Val,"00")) then
                        G["Bringing Infinite"] = false
                    else
                        G["Bringing Infinite"] = true
                        task.wait(3.5)
                        G["Bringing Infinite"] = false
                    end
                end)
            end
        end))
        coroutine.resume(coroutine.create(function () --// Current Method
            while true do
                pcall(function ()
                    if (game.PlaceId == 7338881230 or game.PlaceId == 6938803436 or game.PlaceId == 7274690025) or Fluent.Unloaded then coroutine.yield() end
                    if LocalPlr.Character.HumanoidRootPart.Anchored == true then LocalPlr.Character.HumanoidRootPart.Anchored = false end
                    local is_blacklist = table.find(BlackList_Characters,StatDisplay.CharacterName.Value)
                    if auto_farm() == true and teleport_circle() ~= false and not G["Died"] then
                        tween_function(teleport_circle(), CFrame.new(0, 0, 0), 135)
                        Tween_Info:Play()
                        Tween_Info.Completed:Wait()
                    end
                    if is_blacklist == nil then
                        if O["Auto Set Distance"].Value == true then
                            if Boss_Actived() == true then
                                if O["Current Method"].Value == "Over" then
                                    G["Method"] = CFrame.new(0, enemy("Boss").HumanoidRootPart.Size.Y - (enemy("Boss").HumanoidRootPart.Size.Y  - 3.5), 0) * CFrame.Angles(math.rad(-90),0,0)
                                elseif O["Current Method"].Value == "Under" then
                                    G["Method"] = CFrame.new(0,-enemy("Boss").HumanoidRootPart.Size.Y - (enemy("Boss").HumanoidRootPart.Size.Y - 3.5), 0) * CFrame.Angles(math.rad(90),0,0)
                                elseif O["Current Method"].Value == "Front" then
                                    G["Method"] = CFrame.new(0, 0, -enemy("Boss").HumanoidRootPart.Size.Z + 3.5) * CFrame.Angles(math.rad(0),1800,0)
                                elseif O["Current Method"].Value == "Behind" then
                                    G["Method"] = CFrame.new(0, 0, enemy("Boss").HumanoidRootPart.Size.Z + 3.5)
                                end
                            elseif Boss_Actived() == false then
                                if O["Current Method"].Value == "Over" then
                                    G["Method"] = CFrame.new(0, enemy("AllMob").HumanoidRootPart.Size.Y + 3.65, 0) * CFrame.Angles(math.rad(-90),0,0)
                                elseif O["Current Method"].Value == "Under" then
                                    G["Method"] = CFrame.new(0, -enemy("AllMob").HumanoidRootPart.Size.Y - 3.65, 0) * CFrame.Angles(math.rad(90),0,0)
                                elseif O["Current Method"].Value == "Front" then
                                    G["Method"] = CFrame.new(0, 0, -enemy("AllMob").HumanoidRootPart.Size.Z + 3.65) * CFrame.Angles(math.rad(0),1800,0)
                                elseif O["Current Method"].Value == "Behind" then
                                    G["Method"] = CFrame.new(0 ,0 ,enemy("AllMob").HumanoidRootPart.Size.Z + 3.65)
                                end
                            end
                        elseif O["Auto Set Distance"].Value == false then
                            if O["Current Method"].Value == "Over" then
                                G["Method"] = CFrame.new(0, O["Current Distance"].Value, 0) * CFrame.Angles(math.rad(-90),0,0)
                            elseif O["Current Method"].Value == "Under" then
                                G["Method"] = CFrame.new(0, -O["Current Distance"].Value, 0) * CFrame.Angles(math.rad(90),0,0)
                            elseif O["Current Method"].Value == "Front" then
                                G["Method"] = CFrame.new(0, 0, -O["Current Distance"].Value) * CFrame.Angles(math.rad(0),1800,0)
                            elseif O["Current Method"].Value == "Behind" then
                                G["Method"] = CFrame.new(0, 0, O["Current Distance"].Value)
                            end
                        end
                    elseif is_blacklist ~= nil then
                        if O["Current Method"].Value == "Over" then
                            G["Method"] = CFrame.new(0 ,1.5 ,0) * CFrame.Angles(math.rad(-90),0,0)
                        elseif O["Current Method"].Value == "Under" then
                            G["Method"] = CFrame.new(0 ,-1.5 ,0) * CFrame.Angles(math.rad(90),0,0)
                        elseif O["Current Method"].Value == "Front" then
                            G["Method"] = CFrame.new(0, 0, -1.5) * CFrame.Angles(math.rad(0),1800,0)
                        elseif O["Current Method"].Value == "Behind" then
                            G["Method"] = CFrame.new(0, 0, 1.5)
                        end
                    end
                end)
                task.wait(0)
            end
        end))
        coroutine.resume(coroutine.create(function ()
            while true do
                pcall(function ()
                    if (game.PlaceId ~= 7338881230 and game.PlaceId ~= 6938803436 and game.PlaceId ~= 7274690025) or Fluent.Unloaded then coroutine.yield() end
                    if O["Auto Equip Character"].Value == true and not G["Not Equip Character"] then
                        if isfile(CrazyDayF.."Character Save.json") and string.find(readfile(CrazyDayF.."Character Save.json"),"Character") then
                            local ab = HttpService:JSONDecode(readfile(CrazyDayF.."Character Save.json"))
                            if StatDisplay.CharacterName.Value ~= ab["Character1"] or StatDisplay.AssistCharacterName1.Value ~= ab["Character2"] or StatDisplay.AssistCharacterName2.Value ~= ab["Character3"] then
                                repeat
                                    RemoteFunction:InvokeServer("EquipCharacter",ab['Character1'])
                                    RemoteFunction:InvokeServer("EquipCharacterAssist",ab['Character2'],1)
                                    RemoteFunction:InvokeServer("EquipCharacterAssist",ab['Character3'],2)
                                wait(0)
                                until StatDisplay.CharacterName.Value == ab["Character1"] and StatDisplay.AssistCharacterName1.Value == ab["Character2"] and StatDisplay.AssistCharacterName2.Value == ab["Character3"]
                                PlrGui.UniversalGui.LeftUIFrame.OwnHealthBarFrame.CharacterTriIcon.Image = "rbxassetid://"..ab["Character"]
                                Fluent:Notify({
                                    Title = "Successfully Equip Characters",
                                    Content = ab["Character1"].."\n"..ab["Character2"].."\n"..ab["Character3"],
                                    SubContent = nil,
                                    Duration = 2.75
                                })
                            end
                        end
                    end
                end)
                task.wait(0)
            end
        end))
        coroutine.resume(coroutine.create(function ()--// Auto Farm Misc
            while true do
                pcall(function ()
                    if (game.PlaceId == 7338881230 or game.PlaceId == 6938803436 or game.PlaceId == 7274690025) or Fluent.Unloaded then coroutine.yield() end
                    local ResUi = PlrGui.UniversalGui.UniversalCenterUIFrame.ResultUI

                    if O["Auto Retry"].Value == true and ResUi.Visible == true and ResUi.Frame.RetryDungeonButton.Visible == true and tonumber(Stage()) > 1 then
                        firesignal(ResUi.Frame.RetryDungeonButton.MouseButton1Down)
                    elseif O["Auto Retry"].Value == false and ResUi.Visible == true and ResUi.Frame.LeaveDungeonButton.Visible == true then
                        firesignal(ResUi.Frame.LeaveDungeonButton.MouseButton1Down)
                    end

                    if auto_farm() == true then
                        if not G["Dodgeing"] then
                            setCollide(false)
                            LocalPlr.Character.Humanoid.PlatformStand = true
                        elseif G["Dodgeing"] then
                            setCollide(true)
                            LocalPlr.Character.Humanoid.PlatformStand = false
                        end
                        local BeenASecond, V3 = false, Vector3.new(0, 0, 0)
                        for _, v in ipairs(LocalPlr.Character:GetDescendants()) do
                            if v.IsA(v, "BasePart") then
                                v.Velocity, v.RotVelocity = V3, V3
                            end
                        end

                        bv.Parent = LocalPlr.Character.HumanoidRootPart
                        bv.MaxForce = Vector3.new(100000,100000,100000)
                        bv.Velocity = Vector3.new(0,0,0)

                        if G["Bringing"] == true and enemy("Bring") ~= false and dist_enemy(enemy("Bring").HumanoidRootPart) <= 13.75 then
                            for i, v in ipairs(Workspace.Folders.Monsters:GetChildren()) do
                                if v:FindFirstChildOfClass("BillboardGui") and v:FindFirstChild("Head") and v.Head.Transparency ~= 10 then
                                    if (LocalPlr.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude <= 37.5 then
                                        v.Head.Transparency = 10
                                    end
                                end
                            end
                        end
                    elseif auto_farm() == false then
                        bv.Parent = nil
                        if LocalPlr.Character.Humanoid.PlatformStand == true then LocalPlr.Character.Humanoid.PlatformStand = false end
                        if Tween_Info ~= nil then Tween_Info:Cancel() end
                    end

                    if (game.PlaceId ~= 7338881230 and game.PlaceId ~= 6938803436 and game.PlaceId ~= 7274690025) and G["Auto Join (Raid)"] == true and not GameMap.find(GameMap,"Raid") then
                        Fluent:Notify({
                            Title = "Auto Join (Raid)",
                            Content = "The raid has opened.",
                            SubContent = "Teleporting in 5 seconds.",
                            Duration = 5
                        })
                        task.wait(5)
                        game:GetService("TeleportService"):Teleport(7338881230)
                        coroutine.yield()
                    end
                end)
                task.wait(0)
            end
        end))
        coroutine.resume(coroutine.create(function ()--// Auto Farm Misc
            while true do
                pcall(function ()
                    if (game.PlaceId == 7338881230 or game.PlaceId == 6938803436 or game.PlaceId == 7274690025) or Fluent.Unloaded then coroutine.yield() end
                    if O["Auto Safe"].Value == true and auto_farm() == true and tonumber(PlrGui.UniversalGui.LeftUIFrame.OwnHealthBarFrame.HealthAmount.Text) < tonumber(O["Health to Safe"].Value * (LocalPlr.Character.Head.PlayerHealthBarGui.HealthText.Text:split("/")[2] / 100)) and not G["Died"] then
                        G["Safe Mode"] = true
                    elseif O["Auto Safe"].Value == true and auto_farm() == true and tonumber(PlrGui.UniversalGui.LeftUIFrame.OwnHealthBarFrame.HealthAmount.Text) >= tonumber(O["Health to Safe"].Value * (LocalPlr.Character.Head.PlayerHealthBarGui.HealthText.Text:split("/")[2] / 100)) and not G["Died"] then
                        G["Safe Mode"] = false
                    elseif O["Auto Safe"].Value == false and G["Safe Mode"] == true then
                        G["Safe Mode"] = false
                    end
                    if G["Safe Mode"] == true and not G["Died"] and not G["Bringing"] and not G["Bringing Infinite"] then
                        for i,v in pairs(Workspace.Folders.SpawnPoints:GetChildren()) do
                            if v.Name == LocalPlr.RespawnLocation.Name then
                                tween_function(v, CFrame.new(0, 75, 0), 135)
                                Tween_Info:Play()
                            end
                        end
                    end
                    if auto_farm() == true and Boss_Actived() == true and teleport_circle() == false and not G["Safe Mode"] and not G["Dodgeing"] and not G["Died"] then
                        repeat
                            tween_function(enemy("Boss").HumanoidRootPart, G["Method"], 135)
                            Tween_Info:Play()
                            task.wait(0)
                        until G["Safe Mode"] == true or G["Dodgeing"] == true or G["Died"] == true or Boss_Actived() == false or auto_farm() == false or teleport_circle() ~= false or Fluent.Unloaded
                        Tween_Info:Cancel()
                    end
                end)
                task.wait(0)
            end
        end))
        coroutine.resume(coroutine.create(function () --//  Auto Farm Infinite Mode ใส่แยกเพราะแลคบางครั้ง
            while true do
                pcall(function ()
                    if (game.PlaceId == 7338881230 or game.PlaceId == 6938803436 or game.PlaceId == 7274690025) or Fluent.Unloaded or GameMap ~= "Infinite Mode" then coroutine.yield() end
                    if auto_farm() == true and Boss_Actived() == false and not G["Dided"] then
                        if enemy_count() == 0 then
                            local Base = game:GetService("Workspace").Folders.SpawnPoints.SpawnLocation1
                            tween_function(Base, CFrame.new(0, 55, 0) ,135)
                            Tween_Info:Play()
                        elseif not G["Bringing Infinite"] and not G["Safe Mode"] and not G["Dodgeing"] then
                            repeat
                                tween_function(enemy("AllMob").HumanoidRootPart, G["Method"], 135)
                                Tween_Info:Play()
                                task.wait(0)
                            until G["Safe Mode"] == true or enemy_count() == 0 or G["Dodgeing"] == true or G["Died"] == true or Boss_Actived() == true or auto_farm() == false or Fluent.Unloaded
                            Tween_Info:Cancel()
                        end
                    end
                end)
                task.wait(0)
            end
        end))
        coroutine.resume(coroutine.create(function () --// Auto Farm Enemy
            while true do
                pcall(function ()
                    if (game.PlaceId == 7338881230 or game.PlaceId == 6938803436 or game.PlaceId == 7274690025) or Fluent.Unloaded or GameMap == "Infinite Mode" then coroutine.yield() end
                    if auto_farm() == true and Boss_Actived() == false and teleport_circle() == false and not G["Died"] then
                        if O["Current Farm Mode"].Value == "Bring Mode" and not G["Spawning Enemy"] then
                            if Playing_Mode == 0 and enemy("Bring") ~= false then
                                repeat
                                    G["Bringing"] = true
                                    tween_function(enemy("Bring").HumanoidRootPart, CFrame.new(0,10,0), 135)
                                    Tween_Info:Play()
                                    task.wait(0.0875)
                                until Playing_Mode > 0 or enemy("Bring") == false or auto_farm() == false or G["Spawning Enemy"] == true or G["Died"] == true or Boss_Actived() == true or teleport_circle() ~= false or Fluent.Unloaded
                                Playing_Mode = 1
                            elseif Playing_Mode == 1 and enemy("Bring") == false then
                                G["Bringing"] = true
                                tween_function(enemy_Normal().HumanoidRootPart, CFrame.new(0,50,0), 135)
                                Tween_Info:Play()
                                Tween_Info.Completed:Wait()
                                task.wait(2.675)
                                Playing_Mode = 2
                            elseif Playing_Mode == 2 and not G["Safe Mode"] and not G["Dodgeing"] then
                                repeat
                                    G["Bringing"] = false
                                    tween_function(enemy("AllMob").HumanoidRootPart, G["Method"], 135)
                                    Tween_Info:Play()
                                    task.wait(0)
                                until Playing_Mode ~= 2 or G["Safe Mode"] == true or G["Dodgeing"] == true or G["Died"] == true or Boss_Actived() == true or auto_farm() == false or teleport_circle() ~= false or Fluent.Unloaded
                                Tween_Info:Cancel()
                            end
                        elseif O["Current Farm Mode"].Value == "Normal Mode" and not G["Safe Mode"] and not G["Dodgeing"] then
                            repeat
                                tween_function(enemy("AllMob").HumanoidRootPart, G["Method"], 135)
                                Tween_Info:Play()
                                task.wait(0)
                            until G["Safe Mode"] == true or G["Dodgeing"] == true or G["Died"] == true or Boss_Actived() == true or auto_farm() == false or teleport_circle() ~= false or Fluent.Unloaded
                            Tween_Info:Cancel()
                        end
                    end
                end)
                task.wait(0)
            end
        end))
        coroutine.resume(coroutine.create(function () --// Auto Skill
            while true do
                pcall(function ()
                    if (game.PlaceId == 7338881230 or game.PlaceId == 6938803436 or game.PlaceId == 7274690025) or Fluent.Unloaded then coroutine.yield() end

                    if is_usingskill() == 0 and O["Auto Skill"].Value == true and auto_farm() == true and dist_enemy(enemy("AllMob").HumanoidRootPart) <= O["Current Skill Distance"].Value and not G["Safe Mode"] and not G["Bringing"] and not G["Bringing Infinite"] and not G["Died"] then
                        local skill = PlrGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder

                        if is_usingskill() > 0 then return end

                        if skill["Skill"..O["Skill One"].Value].Visible and tonumber(skill["Skill"..O["Skill One"].Value].SkillName.Text) == nil then
                            RemoteEvent:FireServer("UseSkill",{["hrpCFrame"] = CFrame.new(enemy("AllMob").HumanoidRootPart.Position)},tonumber(O["Skill One"].Value))
                        elseif skill["Skill"..O["Skill Two"].Value].Visible and tonumber(skill["Skill"..O["Skill One"].Value].SkillName.Text) ~= nil and tonumber(skill["Skill"..O["Skill Two"].Value].SkillName.Text) == nil then
                            RemoteEvent:FireServer("UseSkill",{["hrpCFrame"] = CFrame.new(enemy("AllMob").HumanoidRootPart.Position)},tonumber(O["Skill Two"].Value))
                        elseif skill["Skill"..O["Skill Third"].Value].Visible and tonumber(skill["Skill"..O["Skill Two"].Value].SkillName.Text) ~= nil and tonumber(skill["Skill"..O["Skill Third"].Value].SkillName.Text) == nil then
                            RemoteEvent:FireServer("UseSkill",{["hrpCFrame"] = CFrame.new(enemy("AllMob").HumanoidRootPart.Position)},tonumber(O["Skill Third"].Value))
                        elseif skill["Skill"..O["Skill Fourth"].Value].Visible and tonumber(skill["Skill"..O["Skill Third"].Value].SkillName.Text) ~= nil and tonumber(skill["Skill"..O["Skill Fourth"].Value].SkillName.Text) == nil then
                            RemoteEvent:FireServer("UseSkill",{["hrpCFrame"] = CFrame.new(enemy("AllMob").HumanoidRootPart.Position)},tonumber(O["Skill Fourth"].Value))
                        elseif skill["Skill"..O["Skill Fifth"].Value].Visible and tonumber(skill["Skill"..O["Skill Fourth"].Value].SkillName.Text) ~= nil and tonumber(skill["Skill"..O["Skill Fifth"].Value].SkillName.Text) == nil then
                            RemoteEvent:FireServer("UseSkill",{["hrpCFrame"] = CFrame.new(enemy("AllMob").HumanoidRootPart.Position)},tonumber(O["Skill Fifth"].Value))
                        end

                        for i,v in pairs(O["Current Assists"].Value) do
                            if i and v == true then
                                if skill["Skill"..i].Visible == true and skill["Skill"..i].Image ~= "rbxassetid://6797200424" and skill["Skill"..i].SkillName.Text ~= "None" then
                                    if string.find(i,"1") then
                                        RemoteEvent:FireServer("Use"..i:split("1")[1].."Skill",{["hrpCFrame"] = CFrame.new(enemy("AllMob").HumanoidRootPart.Position)},1)
                                    elseif string.find(i,"2") then
                                        RemoteEvent:FireServer("Use"..i:split("2")[1].."Skill",{["hrpCFrame"] = CFrame.new(enemy("AllMob").HumanoidRootPart.Position)},2)
                                    end
                                end
                            end
                        end

                        if O["Current Attack Method"].Value == "Remote" then
                            RemoteEvent:FireServer("UseSkill",{["hrpCFrame"] = CFrame.new(enemy("AllMob").HumanoidRootPart.Position),["attackNumber"] = 4},"BasicAttack")
                        elseif O["Current Attack Method"].Value == "Click" then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1200,672))
                        end

                    end
                end)
                task.wait(0.135)
            end
        end))
        coroutine.resume(coroutine.create(function () --// Cards
            while true do
                if (game.PlaceId ~= 7338881230 and game.PlaceId ~= 6938803436 and game.PlaceId ~= 7274690025) or Fluent.Unloaded then coroutine.yield() end
                if O["Auto Equip"].Value == true and NotEquip() == true then
                    UnEquip()
                    repeat
                        for i,v in ipairs(PlrGui.MainGui.CenterUIFrame.Inventory.Frame.CardInventoryFrame.CardInventoryScrollingFrame:GetChildren()) do
                            if v:IsA("ImageButton") and v.LayoutOrder <= 3 then
                                RemoteFunction:InvokeServer("EquipCard",v.Name)
                            end
                        end
                        task.wait(0)
                    until NotEquip() == false
                end
                if O["Auto Upgrade"].Value == true then
                    for i,v in ipairs(StatDisplay:GetChildren()) do
                        if string.find(v.Name,"Slot") and v.Value ~= "" then
                            if not CardUpgrade[v.Value] then
                                repeat
                                    CardUpgrade[v.Value] = "None"
                                    task.wait(0)
                                until CardUpgrade[v.Value]
                            end
                        end
                    end

                    for i,v in pairs(CardUpgrade) do
                        if v ~= O["Max Upgrade"].Value then
                            repeat
                                firesignal(PlrGui.MainGui.CenterUIFrame.Inventory.Frame.CardInventoryFrame.CardInventoryScrollingFrame:FindFirstChild(i).MouseButton1Down)
                                if O["Max Upgrade"].Value > get_valueCard("Level") and stringofnum(get_value("Gold")) > get_valueCard("Gold") then
                                    RemoteFunction:InvokeServer("UpgradeCard",i)
                                end
                                task.wait(0)
                            until get_valueCard("Level") >= O["Max Upgrade"].Value or get_valueCard("Gold") > stringofnum(get_value("Gold"))
                            CardUpgrade[i] = O["Max Upgrade"].Value
                        end
                    end
                end
                if O["Auto Sell"].Value == true and #Rarity > 0 and CardStepNumber < G["Number of cards"] then
                    for i,v in ipairs(PlrGui.MainGui.CenterUIFrame.Inventory.Frame.CardInventoryFrame.CardInventoryScrollingFrame:GetChildren()) do
                        if v:IsA("ImageButton") and v.Name ~= "CardInventorySlot" then
                            firesignal(v.MouseButton1Down)
                            task.wait(0.0085)
                            CardStepNumber += 1
                            for _,Sell in ipairs(Rarity) do
                                if PlrGui.MainGui.CenterUIFrame.Inventory.Frame.InvOverlayOuterFrame.CardInventoryOverlay.Rarity.Text == Sell then
                                    RemoteFunction:InvokeServer("SellCard",v.Name)
                                end
                            end
                        end
                    end
                end
                task.wait(0)
            end
        end))
        coroutine.resume(coroutine.create(function () --// Create And Start Room
            while true do
                pcall(function ()
                    if (game.PlaceId ~= 7338881230 and game.PlaceId ~= 6938803436 and game.PlaceId ~= 7274690025) or Fluent.Unloaded then coroutine.yield() end
                    if auto_farm() == true then
                        if G["Auto Join (Raid)"] == true then
                            Fluent:Notify({
                                Title = "Successfully room created",
                                Content = "MapName: "..O["Current Raid"].Value.."\nDifficulty: Easy".."\nFriendsOnly: "..tostring(O["Friends Only"].Value).."\nHardcore: false",
                                SubContent = "Starting in 5 seconds.",
                                Duration = 5
                            })
                            task.wait(5)
                            RemoteFunction:InvokeServer("CreateRoom",{
                                ["Difficulty"] = "Easy",
                                ["FriendsOnly"] = O["Friends Only"].Value,
                                ["MapName"] = O["Current Raid"].Value,
                                ["Hardcore"] = false
                            })
                            RemoteFunction:InvokeServer("TeleportPlayers")
                            coroutine.yield()
                        else
                            if O["Auto Join (Speed Raid)"].Value == true and Level.Value >= 25 and MainCenterUi.PlayButtonsFrame.Frame.SpeedRaidBanner.SpeedRaidBannerOpenText.Text == "Ready to enter" then
                                local CHrAnD
                                for i,v in ipairs(MainCenterUi.SpeedRaidCharacterSelector.Shade.SpeedRaidCharacterInventoryScrollingFrame:GetChildren()) do
                                    if v:IsA("ImageButton") and v.CharacterImage.ImageTransparency == 0 then
                                        CHrAnD = v.Name
                                    end
                                end
                                G["Not Equip Character"] = true
                                Fluent:Notify({
                                    Title = "Successfully room created",
                                    Content = "MapName: ShadowRaid".."\nCharacter: "..CHrAnD,
                                    SubContent = "Starting in 5 seconds.",
                                    Duration = 5
                                })
                                task.wait(5)
                                RemoteFunction:InvokeServer("TeleportToShadowRaid",CHrAnD)
                                coroutine.yield()
                            end
                            if O["Auto Join (Raid Challenge)"].Value == true and Level.Value >= 30 and MainCenterUi.DailyRaidChallengeFrame.RaidChallengeRewardAvailable.Text == "Reward Available" then
                                Fluent:Notify({
                                    Title = "Successfully room created",
                                    Content = "MapName: RaidChallenge".."\nAward Status: Reward Available",
                                    SubContent = "Starting in 5 seconds.",
                                    Duration = 5
                                })
                                task.wait(5)
                                RemoteFunction:InvokeServer("TeleportToRaidChallenge")
                                coroutine.yield()
                            end
                            if O["Auto Join (Boss Rush)"].Value == true and Level.Value >= 15 and StatDisplay.BossRushFreeEntry.Value ~= 0 then
                                Fluent:Notify({
                                    Title = "Successfully room created",
                                    Content = "MapName: BossRush".."\nFree Entry Left: "..MainCenterUi.BossRushFrame.BossRushFreeEntry.Text:split(" Free")[1],
                                    SubContent = "Starting in 5 seconds.",
                                    Duration = 5
                                })
                                task.wait(5)
                                RemoteFunction:InvokeServer("TeleportToBossRush")
                                coroutine.yield()
                            end
                            if O["Auto Join (Infinite Mode)"].Value == true and Level.Value >= 20 and StatDisplay.InfiniteModeReward.Value == false then
                                Fluent:Notify({
                                    Title = "Successfully room created",
                                    Content = "MapName: Infinite Mode".."\nDifficulty: Infinite\nFriendsOnly: "..tostring(O["Friends Only"].Value).."\nHardcore: false",
                                    SubContent = "Starting in 5 seconds.",
                                    Duration = 5
                                })
                                task.wait(5)
                                RemoteFunction:InvokeServer("CreateRoom",{
                                    ["Difficulty"] = "Infinite",
                                    ["FriendsOnly"] = O["Friends Only"].Value,
                                    ["MapName"] = "Infinite Mode",
                                    ["Hardcore"] = false
                                })
                                RemoteFunction:InvokeServer("TeleportPlayers")
                                coroutine.yield()
                            end

                            if (O["Auto Join (Current Dimension)"].Value == true or O["Auto Join (Highnest)"].Value == true) then
                                Fluent:Notify({
                                    Title = "Successfully room created",
                                    Content = "MapName: "..O["Current Dimension"].Value.."\nDifficulty: "..O["Current Difficulty"].Value.."\nFriendsOnly: "..tostring(O["Friends Only"].Value).."\nHardcore: "..tostring(O["Hard core"].Value),
                                    SubContent = "Starting in 5 seconds.",
                                    Duration = 5
                                })
                                task.wait(5)
                                RemoteFunction:InvokeServer("CreateRoom",{
                                    ["Difficulty"] = O["Current Difficulty"].Value,
                                    ["FriendsOnly"] = O["Friends Only"].Value,
                                    ["MapName"] = O["Current Dimension"].Value,
                                    ["Hardcore"] = O["Hard core"].Value
                                })
                                RemoteFunction:InvokeServer("TeleportPlayers")
                                coroutine.yield()
                            end
                        end
                    end
                end)
                task.wait(0)
            end
        end))
        coroutine.resume(coroutine.create(function() --// Auto Claim Quests
            while true do
                pcall(function ()
                    if (game.PlaceId ~= 7338881230 and game.PlaceId ~= 6938803436 and game.PlaceId ~= 7274690025) or Fluent.Unloaded then coroutine.yield() end
                    if O["Auto Claim (Speed Raid)"].Value == true then
                        for i,v in ipairs(PlrGui.MainGui.CenterUIFrame.SpeedRaidFrame:GetChildren()) do
                            if v.Name == "Shade" and i == 11 then
                                SHADE_QUEST = v
                            end
                        end
                        for i,v in ipairs(SHADE_QUEST:FindFirstChild("SpeedRaidScrollingFrame"):GetChildren()) do
                            if v:IsA("ImageButton") then
                                if v.RaidsButton.Cost.Text == "CLAIM" then
                                    local a_b = v.Name:split("SpeedRaidRewardTemplate")[2]
                                    RemoteFunction:InvokeServer("ClaimWeeklySpeedRaidReward",tonumber(a_b))
                                    v.RaidsButton.Cost.Text = "CLAIMED"
                                end
                            end
                        end
                    end
                    if O["Auto Claim (Quest)"].Value == true then
                        for i,v in ipairs(PlrGui.MainGui.CenterUIFrame.QuestFrame.QuestFrames.DailyQuestFrame.DailyQuestScrollingFrame:GetChildren()) do
                            if v:IsA("ImageLabel") then
                                if v.QuestCounter.Text:split(" / ")[1] >= v.QuestCounter.Text:split(" / ")[2] and v.Complete.Visible == false then
                                    RemoteFunction:InvokeServer("CompleteDailyQuest",v.Name)
                                    v.Complete.Visible = true
                                end
                            end
                        end
                        for i,v in ipairs(PlrGui.MainGui.CenterUIFrame.QuestFrame.QuestFrames.WeeklyQuestFrame.WeeklyQuestScrollingFrame:GetChildren()) do
                            if v:IsA("ImageLabel") then
                                if v.QuestCounter.Text:split(" / ")[1] >= v.QuestCounter.Text:split(" / ")[2] and v.Complete.Visible == false then
                                    RemoteFunction:InvokeServer("CompleteDailyQuest",v.Name)
                                    v.Complete.Visible = true
                                end
                            end
                        end
                    end
                end)
                task.wait(0)
            end
        end))
        coroutine.resume(coroutine.create(function() --// Update Time
            local T = {
                ["H"] = 0,
                ["M"] = 0,
                ["S"] = 0
            }
            while true do
                if Fluent.Unloaded then coroutine.yield() end
                if O["Auto Back to Lobby"].Value == true and GameMap ~= "Infinite Mode" and not string.find(GameMap,"Raid") then
                    if G["Auto Lobby (Actived)"] then
                        T = { ["H"] = 0, ["M"] = 0, ["S"] = 0 }
                        writefile(CrazyDayF.."Timer.json",game:GetService("HttpService"):JSONEncode(T))
                        SetParagraphValue(2,"Time",1,"Time: 00:00:00",3)
                    elseif not G["Auto Lobby (Actived)"] then
                        if isfile(CrazyDayF.."Timer.json") then
                            local r = {
                                string.find(readfile(CrazyDayF.."Timer.json"),"H"),
                                string.find(readfile(CrazyDayF.."Timer.json"),"M"),
                                string.find(readfile(CrazyDayF.."Timer.json"),"S")
                            }
                            if r[1] and r[2] and r[3] then
                                T = HttpService:JSONDecode(readfile(CrazyDayF.."Timer.json"))
                            elseif not r[1] or not r[2] or not r[3] then
                                Fluent:Notify({
                                    Title = "FUCK YOU SHIT DONT TOUCH MY FILE",
                                    Content = "",
                                    SubContent = nil,
                                    Duration = 5
                                })
                                T = { ["H"] = 0, ["M"] = 0, ["S"] = 0 }
                                writefile(CrazyDayF.."Timer.json",game:GetService("HttpService"):JSONEncode(T))
                            end
                        end

                        if tonumber(T["S"]) == nil or tonumber(T["M"]) == nil or tonumber(T["H"]) == nil then
                            Fluent:Notify({
                                Title = "FUCK YOU SHIT DONT TOUCH MY FILE",
                                Content = "",
                                SubContent = nil,
                                Duration = 5
                            })
                            T = { ["H"] = 0, ["M"] = 0, ["S"] = 0 }
                            writefile(CrazyDayF.."Timer.json",game:GetService("HttpService"):JSONEncode(T))
                        end

                        T["S"] += 1

                        if T["S"] >= 60 then
                            T["S"] = 0
                            T["M"] += 1
                        elseif T["M"] >= 60 then
                            T["M"] = 0
                            T["H"] += 1
                        end

                        writefile(CrazyDayF.."Timer.json",game:GetService("HttpService"):JSONEncode(T))

                        if T["S"] > 60 or T["M"] > 60 or T["H"] > 60 then
                            Fluent:Notify({
                                Title = "FUCK YOU SHIT DONT TOUCH MY FILE",
                                Content = "",
                                SubContent = nil,
                                Duration = 5
                            })
                            T = { ["H"] = 0, ["M"] = 0, ["S"] = 0 }
                            writefile(CrazyDayF.."Timer.json",game:GetService("HttpService"):JSONEncode(T))
                        end

                        local h, m, s

                        if string.len(T["S"]) == 1 then
                            s = "0"..T["S"]
                        else
                            s = T["S"]
                        end
                        if string.len(T["M"]) == 1 then
                            m = "0"..T["M"]
                        else
                            m = T["M"]
                        end
                        if string.len(T["H"]) == 1 then
                            h = "0"..T["H"]
                        else
                            h = T["H"]
                        end

                        SetParagraphValue(2,"Time",1,"Time: "..h..":"..m..":"..s,3)
                    end
                end
                task.wait(1)
            end
        end))
        coroutine.resume(coroutine.create(function() --// Auto Back to Lobby Reach
            while true do
                if (game.PlaceId == 7338881230 or game.PlaceId == 6938803436 or game.PlaceId == 7274690025) or Fluent.Unloaded then coroutine.yield() end
                if O["Auto Back to Lobby"].Value == true then
                    if isfile(CrazyDayF.."Timer.json") then
                        local r = {
                            string.find(readfile(CrazyDayF.."Timer.json"),"H"),
                            string.find(readfile(CrazyDayF.."Timer.json"),"M"),
                            string.find(readfile(CrazyDayF.."Timer.json"),"S")
                        }
                        if r[1] and r[2] and r[3] then
                            local T = HttpService:JSONDecode(readfile(CrazyDayF.."Timer.json"))
                            if O["Current Time Type"].Value == "Second" and T["S"] >= O["Current Time"].Value then
                                G["Auto Lobby (Actived)"] = true
                                Fluent:Notify({
                                    Title = "Auto Lobby (Time)",
                                    Content = "Time reached "..O["Current Time"].Value.." seconds.",
                                    SubContent = "Teleporting in 5 seconds",
                                    Duration = 5
                                })
                                task.wait(5)
                                game:GetService("TeleportService"):Teleport(6938803436)
                                task.wait(0.25)
                                game:GetService("TeleportService"):Teleport(6938803436)
                            elseif O["Current Time Type"].Value == "Minute" and T["M"] >= O["Current Time"].Value then
                                G["Auto Lobby (Actived)"] = true
                                Fluent:Notify({
                                    Title = "Auto Lobby (Time)",
                                    Content = "Time reached "..O["Current Time"].Value.." minutes.",
                                    SubContent = "Teleporting in 5 seconds",
                                    Duration = 5
                                })
                                task.wait(5)
                                game:GetService("TeleportService"):Teleport(6938803436)
                                task.wait(0.25)
                                game:GetService("TeleportService"):Teleport(6938803436)
                            elseif O["Current Time Type"].Value == "Hour" and T["H"] >= O["Current Time"].Value then
                                G["Auto Lobby (Actived)"] = true
                                Fluent:Notify({
                                    Title = "Auto Lobby (Time)",
                                    Content = "Time reached "..O["Current Time"].Value.." hours.",
                                    SubContent = "Teleporting in 5 seconds",
                                    Duration = 5
                                })
                                task.wait(5)
                                game:GetService("TeleportService"):Teleport(6938803436)
                                task.wait(0.25)
                                game:GetService("TeleportService"):Teleport(6938803436)
                            end
                        end
                    end
                end
                task.wait(0)
            end
        end))
        coroutine.resume(coroutine.create(function () --// Webhook Match Results
            if (game.PlaceId == 7338881230 or game.PlaceId == 6938803436 or game.PlaceId == 7274690025) or Fluent.Unloaded then coroutine.yield() end
            task.wait(1.5) -- Wait for a second

            local raidBeatTime = {}
            local Clear1, Clear2, Clear3, Clear4 =
                StatDisplay:WaitForChild("StageClear").Value,
                StatDisplay:WaitForChild("BossRushClears").Value,
                StatDisplay:WaitForChild("WeeklyShadowRaidsCleared").Value,
                StatDisplay:WaitForChild("RaidClears").Value
            local resulteMe
            local resulteVisible

            if PlrGui.BattleGui.CenterUIFrame.RaidDataFrame.Visible == true then
                resulteMe = ResultUIR()
                resulteVisible = PlrGui.UniversalGui.UniversalCenterUIFrame.RaidResultUI
            else
                resulteMe = PlrGui.UniversalGui.UniversalCenterUIFrame.ResultUI.Frame.RewardFrame.RewardGridFrame
                resulteVisible = PlrGui.UniversalGui.UniversalCenterUIFrame.ResultUI
            end

            for i,v in ipairs(StatDisplay:GetChildren()) do
                if string.find(v.Name,"RaidBeat") then
                    if not raidBeatTime[v.Name] then
                        raidBeatTime[v.Name] = {}
                    end
                    table.insert(raidBeatTime[v.Name],v.Value)
                end
            end

            resulteMe.ChildAdded:Connect(function(v)
                if Fluent.Unloaded then coroutine.yield() end
                if not table.find(Currency_Items,v.Name) then
                    if table.find(Item_Rewards,"`None      `") then
                        repeat
                            table.remove(Item_Rewards,table.find(Item_Rewards,"`None      `"))
                        wait()
                        until not table.find(Item_Rewards,"`None      `")
                    end
                    if not v:FindFirstChild("Gradient") then
                        table.insert(Item_Rewards,"`"..v.Name.." [Common]`")
                    elseif v:FindFirstChild("Gradient") then
                        if tostring(v.Gradient.Color) == "0 0.352941 1 0.407843 0 1 0.513726 1 0.635294 0 " then
                            table.insert(Item_Rewards,"`"..v.Name.." [Uncommon]`")
                        elseif tostring(v.Gradient.Color) == "0 0 0.666667 1 0 1 0.6 0.780392 1 0 " then
                            table.insert(Item_Rewards,"`"..v.Name.." [Rare]`")
                        elseif tostring(v.Gradient.Color) == "0 0.666667 0.333333 1 0 1 0.352941 0.494118 1 0 " then
                            table.insert(Item_Rewards,"`"..v.Name.." [Epic]`")
                        elseif tostring(v.Gradient.Color) == "0 1 0.380392 0.392157 0 1 1 0.639216 0.278431 0 " then
                            table.insert(Item_Rewards,"`"..v.Name.." [Legendary]`")
                        else
                            table.insert(Item_Rewards,"`"..v.Name.." [Mythic]`")
                        end
                    end
                elseif table.find(Currency_Items,v.Name) then
                    if table.find(Currency_Rewards,"`None     `") then
                        repeat
                            table.remove(Currency_Rewards,table.find(Currency_Rewards,"`None     `"))
                        wait()
                        until not table.find(Currency_Rewards,"`None     `")
                    end
                    if tonumber(v.LevelReq.Text) then
                        if not Currency_Rewards[v.Name] then
                            repeat
                                Currency_Rewards[v.Name] = {}
                                task.wait()
                            until Currency_Rewards[v.Name]
                        end
                        table.insert(Currency_Rewards[v.Name] , tonumber(v.LevelReq.Text))
                    end
                end
            end)
            resulteVisible:GetPropertyChangedSignal("Visible"):Connect(function ()
                if Fluent.Unloaded then coroutine.yield() end
                if O["Send Webhook"].Value == false or not string.find(O["Webhook URL"].Value,"https://discord.com/api/webhooks") then return end
                wait(5)
                if not table.find(Currency_Rewards,"`None     `") then
                    local name_count
                    local sum
                    for i,v in pairs(Currency_Rewards) do
                        if #v ~= 0 then
                            sum = 0
                            for i = 1,#v do
                                sum = sum + v[i]
                            end
                        end
                        name_count = "`"..i.." ["..sum.."]`"
                        table.insert(Currency_Rewards,name_count)
                    end
                end

                local TimeEnd = "Time: 00:00"
                local DamageDeal = "Damage: "..roundNumber(LocalPlr.leaderstats.Damage.Value)
                local Rank = "Unknown: F"
                local ClearTime = "Unknown: 0"
                local GameName = "Unknown: nil"
                local GameStatus = " [End!]"

                if resulteVisible == PlrGui.UniversalGui.UniversalCenterUIFrame.ResultUI then

                    local RaIKD = PlrGui.UniversalGui.UniversalCenterUIFrame.ResultUI.Frame.ResultDiamond.ResultRank
                    TimeEnd = PlrGui.UniversalGui.UniversalCenterUIFrame.ResultUI.Frame.TimeText.Text

                    if RaIKD.Image == "rbxassetid://7443889715" then
                        Rank = "Rank: S+"
                    elseif RaIKD.Image == "rbxassetid://6715353612" then
                        Rank = "Rank: S"
                    elseif RaIKD.Image == "rbxassetid://6891959728" then
                        Rank = "Rank: A"
                    elseif RaIKD.Image == "rbxassetid://6891959611" then
                        Rank = "Rank: B"
                    elseif RaIKD.Image == "rbxassetid://6891959460" then
                        Rank = "Rank: C"
                    elseif RaIKD.Image == "rbxassetid://6782568839" then
                        Rank = "Rank: F"
                    else
                        Rank = "Rank: D"
                    end


                    if table.find(Currency_Rewards,"`None     `") and table.find(Item_Rewards,"`None      `") and Rank == "Rank: F" then
                        GameStatus = " [Defeat!]"
                        GameName = "Dimension: "..GameMap:split("Dimension")[1].."\nStage Clear: "..Stage()
                        ClearTime = "Dimension Clears: "..StatDisplay.StageClear.Value
                    else
                        GameStatus = " [Victory!]"
                    end

                    if GameMap == "Virtual Garden" then
                        TimeEnd = "Time: 08:00"
                        GameName = "GameMap: "..GameMap.."\nScore: "..PlrGui.BattleGui.CenterUIFrame.EnemiesDefeatedBack.EnemyDefeatedNumber.Text.."\nScore (Highest): "..StatDisplay.TimeChallengeHighScore.Value
                        ClearTime = "Unknown: 0"

                    elseif GameMap == "Infinite Mode" then
                        GameName = "GameMap: "..GameMap.."\nWave: "..PlrGui.BattleGui.CenterUIFrame.WaveClearClearText.Text.."\nWave (Highest): "..StatDisplay.InfiniteRecord.Value
                        ClearTime = "Dimension Clears: "..StatDisplay.StageClear.Value

                    elseif StatDisplay.StageClear.Value ~= Clear1 then
                        GameName = "Dimension: "..GameMap:split("Dimension")[1].."\nStage Clear: "..Stage()
                        ClearTime = "Dimension Clears: "..StatDisplay.StageClear.Value

                    elseif StatDisplay.BossRushClears.Value ~= Clear2 then
                        TimeEnd = PlrGui.UniversalGui.UniversalCenterUIFrame.ResultUI.Frame.TimeText.Text.."\nBest Record: "..StatDisplay.BossRushRecordString.Value
                        GameName = "GameMap: "..GameMap.."\nStage Clear: 3"
                        ClearTime = "BossRush Clears: "..StatDisplay.BossRushClears.Value

                    elseif StatDisplay.WeeklyShadowRaidsCleared.Value ~= Clear3 then
                        GameName = "SpeedRaid: "..GameMap:split("Raid")[1].."\nStage Clear: "..Stage()
                        ClearTime = "SpeedRaid Clears: "..StatDisplay.WeeklyShadowRaidsCleared.Value
                    end
                else
                    TimeEnd = "Time: 08:00"
                    Rank = "Rank:"..PlrGui.UniversalGui.UniversalCenterUIFrame.RaidResultUI.Frame.RankText.Text:split(":")[2]
                    GameName = "Raid: "..GameMap:split("Raid")[1].."\nStage Clear: 0"
                    ClearTime = "Raid Clears: Unknown"

                    if StatDisplay.RaidClears.Value ~= Clear4 then
                        for i,v in pairs(raidBeatTime) do
                            if StatDisplay:FindFirstChild(i).Value ~= v[1] then
                                GameName = "Raid: "..GameMap:split("Raid")[1].."\nStage Clear: 0"
                                ClearTime = "Raid Clears: "..StatDisplay.RaidClears.Value.."\n"..i..": "..v[1]
                            end
                        end
                    end
                end

                local Data = game:GetService("HttpService"):JSONEncode({
                    ["username"] = "Anime Dimensions Simulator : Notification",
                    ["avatar_url"] = "https://tr.rbxcdn.com/1fb0c8f3fe70c5ec485cfab729d4ac44/150/150/Image/Webp",
                    content = nil,
                    embeds = {{
                      ["title"] = nil,
                      ["color"] = tonumber(toHex(O["Webhook Color"].Value)) or 0x7d7d7d,
                      ["description"] = nil,
                      ["footer"] = {
                        ["text"] = "Time: "..os.date("%c").."\nCredit: YT » @crazyday3693",
                        ["icon_url"] = "https://yt3.ggpht.com/yti/ANjgQV_KI8R3VhsnEhzYD0M1EJXUU29p0YC5gzrrhv8nWzA7j6s=s88-c-k-c0x00ffffff-no-rj"
                      },
                      ["thumbnail"] = {
                        ["url"] = "https://tr.rbxcdn.com/1fb0c8f3fe70c5ec485cfab729d4ac44/150/150/Image/Webp",
                      },
                      ["fields"] = {
                        {
                            ["name"] = "**Item Rewards**",
                            ["value"] = "\n`[+]` "..table.concat(Item_Rewards,"\n`[+]` "),
                            ["inline"] = true
                        },
                        {
                            ["name"] = "**Currency Rewards**",
                            ["value"] = "\n`[+]` "..table.concat(Currency_Rewards,"\n`[+]` "),
                            ["inline"] = true
                        },
                        {
                            ["name"] = "**Match Information"..GameStatus.."**",
                            ["value"] = "```\n"..GameName.."\n"..Rank.."\n"..DamageDeal.."\n"..TimeEnd.."```",
                            ["inline"] = false
                        },
                        {
                            ["name"] = "**Player Information**".." __**|| ["..LocalPlr.Name.."] ||**__",
                            ["value"] = "```\nLevel: "..Level.Value.." ["..get_value("exp").."]\nCardsOwned: "..StatDisplay.CardsOwned.Value.."/"..StatDisplay.MaxCardsOwned.Value
                            .."\n"..ClearTime.."\nCurrency:\n ∘ Gold: "..get_value("Gold").."\n ∘ Gem: "..get_value("Gem").."\n ∘ TraitToken: "..get_value("TraitToken")
                            .."\n ∘ RaidToken: "..get_value("RaidToken").."\n ∘ SpeedRaidToken: "..get_value("ShadowCoin").."\n ∘ BossRushToken: "..get_value("BossRush").."```",
                            ["inline"] = false
                        }
                    },
                }}
                })
                G["response"]({Url = O["Webhook URL"].Value, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = Data})
            end)
        end))


--end)
