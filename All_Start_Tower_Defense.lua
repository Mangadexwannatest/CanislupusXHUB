   
repeat wait() until game:IsLoaded()
repeat wait()until game:GetService("Players").LocalPlayer ~= nil
if not game:GetService("Players").LocalPlayer.Character then game:GetService("Players").LocalPlayer.CharacterAdded:Wait()wait()end
game.Players.LocalPlayer:WaitForChild("PlayerGui")

   if game.CoreGui:FindFirstChild("CrazyDay") == nil then
    repeat 
        if game.CoreGui:FindFirstChild("CrazyDay") == nil then
       warn("Loading Gui..")
    local firesignal = function(signal, arg2)
        if getconnections(signal) then
            firesignal(signal, arg2)
        end
    end
    
coroutine.resume(coroutine.create(function()
    while wait() do pcall(function ()
    if game.CoreGui:FindFirstChild("CrazyDay") == nil then
          for i,v in pairs(game.CoreGui:GetChildren()) do
          if v.Name == "ScreenGui" then
              for _,k in next, v:GetDescendants() do
                  if k.Name == "TextLabel" and string.find(k.Text,"All Star Tower") then
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
    repeat wait() until game.CoreGui:FindFirstChild("CrazyDay")
    for i,v in pairs(game.CoreGui.CrazyDay:GetChildren()) do
        if v.Name == "Frame" and i == 2 then
            repeat
            v.Name = "MainStatus"
            task.wait(0.25)
            until game.CoreGui:FindFirstChild("CrazyDay"):FindFirstChild("MainStatus")
        end
    end
end))



    local Traget_CFrame,RoomName
    local bv = Instance.new("BodyVelocity")
    local function GET_THE_FARM()
        return CFrame.new(table.unpack(Traget_CFrame:gsub(" ", ""):split(",")))
    end

    local function Story()
        if game:GetService("ReplicatedStorage").Lobby.Value and game.Workspace:FindFirstChild("Queue"):FindFirstChild("W2 PERM") then
        for i,v in pairs(game:GetService("Workspace").Queue.InteractionsV2:GetChildren()) do
            if v:FindFirstChild("TouchInterest") then
                if tostring(v:FindFirstChild("SurfaceGui"):FindFirstChild("Frame"):FindFirstChild("TextLabel").Text) == "Empty" then
                local dist = (v.Position - game.Workspace:WaitForChild("Queue"):FindFirstChild("Story"):FindFirstChild("Monster").Position).Magnitude
                if dist <= 150 then
                return v
                end
                end
            end
        end
    elseif game:GetService("ReplicatedStorage").Lobby.Value and game:GetService("Workspace"):FindFirstChild("Queue"):FindFirstChild("Joinables") then
        for i,v in pairs(game:GetService("Workspace").Queue.Joinables:GetChildren()) do
            if v.Name == "StoryMode" then
                if tostring(v:FindFirstChild("SurfaceGui"):FindFirstChild("Frame"):FindFirstChild("TextLabel").Text) == "Empty" then
                    return v
                end
            end
        end
    end
end

local function Infinite()
    if game:GetService("ReplicatedStorage").Lobby.Value and game.Workspace:FindFirstChild("Queue"):FindFirstChild("W2 PERM") then
    for i,v in pairs(game:GetService("Workspace").Queue.InteractionsV2:GetChildren()) do
        if v:FindFirstChild("TouchInterest") then
            if tostring(v:FindFirstChild("SurfaceGui"):FindFirstChild("Frame"):FindFirstChild("TextLabel").Text) == "Empty" then
            local dist = (v.Position - game.Workspace:WaitForChild("Queue"):FindFirstChild("Floor").Position).Magnitude
            if dist <= 200 then
            return v
            end
            end
        end
    end
     elseif game:GetService("ReplicatedStorage").Lobby.Value and game:GetService("Workspace"):FindFirstChild("Queue"):FindFirstChild("Joinables") then
        for i,v in pairs(game:GetService("Workspace").Queue.Joinables:GetChildren()) do
            if v.Name == "InfiniteMode" then
                if tostring(v:FindFirstChild("SurfaceGui"):FindFirstChild("Frame"):FindFirstChild("TextLabel").Text) == "Empty" then
                    return v
                end
            end
        end
     end
end
local function Challenge_Adventures()
    if game:GetService("ReplicatedStorage").Lobby.Value and game:GetService("Workspace"):FindFirstChild("Queue"):FindFirstChild("Joinables") then
        for i,v in pairs(game:GetService("Workspace").Queue.Joinables:GetChildren()) do
            if v.Name == "Farm" or v.Name == "AdventureModeLevel" then
                if tostring(v:FindFirstChild("SurfaceGui"):FindFirstChild("Frame"):FindFirstChild("TextLabel").Text) == "Empty" then
                    return v
                end
            end
        end
     end
end



local function CF()
    if game:GetService("ReplicatedStorage").Lobby.Value and game:GetService("Workspace"):FindFirstChild("Queue"):FindFirstChild("Joinables") then
        return CFrame.new(-2322.02148, 5365.50391, -1.47732902, 1, -3.34713333e-11, 0.000121481258, 2.93671649e-11, 1, 3.37843851e-08, -0.000121481258, -3.37843815e-08, 1)
    elseif game:GetService("ReplicatedStorage").Lobby.Value and game.Workspace:FindFirstChild("Queue"):FindFirstChild("W2 PERM") then
        return CFrame.new(-142.440994, 92.8373184, -1883.59546, -0.999998212, 9.35774722e-11, 0.00189758092, -9.31082711e-11, 1, -9.83808235e-08, -0.00189758092, -9.83808235e-08, -0.999998212)
    end
end
local function Traget_Time()
    return tonumber(Workspace.DistributedGameTime)
end

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local Window = Fluent:CreateWindow({
    Title = "All Star Tower Defense",
    SubTitle = "Last Update May/2/2024 [YT:CrazyDay/edek#1004]",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Lobby = Window:AddTab({ Title = "Lobby", Icon = "" }),
    Webhook = Window:AddTab({ Title = "Webhook", Icon = ""}),
    Other = Window:AddTab({ Title = 'Other' , Icon = ""}),
    Settings = Window:AddTab({ Title = "Settings", Icon = "" })
}

local Options = Fluent.Options
getgenv().Recording = {}
local Macro_Files = {}

   do

        if not isfolder("CrazyDay") then 
        repeat wait()
            makefolder("CrazyDay")
        until isfolder("CrazyDay")
        warn('make folder 1')
        end
        if isfolder("CrazyDay") then
            if not isfolder("CrazyDay/ASTD") then
                repeat wait()
                makefolder("/CrazyDay/ASTD")
            until isfolder("CrazyDay/ASTD")
            warn('make folder 2')
            end
        end

    if not isfolder("/CrazyDay/ASTD/Macro") then
        repeat
        makefolder("/CrazyDay/ASTD/Macro")
        task.wait(0.35)
        until isfolder("/CrazyDay/ASTD/Macro")
    end
    if isfolder("/CrazyDay/ASTD/Macro") then
        if not isfile("/CrazyDay/ASTD/Macro/Crazy Day.lua") then
            writefile("/CrazyDay/ASTD/Macro/Crazy Day.lua", game:GetService("HttpService"):JSONEncode({}))
        end
    end

    for i,v in pairs(listfiles("/CrazyDay/ASTD/Macro")) do
        table.insert(Macro_Files,v:split("/")[5]:split(".lua")[1])
    end
    repeat task.wait() until #Macro_Files >= 1
    Tabs.Main:AddParagraph({
        Title = "Macro Status",
        Content = "nil"
    })
    local MacroOptions = Tabs.Main:AddDropdown("OptionsMacro", {
        Title = "Select File",
        Description = nil,
        Values = Macro_Files,
        Multi = false,
        Default = nil
    })

    local Input = Tabs.Main:AddInput("Input", {
        Title = "Creat macro files",
        Description = nil,
        Default = nil,
        Placeholder = "nil",
        Numeric = false,
        Finished = true,
        Callback = function(bool)
            if getgenv().OnTeleport then return end
            if table.find(Macro_Files,bool) or bool == ("" or nil)  then return end
            writefile(string.format("/CrazyDay/ASTD/Macro".."/%s.lua", bool)	, "")
            Macro_Files = {}
            for i,v in pairs(listfiles("/CrazyDay/ASTD/Macro")) do
                table.insert(Macro_Files,v:split("/")[5]:split(".lua")[1])
            end
            MacroOptions:SetValues(Macro_Files)
            MacroOptions:SetValue(bool)
            Fluent:Notify({
                Title = "Creat succeed",
                Content = "Macro name",
                SubContent = bool,
                Duration = 5
        })
    end
    })
    Tabs.Main:AddButton({
        Title = "Delete file",
        Description = "delete select file",
        Callback = function()
            if Options.OptionsMacro.Value == "Crazy Day" then
                Fluent:Notify({
                    Title = "WARNING",
                    Content = "Cannot delete default profile",
                    SubContent = Options.OptionsMacro.Value,
                    Duration = 5
                })
            else
            Fluent:Notify({
                Title = "Delete succeed",
                Content = "Macro name",
                SubContent = Options.OptionsMacro.Value,
                Duration = 5
            })
            delfile(string.format("/CrazyDay/ASTD/Macro/".."%s.lua",Options.OptionsMacro.Value))
            Macro_Files = {}
            for i,v in pairs(listfiles("/CrazyDay/ASTD/Macro")) do
                table.insert(Macro_Files,v:split("/")[5]:split(".lua")[1])
            end
            MacroOptions:SetValues(Macro_Files)
            MacroOptions:SetValue(nil)
        end
    end
    })
    Tabs.Main:AddButton({
        Title = "Reset file",
        Description = "all your record in the file that you select will be reset to nil",
        Callback = function()
            Fluent:Notify({
            Title = "Reset succeed",
            Content = "Macro name",
            SubContent = Options.OptionsMacro.Value,
            Duration = 5
        })
        getgenv().Recording = {}
        writefile(string.format("/CrazyDay/ASTD/Macro".."/%s.lua",Options.OptionsMacro.Value), game:GetService("HttpService"):JSONEncode({}))
    end
    })



    local RecordToggle = Tabs.Main:AddToggle("Record", {Title = "Macro Record",Description = "after record disable to save or wait for the game has ended", Default = false })
    local PlayToggle = Tabs.Main:AddToggle("Play", {Title = "Macro Play", Default = false })

    Tabs.Main:AddSection('Other')

    local WDA = Tabs.Main:AddDropdown("Speed", {
        Title = "Select Game Speed",
        Description = nil,
        Values = {"2X","3X"},
        Multi = false,
        Default = 1,
    })

    WDA:OnChanged(function(Value)
        if Value == "3X" and not not game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 12828275) then
                Fluent:Notify({
                    Title = "WARNING",
                    Content = "BUY THE GAME PASS FIRST",
                    SubContent = nil,
                    Duration = 3
            })
            WDA:SetValue("2X")
        end
    end)
    
        Tabs.Main:AddDropdown("Ended_Action", {
        Title = "Select Action",
        Description = nil,
        Values = {"Replay","Return","Next"},
        Multi = false,
        Default = 1,
    })

    Tabs.Main:AddToggle("SPEED", {Title = "Auto Game Speed", Default = false })
    Tabs.Main:AddToggle("Replay_Return_Next", {Title = "Auto Replay // Return // Next", Default = false })

    Tabs.Main:AddDropdown("Mode_vote", {
        Title = "Select Mode",
        Description = nil,
        Values = {"Normal","Extreme"},
        Multi = false,
        Default = 1,
    })

    local VoteMode = Tabs.Main:AddToggle("Auto_Vote", {Title = "Auto Mode Vote", Default = false })

    VoteMode:OnChanged(function ()
        if Options.Auto_Vote.Value then
            repeat wait() until game.Players.LocalPlayer.PlayerGui.HUD.ModeVoteFrame.Visible
            repeat
                game:GetService("ReplicatedStorage").Remotes.Input:FireServer("VoteGameMode",tostring(Options.Mode_vote.Value))
            wait(1)
            until not game.Players.LocalPlayer.PlayerGui.HUD.ModeVoteFrame.Visible 
        end
    end)

    Tabs.Webhook:AddInput("Webhook", {
        Title = "Webhook",
        Description = "Link.",
        Default = nil,
        Placeholder = "",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
    })

    Tabs.Webhook:AddToggle("SendWebhook", {Title = "Auto Webhook", Default = false })
    Tabs.Webhook:AddButton({
        Title = "Test Webhook",
        Description = nil,
        Callback = function()
            local timeInfo = os.date("*t")
            BBody = game:GetService("HttpService"):JSONEncode({
                content = nil,
                embeds = {{
                    ["author"] = {
                        ["name"] = "Crazy Day ",
                        ["icon_url"] = "https://yt3.ggpht.com/yti/ANjgQV_KI8R3VhsnEhzYD0M1EJXUU29p0YC5gzrrhv8nWzA7j6s=s108-c-k-c0x00ffffff-no-rj"
                    },
                ["title"] = "All Star Tower Defense", 
                ["icon_url"] = "https://tr.rbxcdn.com/d10f139443bb86b2d89af3662003ae4a/768/432/Image/Webp",
                ["footer"] = {
                        ["text"] = "All Star Tower Defense : " .. timeInfo.hour .. ":" .. timeInfo.min,
                        ["icon_url"] = "https://tr.rbxcdn.com/d10f139443bb86b2d89af3662003ae4a/768/432/Image/Webp"},
                        ["color"] = tonumber(0xFFD700),
                        ["url"] = "https://www.roblox.com/games/4996049426/UPDATE-4X-All-Star-Tower-Defense",
                        ["fields"] = {
                        {
                            ["name"] = "Units",
                            ["value"] = "[None]\n ".."[None]\n ".."[None]\n ".."[None]\n ".."[None]\n ".."[None]\n ",
                            ["inline"] = true
                                  
                        },
                        {
                            ["name"] = "Player",
                            ["value"] = "Username : ||**"..game.Players.LocalPlayer.Name.."**||".."\n Level : "..game.Players.LocalPlayer.Character.Head.NameLevelBBGUI.LevelFrame.TextLabel.Text:split(".")[2]
                            .."\n EXP : "..tostring(game.Players.LocalPlayer.PlayerGui.HUD.BottomFrame.XPBar.XPBarAmount.Text:split(" ")[1])
                            .."\n Stardust : "..tostring(game.Players.LocalPlayer.PlayerGui.HUD.BottomFrame.CurrencyList.Stardust.Amount.Text).."\n Gems : "..tostring(game.Players.LocalPlayer.PlayerGui.HUD.BottomFrame.CurrencyList.Gem.Amount.Text)
                            .."\n Coins : "..tostring(game.Players.LocalPlayer.PlayerGui.HUD.BottomFrame.CurrencyList.Coins.Amount.Text),
                            ["inline"] = true
                        }}}} })
                local response = http_request or request or HttpPost or syn.request
                response({
                Url = Options.Webhook.Value,
                Method = "POST",
                Headers = {
                                ["Content-Type"] = "application/json" },
                Body = BBody})
        end
    })


    local Map = {
        ["World1"] = {},
        ["World2"] = {}
    }
    local WorldIn = {
    }
    local Inf = {
    }
    local Challenge = {
    }
    local Adventures = {
    }
    local Lable
    task.spawn(function ()
        if game:GetService("ReplicatedStorage").Lobby.Value then
        if game.Workspace:FindFirstChild("Queue"):FindFirstChild("W2 PERM")  then
        Lable = "World : 1"
        elseif not game.Workspace:FindFirstChild("Queue"):FindFirstChild("W2 PERM") then
        Lable = "World : 2"
        end
        elseif not game:GetService("ReplicatedStorage").Lobby.Value then
        Lable = "World : "..tostring(game:GetService("ReplicatedStorage").Map.Value)
        end

        for i,v in pairs(game.Players.LocalPlayer.PlayerGui.HUD.MissionsV2.MissionChooser.Main.World1:GetChildren()) do
            if v:IsA("Frame") then
                table.insert(Map["World1"],{["MAP"] = {
                    ["Number"] = tonumber(v.MissionTitle.Text:split(".")[1]),
                    ["Name"] = tostring(v.MissionTitle.Text:split(".")[2])
                }})
                end
            end
            table.sort(Map["World1"],function (a,b)
                return a["MAP"]["Number"] < b["MAP"]["Number"]
            end)
        for i,v in pairs(game.Players.LocalPlayer.PlayerGui.HUD.MissionsV2.MissionChooser.Main.World2:GetChildren()) do
            if v:IsA("Frame") then
                table.insert(Map["World2"],{["MAP"] = {
                    ["Number"] = tonumber(v.MissionTitle.Text:split(".")[1]),
                    ["Name"] = tostring(v.MissionTitle.Text:split(".")[2])
                    }})
                end
            end
            table.sort(Map["World2"],function (a,b)
                return a["MAP"]["Number"] < b["MAP"]["Number"]
            end)
        for i,v in pairs(game.Players.LocalPlayer.PlayerGui.HUD.MissionsV2.MissionChooser.Main.Infinite:GetChildren()) do
            if v:IsA("Frame")  then
                table.insert(Inf,tostring(v.MissionTitle.Text))
            end
        end
        for i,v in pairs(game.Players.LocalPlayer.PlayerGui.HUD.MissionsV2.MissionChooser.Main.Challenges:GetChildren()) do
        if v:IsA("Frame")  then
            table.insert(Challenge,tostring(v.MissionTitle.Text))
           end
        end
        for i,v in pairs(game.Players.LocalPlayer.PlayerGui.HUD.MissionsV2.MissionChooser.Main.Adventures:GetChildren()) do
            if v:IsA("Frame") then
                table.insert(Adventures,tostring(v.MissionTitle.Text))
            end
        end
        ---------------------------
        for i = 1,#Map["World1"] do
            for i,v in pairs(Map["World1"][i]) do
                if i == "MAP" then
                    table.insert(WorldIn,v["Number"].."."..v["Name"])
                end
            end
        end
        for i = 1,#Map["World2"] do
            for i,v in pairs(Map["World2"][i]) do
                if i == "MAP" then
                    table.insert(WorldIn,v["Number"].."."..v["Name"])
                end
            end
        end
    end)


    Tabs.Lobby:AddParagraph({
        Title = "Current World",
        Content = tostring(Lable)
    })
    local Mode_Select = Tabs.Lobby:AddDropdown("Select_Mode", {
        Title = "Select Mode",
        Description = nil,
        Values = {"Story","Infinity","Challenge","Adventures"},
        Multi = false,
        Default = 1
    })

    local MapSlect = Tabs.Lobby:AddDropdown("Select_Map", {
        Title = "Select Map (Auto Update)",
        Description = nil,
        Values = WorldIn,
        Multi = false,
        Default = 1,
    })
    Tabs.Lobby:AddDropdown("Select_Stage", {
        Title = "Select Stage (Only Story)",
        Description = nil,
        Values = {"1","2","3","4","5","6"},
        Multi = false,
        Default = 1,
    })

    Mode_Select:OnChanged(function(value)
        if value ~= nil then
        if value == Options.Select_Mode.Values[1] then
            MapSlect:SetValue(nil)
            MapSlect:SetValues(WorldIn)
            if game:GetService("ReplicatedStorage").Lobby.Value then
            Traget_CFrame,RoomName = tostring(Story().CFrame), tostring(Story().Name)
            end
        elseif value == Options.Select_Mode.Values[2] then
            MapSlect:SetValue(nil)
            MapSlect:SetValues(Inf)
            if game:GetService("ReplicatedStorage").Lobby.Value then
            Traget_CFrame,RoomName = tostring(Infinite().CFrame) , tostring(Infinite().Name)
            end
        elseif value == Options.Select_Mode.Values[3] then
            MapSlect:SetValue(nil)
            MapSlect:SetValues(Challenge)
            if Challenge_Adventures() and game:GetService("ReplicatedStorage").Lobby.Value then
            Traget_CFrame,RoomName = tostring(Challenge_Adventures().CFrame) , tostring(Challenge_Adventures().Name)
            end
        elseif value == Options.Select_Mode.Values[4] then
            MapSlect:SetValue(nil)
            MapSlect:SetValues(Adventures)
            if Challenge_Adventures() and game:GetService("ReplicatedStorage").Lobby.Value then
            Traget_CFrame,RoomName = tostring(Challenge_Adventures().CFrame) , tostring(Challenge_Adventures().Name)
            end
        end
    end
    end)

    local warn1 = Tabs.Lobby:AddToggle("Auto_Lobby", {Title = "Auto Join Lobby", Default = false })

    MapSlect:OnChanged(function(value)
        if value ~= nil then
        if Options.Select_Mode.Value == Options.Select_Mode.Values[1] and game:GetService("ReplicatedStorage").Lobby.Value then
            Traget_CFrame,RoomName = tostring(Story().CFrame) , tostring(Story().Name)
        elseif Options.Select_Mode.Value == Options.Select_Mode.Values[2] and game:GetService("ReplicatedStorage").Lobby.Value then
            Traget_CFrame,RoomName = tostring(Infinite().CFrame) , tostring(Infinite().Name)
        elseif Options.Select_Mode.Value == Options.Select_Mode.Values[3] or Options.Select_Mode.Value == Options.Select_Mode.Values[4] then
            if Challenge_Adventures() and game:GetService("ReplicatedStorage").Lobby.Value then
            Traget_CFrame,RoomName = tostring(Challenge_Adventures().CFrame) , tostring(Challenge_Adventures().Name)
            end
        end
    end
end)

    warn1:OnChanged(function()
    if Options.Select_Map.Value == nil and Options.Auto_Lobby.Value and game:GetService("ReplicatedStorage").Lobby.Value then
            Fluent:Notify({
                Title = "WARNING",
                Content = "SELECT MAP FIRST",
                SubContent = nil,
                Duration = 3 })
        Options.Auto_Lobby:SetValue(false)
    else
    if Options.Select_Mode.Value == "Challenge" or Options.Select_Mode.Value == "Adventures" and Options.Auto_Lobby.Value and game:GetService("ReplicatedStorage").Lobby.Value and Lable ~= "World : 2" then
        Fluent:Notify({
            Title = "WARNING",
            Content = "THIS MODE NOT SUPPORT THIS WORLD TELEPORT IN 5 SECS ",
            SubContent = nil,
            Duration = 3 })
            getgenv().STOP = true
            task.wait(5)
            game:GetService("TeleportService"):Teleport(7785334488)
    end
    if not Options.Auto_Lobby.Value and game.Players.LocalPlayer.Character.Humanoid.PlatformStand then
        game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
        bv.Parent = nil
    end
end
end)

    Tabs.Lobby:AddToggle("AutoUpgradeSlot", {Title = "Auto Upgrade Slot",Description = "automatically upgrade when your inventory full", Default = false })
    task.spawn(function ()
    game.Players.LocalPlayer.PlayerGui.Notification.ChildAdded:Connect(function (v)
        if v.Name == "Message" and v:FindFirstChild("Message") and tostring(v:WaitForChild("Message"):FindFirstChild("Main"):FindFirstChild("Text").Text) ==  "Spend 150 Gems to Upgrade Inventory by 50 Slots" then
            repeat wait() until game.Players.LocalPlayer.PlayerGui.Notification:FindFirstChild("Message"):FindFirstChild("Message"):FindFirstChild("Main"):FindFirstChild("Options"):FindFirstChild("ReviewButton").Visible and Options.AutoUpgradeSlot.Value
            repeat
                firesignal(game.Players.LocalPlayer.PlayerGui.Notification:FindFirstChild("Message"):FindFirstChild("Message"):FindFirstChild("Main"):FindFirstChild("Options"):FindFirstChild("ReviewButton").MouseButton1Click,game.Players.LocalPlayer)
                task.wait(0.15)
            until not v.Parent or not Options.AutoUpgradeSlot.Value
        end
    end)
end)
    Tabs.Lobby:AddToggle("AutoCliamReward",{Title = "Auto Clams Task",Description = "automatically clams all quest reward",Default = false})


    Tabs.Other:AddToggle("AutoRejoinError", {Title = "Auto Rejoin When Disconnect ", Default = false })
    local white = Tabs.Other:AddToggle("AutoWhiteScreen", {Title = "Auto White Screen", Default = false })
    Tabs.Other:AddToggle("AutoCloseAfterExecute", {Title = "Auto Close Gui After Execute", Default = false })
    Tabs.Other:AddToggle("AutoExecuteScript", {Title = "Auto Execute Script", Default = false })
    Tabs.Other:AddButton({
        Title = "TELEPORT LOBBY",
        Description = nil,
        Callback = function()
            game:GetService("TeleportService"):Teleport(4996049426)
        end
    })
    local UpdateLog = Tabs.Other:AddSection("Update Log")
    UpdateLog:AddParagraph({
        Title = "Last Update May/2/2024 [12:34 UTC + 07:00]",
        Content = "[+] Macro Status\n[*] Fixed some bugs\n[*] Fixed Auto Toggle Play"
    })

    white:OnChanged(function()
        if Options.AutoWhiteScreen.Value then
            game:GetService("RunService"):Set3dRenderingEnabled(false)
        else
            game:GetService("RunService"):Set3dRenderingEnabled(true)
        end
    end)

    local function Get_Paragrahp()
        for i,v in pairs(game:GetService("CoreGui"):WaitForChild("CrazyDay"):WaitForChild("MainStatus"):WaitForChild("CanvasGroup"):GetChildren()) do
            if i == 1 then
                for ii,vv in pairs(v:GetChildren()) do
                    if ii == 3 then
                        if vv:FindFirstChild("Frame") then
                            for iii,vvv in pairs(vv.Frame:GetDescendants()) do
                                if vvv.Name == "TextLabel" and tostring(vvv.Text) ~= "Macro Status" then
                                    return vvv
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    RecordToggle:OnChanged(function()
        if Options.Record.Value and game:GetService("ReplicatedStorage").Lobby.Value and Options.OptionsMacro.Value ~= nil then
            Fluent:Notify({
                Title = "WARNING",
                Content = "RECORD IN DUNGEONS ONLY",
                SubContent = nil,
                Duration = 5 })
                Options.Record:SetValue(false)
        else
        if Options.Record.Value and Options.OptionsMacro.Value ~= nil then
            Get_Paragrahp().Text = "Status : Recording [0]"
            repeat wait() until not Options.Record.Value or game.Players.LocalPlayer.PlayerGui.HUD.MissionEnd.Visible
            Get_Paragrahp().Text = "Status : Recording Ended ["..#getgenv().Recording.."]"
            Options.Record:SetValue(false)
            Fluent:Notify({
                Title = "Record Ended",
                Content = "Macro name",
                SubContent = Options.OptionsMacro.Value,
                Duration = 5 })
                writefile(string.format("/CrazyDay/ASTD/Macro".."/%s.lua",Options.OptionsMacro.Value), game:GetService("HttpService"):JSONEncode(getgenv().Recording))
            end
        end
    end)

    game.Players.LocalPlayer.OnTeleport:Connect(function(State)
        local QueueOnTeleport = queue_on_teleport or queueonteleport or (syn and syn.queue_on_teleport)
        local script =
        [[
            Options.Record:SetValue(false)
        ]]
        if State == Enum.TeleportState.InProgress or State == Enum.TeleportState.Started and Options.Record.Value then
            QueueOnTeleport(script)
            end
        end)

    local function Wave()
        return game:GetService("ReplicatedStorage").WaveValue.Value
    end

    local function Money()
        return game.Players.LocalPlayer.Money.Value
    end

    local function Time()
        return tostring(game.Players.LocalPlayer.PlayerGui.HUD.FastForward.TextLabel.Text)
    end
    local function AutoBackGround()
        return game.Players.LocalPlayer.PlayerGui.HUD:WaitForChild("UpgradeV2"):WaitForChild("SpecialButton"):WaitForChild("Auto")
    end
    local tablead = {"k","m","b"}
    local function TONUM(values)
            local num = 1
                for i,v in pairs(tablead) do
                    values = string.gsub(values, v ,function ()
                    num = num * (10 ^ (i * 3))
                return ''
            end)
        end
        return num * values
    end

    local function abbreviateNumber(number)
    local abbreviationIndex = math.floor(math.log(number,1000))
    local abbreviation = tablead[abbreviationIndex]
    if abbreviation then
        local shortNum = number/(1000^abbreviationIndex)
        local intNum = math.floor(shortNum)
        local str = intNum .. abbreviation
        if intNum < shortNum then
            str = str .. "+"
        end
        return str
        else
            return tostring(number)
        end
    end


    getgenv().AutoToggle = nil
    local Mouse = game.Players.LocalPlayer:GetMouse()
    local UserInput = game:GetService("UserInputService")
    local Enum_input = Enum.UserInputType
    local UnitSelect
    local Unit_Name
    local Connect_1
    local Connect_3
    local Auto = game.Players.LocalPlayer.PlayerGui.HUD:WaitForChild("UpgradeV2"):WaitForChild("SpecialButton"):WaitForChild("Auto")
    local UserAbility = game.Players.LocalPlayer.PlayerGui.HUD:WaitForChild("UpgradeV2"):WaitForChild("SpecialButton")
    UserInput.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum_input.MouseButton1 or input.UserInputType == Enum_input.MouseButton2 or input.UserInputType == Enum_input.MouseButton3 or input.UserInputType == Enum_input.Touch) then
        for i, v in ipairs(game.Workspace.Unit:GetChildren()) do
            for i2, v2 in ipairs(v:GetDescendants()) do
                if v2 == Mouse.Target then
                    UnitSelect = v:WaitForChild("HumanoidRootPart").Position;
                    Unit_Name = tostring(v.Name);
                   end
                end
            end
        end
    end)
    task.spawn(function ()
        game.Players.LocalPlayer.PlayerGui.HUD.NextWaveVote.YesButton.Activated:Connect(function()
            if Options.Record.Value then
                    table.insert(getgenv().Recording, {
                        ["VoteWave"] = {
                            ["Value"] = true,
                            ["Wave"] = Wave(),
                            ["Time"] = { 
                                ["Time"] = Traget_Time(),
                                ["Game Speed"] = Time()
                }}
                })
                    Get_Paragrahp().Text = "Status : Recording ["..#getgenv().Recording.."]\nWave : "..Wave().."\nTime : "..Traget_Time().."\nAction : VoteWave\nValue : true"
                    end
                end)
        game.Players.LocalPlayer.PlayerGui.HUD.NextWaveVote.NoButton.Activated:Connect(function()
            if Options.Record.Value then
            table.insert(getgenv().Recording, {
                ["VoteWave"] = {
                    ["Value"] = false,
                    ["Wave"] = Wave(),
                    ["Time"] = { 
                        ["Time"] = Traget_Time(),
                        ["Game Speed"] = Time()
            }}
            })
            Get_Paragrahp().Text = "Status : Recording ["..#getgenv().Recording.."]\nWave : "..Wave().."\nTime : "..Traget_Time().."\nAction : VoteWave\nValue : false"
            end
        end)
        game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("HUD"):WaitForChild("FastForward"):WaitForChild("TextLabel"):GetPropertyChangedSignal("Text"):Connect(function ()
            if Options.Record.Value then
                table.insert(getgenv().Recording, {
                    ["Game Speed On Changed"] = {
                        ["Value"] = Time(),
                        ["Wave"] = Wave(),
                        ["Time"] = tonumber(Workspace.DistributedGameTime)
                    }})
                Get_Paragrahp().Text = "Status : Recording ["..#getgenv().Recording.."]\nWave : "..Wave().."\nTime : "..tonumber(Workspace.DistributedGameTime).."\nAction : SpeedChange\nValue : "..Time()
            end
        end)
    end)
    task.spawn(function ()
        UserAbility.Activated:Connect(function ()
            if not UserAbility.VisualGuide.Visible and Options.Record.Value then
                table.insert(getgenv().Recording, {
                    ["UseSpecialMove"] = {
                        ["Position"] = tostring(UnitSelect),
                        ["Unit"] = Unit_Name,
                        ["Wave"] = Wave(),
                        ["Time"] = { 
                            ["Time"] = Traget_Time(),
                            ["Game Speed"] = Time()
                }
                }})
                Get_Paragrahp().Text = "Status : Recording ["..#getgenv().Recording.."]\nWave : "..Wave().."\nTime : "..Traget_Time().."\nAction : UseSpecialMove\nUnit : "..Unit_Name
                end
            end)
        end)
    task.spawn(function()
            Auto.InputBegan:Connect(function(input) -- กูใช้ Activate ละแม่ง connect ไม่ทันควย
                if (input.UserInputType == Enum_input.MouseButton1 or input.UserInputType == Enum_input.Touch) and Options.Record.Value then
                Connect_1 = Auto:GetPropertyChangedSignal("BackgroundColor3"):Connect(function()
                    if AutoBackGround().BackgroundColor3 == Color3.fromRGB(0, 255, 0) then
                        getgenv().AutoToggle = true
                    else
                        getgenv().AutoToggle = false
                    end
                            table.insert(getgenv().Recording, {
                                ["AutoToggle"] = {
                                    ["Position"] = tostring(UnitSelect),
                                    ["Unit"] = Unit_Name,
                                    ["Value"] = getgenv().AutoToggle,
                                    ["Wave"] = Wave(),
                                    ["Time"] = { 
                                        ["Time"] = Traget_Time(),
                                        ["Game Speed"] = Time()
                            }
                            }})
                            Get_Paragrahp().Text = "Status : Recording ["..#getgenv().Recording.."]\nWave : "..Wave().."\nTime : "..Traget_Time().."\nAction : AutoToggle\nValue : "..tostring(getgenv().AutoToggle).."\nUnit : "..Unit_Name
                                
                                Connect_1:Disconnect()
                                Connect_1 = nil
                           end)
                        end
                    end)
              end)
              game.Players.LocalPlayer.PlayerGui.HUD.UpgradeV2.Actions.Priority.Activated:Connect(function()
                if game.Players.LocalPlayer.PlayerGui.HUD.UpgradeV2 and Options.Record.Value then
                table.insert(getgenv().Recording, {
                    ["Changed Priority"] = {
                        ["Position"] = tostring(UnitSelect),
                        ["Unit"] = Unit_Name,
                        ["Wave"] = Wave(),
                        ["Time"] = { 
                            ["Time"] = Traget_Time(),
                            ["Game Speed"] = Time()
            }}
            })
                    Get_Paragrahp().Text = "Status : Recording ["..#getgenv().Recording.."]\nWave : "..Wave().."\nTime : "..Traget_Time().."\nAction : Changed Priority\nUnit : "..Unit_Name
                  end
            end)
            game.Players.LocalPlayer.PlayerGui.HUD.Setting.Page.Main.Scroll.SettingV2.AutoSkip.Options.Toggle.TextButton.InputBegan:Connect(function(input)
                if (input.UserInputType == Enum_input.MouseButton1 or input.UserInputType == Enum_input.Touch) and Options.Record.Value then
                    Connect_3 = game.Players.LocalPlayer.PlayerGui.HUD.Setting.Page.Main.Scroll.SettingV2.AutoSkip.Options.Toggle.CategoryName:GetPropertyChangedSignal("Text"):Connect(function ()
                    table.insert(getgenv().Recording, {
                        ["Auto Skip Wave"] = {
                            ["Value"] = tostring(game.Players.LocalPlayer.PlayerGui.HUD.Setting.Page.Main.Scroll.SettingV2.AutoSkip.Options.Toggle.CategoryName.Text),
                            ["Wave"] = Wave(),
                            ["Time"] = { 
                                ["Time"] = Traget_Time(),
                                ["Game Speed"] = Time()
                    }
                    }
                    })
                    Get_Paragrahp().Text = "Status : Recording ["..#getgenv().Recording.."]\nWave : "..Wave().."\nTime : "..Traget_Time().."\nAction : Auto Skip Wave\nValue : "..tostring(game.Players.LocalPlayer.PlayerGui.HUD.Setting.Page.Main.Scroll.SettingV2.AutoSkip.Options.Toggle.CategoryName.Text)
                    Connect_3:Disconnect()
                    Connect_3 = nil
                    end)
                end
            end)
            game:GetService("ReplicatedStorage").WaveValue:GetPropertyChangedSignal("Value"):Connect(function ()
                if Options.Record.Value then
                table.insert(getgenv().Recording, {
                    ["Check Auto Skip Wave"] = {
                        ["Value"] = tostring(game.Players.LocalPlayer.PlayerGui.HUD.Setting.Page.Main.Scroll.SettingV2.AutoSkip.Options.Toggle.CategoryName.Text),
                        ["Wave"] = Wave(),
                        ["Time"] = { 
                            ["Time"] = Traget_Time(),
                            ["Game Speed"] = Time()
                }
                }
                })
                Get_Paragrahp().Text ="Status : Recording ["..#getgenv().Recording.."]\nWave : "..Wave().."\nTime : "..Traget_Time().."\nAction : Check Auto Skip Wave\nValue : "..tostring(game.Players.LocalPlayer.PlayerGui.HUD.Setting.Page.Main.Scroll.SettingV2.AutoSkip.Options.Toggle.CategoryName.Text)
            end
        end)
    game.Workspace.Unit.ChildAdded:Connect(function(v)
        pcall(function()
        if Options.Record.Value then
        v:WaitForChild("Owner")
        v:WaitForChild("HumanoidRootPart") 
            if v:WaitForChild("UpgradeTag").Value >= 0  and tostring(v:WaitForChild("Owner").Value) == game.Players.LocalPlayer.Name then
                for ii,vv in next,game.Players.LocalPlayer.PlayerGui.HUD.BottomFrame.Unit:GetChildren() do
                    if vv:IsA("Frame") and tostring(vv.Unit.Value) == tostring(v.Name) then
                        local MONEY = vv:FindFirstChild("ImageLabel"):FindFirstChild("TextLabel").Text
                table.insert(getgenv().Recording, {
                    ["Summon"] = {
                        ["Rotation"] = 0,
                        ["Position"] = tostring(v:WaitForChild("HumanoidRootPart").Position),
                        ["Unit"] = tostring(v.Name),
                        ["Wave"] = Wave(),
                        ["Money"] = TONUM(tostring(MONEY)),
                        ["Time"] = {
                            ["Time"] = Traget_Time(),
                            ["Game Speed"] = Time()
                }}})
                Get_Paragrahp().Text = "Status : Recording ["..#getgenv().Recording.."]\nWave : "..Wave().."\nTime : "..Traget_Time().."\nMoney : "..tostring(MONEY).."\nAction : Summon\nUnit : "..tostring(v.Name)
                    end
                 end
                task.spawn(function ()
                v:WaitForChild('UpgradeTag'):GetPropertyChangedSignal("Value"):Connect(function() 
                    if tostring(v:WaitForChild("Owner").Value) == game.Players.LocalPlayer.Name and Options.Record.Value then
                    table.insert(getgenv().Recording, {
                        ["Upgrade"] = {
                            ["Position"] = tostring(v:WaitForChild("HumanoidRootPart").Position),
                            ["Upgrade#"] = tonumber(v:WaitForChild('UpgradeTag').Value),
                            ["Unit"] = tostring(v.Name),
                            ["Wave"] = Wave(),
                            ["Money"] = string.split(game.Players.LocalPlayer.PlayerGui.HUD.AddedCash.Text,'$')[1]:split('-')[2],
                            ["Time"] = { 
                                ["Time"] = Traget_Time(),
                                ["Game Speed"] = Time()
                    }
                    }})
                    Get_Paragrahp().Text = "Status : Recording ["..#getgenv().Recording.."]\nWave : "..Wave().."\nTime : "..Traget_Time().."\nMoney : "..abbreviateNumber(game.Players.LocalPlayer.PlayerGui.HUD.AddedCash.Text:split('$')[1]:split('-')[2]).."\nAction : Upgrade\nUnit : "..tostring(v.Name)
                      end
                    end)
                 end)
                 task.spawn(function()
                    v:GetPropertyChangedSignal("Parent"):Connect(function()
                        if tostring(v:WaitForChild("Owner").Value) == game.Players.LocalPlayer.Name and Options.Record.Value then
                        table.insert(getgenv().Recording, {
                            ["Sell"] = {
                                ["Position"] = tostring(v:WaitForChild("HumanoidRootPart").Position),
                                ["Unit"] = tostring(v.Name),
                                ["Wave"] = Wave(),
                                ["Time"] = { 
                                    ["Time"] = Traget_Time(),
                                    ["Game Speed"] = Time()
                        }
                        }})
                            Get_Paragrahp().Text ="Status : Recording ["..#getgenv().Recording.."]\nWave : "..Wave().."\nTime : "..Traget_Time().."\nAction : Sell\nUnit : "..tostring(v.Name)
                        end
                    end)
                 end)
            end
        end
     end)
end)


    local function stringtocf(str)
        return CFrame.new(table.unpack(str:gsub(" ", ""):split(",")))
    end
    local function stringtopos(str)
        return Vector3.new(table.unpack(str:gsub(" ", ""):split(",")))
    end
    
    local function SkipWave(value)
        if value then
            firesignal(game.Players.LocalPlayer.PlayerGui.HUD.NextWaveVote.YesButton.MouseButton1Click,game.Players.LocalPlayer)
        else
            firesignal(game.Players.LocalPlayer.PlayerGui.HUD.NextWaveVote.NoButton.MouseButton1Click,game.Players.LocalPlayer)
        end
    end

    local function Verify_Unit(Unit, Position)
        if type(Position) == "string" then
            Position = stringtopos(Position)
        end
        for i, v in pairs(game.Workspace.Unit:GetChildren()) do
            if v.Name == Unit and tostring(v:WaitForChild("Owner").Value) == game.Players.LocalPlayer.Name then
            if v.HumanoidRootPart.CFrame == Position or (v.HumanoidRootPart.Position - Position).magnitude < 2 then
                return v
                end
            end
        end
    end

    local function Upgrade(Unit,Position,UpgradeTag)
        if type(Position) == "string" then
            Position = stringtopos(Position)
        end
        for i,v in pairs(game.Workspace.Unit:GetChildren()) do
        if v.Name == Unit and tostring(v:WaitForChild("Owner").Value) == game.Players.LocalPlayer.Name then
        if v.HumanoidRootPart.CFrame == Position or (v.HumanoidRootPart.Position - Position).magnitude < 2 then 
        if tonumber(v.UpgradeTag.Value) ~= tonumber(UpgradeTag) then
        game:GetService("ReplicatedStorage").Remotes.Server:InvokeServer("Upgrade",v)
        elseif tonumber(v.UpgradeTag.Value) >= tonumber(UpgradeTag) then
        return v
                    end
                end
            end
        end
    end

    local function Sell(Unit,Position)
        if type(Position) == "string" then
            Position = stringtopos(Position)
        end
        for i,v in pairs(game.Workspace.Unit:GetChildren()) do
            if v.Name == Unit and tostring(v:WaitForChild("Owner").Value) == game.Players.LocalPlayer.Name then
            if v.HumanoidRootPart.CFrame == Position or (v.HumanoidRootPart.Position - Position).magnitude < 2 then 
            game:GetService("ReplicatedStorage").Remotes.Input:FireServer("Sell",v)
             end
         end
     end
 end

 local function UseSpecialMove(Unit,Position)
    if type(Position) == "string" then
        Position = stringtopos(Position)
    end
    for i,v in pairs(game.Workspace.Unit:GetChildren()) do
        if v.Name == Unit and tostring(v:WaitForChild("Owner").Value) == game.Players.LocalPlayer.Name then
        if v.HumanoidRootPart.CFrame == Position or (v.HumanoidRootPart.Position - Position).magnitude < 2 then 
            if not v:WaitForChild("SpecialMove"):WaitForChild("Special_Enabled2").Value then
        game:GetService("ReplicatedStorage").Remotes.Input:FireServer("UseSpecialMove",v,"Text Here")
            elseif v:WaitForChild("SpecialMove"):WaitForChild("Special_Enabled2").Value then
                return v
              end
           end
        end
    end
end 
  local function AutoToggleActivate(Unit,Position,vle)
    if type(Position) == "string" then
        Position = stringtopos(Position)
    end
    for i,v in pairs(game.Workspace.Unit:GetChildren()) do
    if v.Name == Unit and tostring(v:WaitForChild("Owner").Value) == game.Players.LocalPlayer.Name then
    if v.HumanoidRootPart.CFrame == Position or (v.HumanoidRootPart.Position - Position).magnitude < 2 then
        game:GetService("ReplicatedStorage").Remotes.Input:FireServer("AutoToggle",v,vle)
        task.wait(0.15)
        game:GetService("ReplicatedStorage").Remotes.Input:FireServer("UseSpecialMove",v,"Text Here")
     end
  end
end
end
local function ChangedPriority(Unit,Position)
    if type(Position) == "string" then
        Position = stringtopos(Position)
    end
    for i,v in pairs(game.Workspace.Unit:GetChildren()) do
    if v.Name == Unit and tostring(v:WaitForChild("Owner").Value) == game.Players.LocalPlayer.Name then
    if v.HumanoidRootPart.CFrame == Position or (v.HumanoidRootPart.Position - Position).magnitude < 2 then
        game:GetService("ReplicatedStorage").Remotes.Input:FireServer("ChangePriority",v)
     end
  end
end
end
   local function Get_TheWaveI()
      return game.Players.LocalPlayer.PlayerGui.HUD.NextWaveVote.Visible
  end
  local function SkipWave_Toggel()
    return tostring(game.Players.LocalPlayer.PlayerGui.HUD.Setting.Page.Main.Scroll.SettingV2.AutoSkip.Options.Toggle.CategoryName.Text)
  end

  local function Wait_Get_Paragrap(stat,value,OtherValue)
    Get_Paragrahp().Text = "Status : Playing "..tonumber(stat).."/"..tonumber(#getgenv().Playing).."\nWaiting For Wave : "..tostring(value["Wave"]).."\nWaiting For Time : "..tostring(value["Time"]["Time"]).."\n"..OtherValue
    repeat wait() until tonumber(Wave()) >= tonumber(value["Wave"])
    repeat wait() until Traget_Time() >= value["Time"]["Time"]
  end

  local function checkmoney()

  end
  
    PlayToggle:OnChanged(function()
        if Options.Play.Value and not game:GetService("ReplicatedStorage").Lobby.Value then
            repeat wait() until Options.OptionsMacro.Value ~= nil
            for i,v in pairs(listfiles("/CrazyDay/ASTD/Macro")) do
                if string.split(v,"/")[5]:split(".lua")[1] == Options.OptionsMacro.Value then
                    local File = readfile(string.format("/CrazyDay/ASTD/Macro".."/%s.lua",string.split(v,"/")[5]:split(".lua")[1]))
                    getgenv().Playing = game:GetService("HttpService"):JSONDecode(File)
                end
            end
            task.spawn(function()
				for stats = 1, #getgenv().Playing do
					for i, v in pairs(getgenv().Playing[stats]) do
                        -- Game Speed On Changed
                        if i == "Game Speed On Changed" and Time() ~= tostring(v["Value"])  then -- Changed game speed
                        Get_Paragrahp().Text = "Status : Playing "..tonumber(stats).."/"..tonumber(#getgenv().Playing).."\nWaiting For Wave : "..tostring(v["Wave"]).."\nWaiting For Time : "..tostring(v["Time"]).."\nAction : SpeedChange\nValue : "..tostring(v["Value"])
                        repeat wait() until tonumber(Wave()) >= tonumber(v["Wave"])
                        repeat wait() until Traget_Time() >= v["Time"]
                        if tostring(v["Value"]) ~= "1X" and Time() ~= tostring(v["Value"]) then
                            repeat 
                            game:GetService("ReplicatedStorage").Remotes.Input:FireServer('SpeedChange',true)
                            task.wait(1)
                            until Time() == tostring(v["Value"]) or Options.SPEED.Value or not Options.Play.Value
                        elseif tostring(v["Value"]) ==  "1X" and Time() ~= tostring(v["Value"]) then
                            repeat
                            game:GetService("ReplicatedStorage").Remotes.Input:FireServer('SpeedChange',false)
                            task.wait(1)
                            until Time() == tostring(v["Value"]) or Options.SPEED.Value or not Options.Play.Value
                        end

                        -- Auto Skip Wave
                        elseif i == "Auto Skip Wave" or i == "Check Auto Skip Wave" and SkipWave_Toggel() ~= tostring(v["Value"]) then
                            Wait_Get_Paragrap(stats,v,"Action : Auto Skip Wave\nValue : "..tostring(v["Value"]) )
                            repeat
                                game:GetService("ReplicatedStorage").Remotes.Input:FireServer("AutoSkipWaves_CHANGE")
                                task.wait(0.25)
                            until SkipWave_Toggel() == tostring(v["Value"]) or not Options.Play.Value
    
                        -- Vote The Wave
                        elseif i == "VoteWave" and Wave() <= v["Wave"]  then
                            Wait_Get_Paragrap(stats,v,"Action : VoteWave\nValue : "..tostring(v["Value"]) )
                            repeat task.wait() until Get_TheWaveI() or not Options.Play.Value
                            repeat SkipWave(v["Value"]) task.wait(0.25)  until not Get_TheWaveI() or Wave() > v["Wave"] or not Options.Play.Value

                        -- Summon The Units
                        elseif i == "Summon" then
                            Wait_Get_Paragrap(stats,v,"Waiting For Money : "..abbreviateNumber(v["Money"]).."\nAction : Summon\nUnit : "..tostring(v["Unit"]))
                            repeat wait() until Money() >= tonumber(v["Money"])
                            repeat
                                local Unit = Verify_Unit(v["Unit"], v["Position"])
                                game:GetService("ReplicatedStorage").Remotes.Input:FireServer("Summon",{
                                    ["Rotation"] = v["Rotation"],
                                    ["cframe"] = stringtocf(v["Position"]),
                                    ["Unit"] = v["Unit"]
                                })
                                task.wait(0.25)
                            until Unit or not Options.Play.Value
                        -- Upgrade The Units
                        elseif i == "Upgrade" then
                            Wait_Get_Paragrap(stats,v,"Waiting For Money : "..abbreviateNumber(v["Money"]).."\nAction : Upgrade\nUnit : "..tostring(v["Unit"]))
                            repeat wait() until Money() >= tonumber(v["Money"])
                            repeat local Unit_Upgrade = Upgrade(v["Unit"],v["Position"],v["Upgrade#"])
                                Upgrade(v["Unit"],v["Position"],v["Upgrade#"])
                                task.wait(0.25)
                            until Unit_Upgrade or not Options.Play.Value
                        -- Sell The Units
                        elseif i == "Sell" then
                            Wait_Get_Paragrap(stats,v,"Action : Sell\nUnit : "..tostring(v["Unit"]))
                            repeat local iS_Unit = Verify_Unit(v["Unit"], v["Position"])
                                    Sell(v["Unit"], v["Position"])
                                task.wait(0.25)
                            until not iS_Unit or not Options.Play.Value
                        -- Change The Priority of Units
                        elseif i == "Changed Priority" then 
                            task.wait(0.15)
                            Wait_Get_Paragrap(stats,v,"Action : Changed Priority\nUnit : "..tostring(v["Unit"]))
                            ChangedPriority(v["Unit"],v["Position"])
                        -- UseSpecialMove 
                        elseif i == "UseSpecialMove"  then
                            Wait_Get_Paragrap(stats,v,"Action : UseSpecialMove\nUnit : "..tostring(v["Unit"]))
                            repeat local just_ability = UseSpecialMove(v["Unit"],v["Position"])
                                UseSpecialMove(v["Unit"],v["Position"])
                                task.wait(0.25)
                            until just_ability or not Options.Play.Value
                        -- Auto Toggle
                        elseif i == "AutoToggle"  then
                            Wait_Get_Paragrap(stats,v,"Action : AutoToggle\nUnit : "..tostring(v["Unit"]).."\nValue : "..tostring(v["Value"]))
                            AutoToggleActivate(v["Unit"],v["Position"],v["Value"])
                     end
                     ---ENDPLAY
                     if stats == #getgenv().Playing then
                        Get_Paragrahp().Text = "Status : Playing Ended "..tostring(stats).."/"..tostring(#getgenv().Playing)
                    end
                end
			end
        end)
    end
end)

repeat task.wait() until #Macro_Files >= 1
warn("Loaded")
task.wait(0.45)
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("/CrazyDay/ASTD/"..game.Players:GetUserIdFromNameAsync(game.Players.LocalPlayer.Name))
SaveManager:SetFolder("/CrazyDay/ASTD/"..game.Players:GetUserIdFromNameAsync(game.Players.LocalPlayer.Name))
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
Tabs.Settings:AddButton({
    Title = "Delete Autoload file",
    Description = nil,
    Callback = function()
        Fluent:Notify({
            Title = "Delete succeed",
            Content = "autoload.txt",
            SubContent = nil,
            Duration = 5
        })
        delfile("/CrazyDay/ASTD/"..game.Players:GetUserIdFromNameAsync(game.Players.LocalPlayer.Name).."/settings/autoload.txt")
    end})
Tabs.Settings:AddButton({
    Title = "Delete Select Config List",
    Description = nil,
    Callback = function()
        if SaveManager.Options.SaveManager_ConfigList.Value == nil then
            Fluent:Notify({
                Title = "WARNING",
                Content = "Select the config list first",
                SubContent = nil,
                Duration = 5
            })
        else
            Fluent:Notify({
                Title = "Delete succeed",
                Content = tostring(SaveManager.Options.SaveManager_ConfigList.Value),
                SubContent = "press the refresh button to refresh",
                Duration = 5
            })
            delfile("/CrazyDay/ASTD/"..game.Players:GetUserIdFromNameAsync(game.Players.LocalPlayer.Name).."/settings/"..SaveManager.Options.SaveManager_ConfigList.Value..".json")
        end
    end
})
Window:SelectTab(1)
SaveManager:LoadAutoloadConfig()

end -- End Of Do

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
        TextButton.Position = UDim2.new(0.00470430125, 0, 0.0685579255, 0)
        TextButton.Size = UDim2.new(0.118145198, 0, 0.0385342762, 0)
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
if game.CoreGui:FindFirstChild("CurrentTime") == nil then
local CurrentTime = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Backgourd1 = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Backgourd2 = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")
local UICorner_3 = Instance.new("UICorner")
local CureentTime = Instance.new("TextLabel")
CurrentTime.Name = "CurrentTime"
CurrentTime.Parent = game:WaitForChild("CoreGui")
CurrentTime.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Frame.Parent = CurrentTime
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 0.900
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0758697316, 0, 0.17257683, 0)
Frame.Size = UDim2.new(0.140636548, 0, -0.0803782493, 0)
UICorner.Parent = Frame
Backgourd1.Name = "Backgourd1"
Backgourd1.Parent = CurrentTime
Backgourd1.AnchorPoint = Vector2.new(0.5, 0.5)
Backgourd1.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Backgourd1.BackgroundTransparency = 0.350
Backgourd1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Backgourd1.BorderSizePixel = 0
Backgourd1.Position = UDim2.new(0.0759999976, 0, 0.172999993, 0)
Backgourd1.Size = UDim2.new(0.144727513, 0, 0.0851063803, 0)
UICorner_2.Parent = Backgourd1
Backgourd2.Name = "Backgourd2"
Backgourd2.Parent = CurrentTime
Backgourd2.AnchorPoint = Vector2.new(0.5, 0.5)
Backgourd2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Backgourd2.BackgroundTransparency = 0.400
Backgourd2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Backgourd2.BorderSizePixel = 0
Backgourd2.Position = UDim2.new(0.0759999976, 0, 0.172999993, 0)
Backgourd2.Size = UDim2.new(0.144727528, 0, 0.085922204, 0)
UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(120, 120, 120)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(120, 120, 120))}
UIGradient.Parent = Backgourd2
UICorner_3.Parent = Backgourd2
CureentTime.Name = "CureentTime"
CureentTime.Parent = CurrentTime
CureentTime.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CureentTime.BackgroundTransparency = 1.000
CureentTime.BorderColor3 = Color3.fromRGB(0, 0, 0)
CureentTime.BorderSizePixel = 0
CureentTime.Position = UDim2.new(0.00494152121, 0, 0.129264757, 0)
CureentTime.Size = UDim2.new(0.144156456, 0, 0.0864806101, 0)
CureentTime.ZIndex = 2
CureentTime.Font = Enum.Font.SourceSans
CureentTime.Text = "Time : 0.00"
CureentTime.TextColor3 = Color3.fromRGB(170, 170, 170)
CureentTime.TextSize = 14.000
end
end))

coroutine.resume(coroutine.create(function()
    while wait() do pcall(function ()
        if not game:GetService("ReplicatedStorage").Lobby.Value then
        game:WaitForChild("CoreGui"):WaitForChild("CurrentTime"):FindFirstChild("CureentTime").Text = "Time : "..tostring(Traget_Time())
        end
    end)
end
end))


coroutine.resume(coroutine.create(function()
    local Button = game.CoreGui:FindFirstChild("Close/Open"):FindFirstChild("TextButton")
    Button.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
    game.CoreGui.CrazyDay:FindFirstChild("MainStatus").Visible = not game.CoreGui.CrazyDay:FindFirstChild("MainStatus").Visible
        end
    end)
end))


    coroutine.resume(coroutine.create(function()
        pcall(function ()
            repeat wait() until game:IsLoaded()
            game.CoreGui:WaitForChild("CrazyDay")
            repeat wait() until game.CoreGui:FindFirstChild("CrazyDay") ~= nil
            repeat wait() until Options.AutoCloseAfterExecute.Value
            game.CoreGui.CrazyDay:FindFirstChild("MainStatus").Visible = false
        end)
    end))

    function unload_ui()
        while wait() do
            if Fluent.Unloaded then 
            game.CoreGui:FindFirstChild("Close/Open"):Destroy()
            game.CoreGui:FindFirstChild("CurrentTime"):Destroy()
                break 
             end
        end
    end
    coroutine.resume(coroutine.create(unload_ui))

local function Check_The_START()
    if game.Players.LocalPlayer.PlayerGui.HUD.Start.Visible or game.Players.LocalPlayer.PlayerGui.HUD.MissionsV2.Visible then
        return true
    else
        return false
    end
end

local function Get_Stage()
    local tonumber = tonumber(Options.Select_Map.Value:split(".")[1])
    if tonumber == 1 then
        return Options.Select_Stage.Value
    else
    if Options.Select_Stage.Value == "6" then
        return  6 * tonumber
    elseif Options.Select_Stage.Value == "5" then
        return  6 * tonumber - 1
    elseif Options.Select_Stage.Value == "4" then
        return  6 * tonumber - 2
    elseif Options.Select_Stage.Value == "3" then
        return  6 * tonumber - 3
    elseif Options.Select_Stage.Value ==  "2" then
        return  6 * tonumber - 4
    elseif Options.Select_Stage.Value == "1" then
        return  6 * tonumber - 5
    end
end
end

local function Play()
    if Options.Select_Mode.Value ~= "Story" or not Check_The_START() then return end
    if game.Players.LocalPlayer.PlayerGui.HUD.MissionsV2.MissionFrame.Visible then
        task.wait(2)
        for i,v in pairs(game.Players.LocalPlayer.PlayerGui.HUD.MissionsV2.MissionFrame:GetChildren()) do
            if v:IsA("Frame") and v.Name ~= "Friends" then
            firesignal(v:FindFirstChild("Main"):FindFirstChild("Options"):FindFirstChild("PlayButton").MouseButton1Click,game.Players.LocalPlayer)
           end
       end
    end
end

local function SelectMap()
    if not Check_The_START() or game.Players.LocalPlayer.PlayerGui.HUD.Start.Visible then return end
    task.wait(1.5)
    for i,v in pairs(game.Players.LocalPlayer.PlayerGui.HUD.MissionsV2.MissionChooser.Main:GetDescendants()) do
        if v:FindFirstChild("MissionTitle") and v:FindFirstChild("FG") and v:FindFirstChild("MissionClick") then
            if string.find(v.MissionTitle.Text,Options.Select_Map.Value) and Options.Select_Mode.Value == "Story" then
                game:GetService("ReplicatedStorage").Remotes.Input:FireServer(RoomName.."Level",tostring(Get_Stage()),true)
            elseif string.find(v.MissionTitle.Text,Options.Select_Map.Value) and Options.Select_Mode.Value == "Infinity" then
                game:GetService("ReplicatedStorage").Remotes.Input:FireServer(RoomName.."Level",tostring(v),true)
            elseif Options.Select_Mode.Value == "Challenge" or Options.Select_Mode.Value == "Adventures" and string.find(v.MissionTitle.Text,Options.Select_Map.Value) then
                game:GetService("ReplicatedStorage").Remotes.Input:FireServer(RoomName.."Level",tostring(v),true)
           end
        end
    end
end



coroutine.resume(coroutine.create(function()
    pcall(function()
            game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(Kick)
                if ((Kick.Name == "ErrorPrompt") and Kick:FindFirstChild("MessageArea") and Kick.MessageArea:FindFirstChild("ErrorFrame")) then
                    if Options.AutoRejoinError.Value then
                        game:GetService("TeleportService"):Teleport(4996049426)
                    end
                end
            end)
        end)
end))


local Units = {}
coroutine.resume(coroutine.create(function()
    game.Players.LocalPlayer.PlayerGui.HUD.MissionEnd:GetPropertyChangedSignal('Visible'):Connect(function ()
        task.spawn(function ()
            if Options.SendWebhook.Value then
                task.wait(1)
                for i,v in next,game.Players.LocalPlayer.PlayerGui.HUD.MissionEnd.BG.Units:GetChildren() do
                    if v:IsA("Frame") and v.Name ~= "Template" then
                        table.insert(Units,tostring(v.Name).." / "..tostring(v:WaitForChild("UnitLvl"):WaitForChild("MainLevelUp"):WaitForChild("Title").Text)
                    )
                    end
                end
                local timeInfo = os.date("*t")
                BBody = game:GetService("HttpService"):JSONEncode({
                    content = nil,
                    embeds = {{
                        ["author"] = {
                            ["name"] = "Crazy Day ",
                            ["icon_url"] = "https://yt3.ggpht.com/yti/ANjgQV_KI8R3VhsnEhzYD0M1EJXUU29p0YC5gzrrhv8nWzA7j6s=s108-c-k-c0x00ffffff-no-rj"
                        },
                    ["title"] = "All Star Tower Defense", 
                    ["icon_url"] = "https://tr.rbxcdn.com/d10f139443bb86b2d89af3662003ae4a/768/432/Image/Webp",
                    ["footer"] = {
                            ["text"] = "All Star Tower Defense : " .. timeInfo.hour .. ":" .. timeInfo.min,
                            ["icon_url"] = "https://tr.rbxcdn.com/d10f139443bb86b2d89af3662003ae4a/768/432/Image/Webp"},
                            ["color"] = tonumber(0xFFD700),
                            ["url"] = "https://www.roblox.com/games/4996049426/UPDATE-4X-All-Star-Tower-Defense",
                            ["fields"] = {
                            {
                                ["name"] = "Units",
                                ["value"] = "\n "..table.concat(Units,"\n "),
                                ["inline"] = true
                                      
                            },
                            {
                                ["name"] = "Player",
                                ["value"] = "Username : ||**"..game.Players.LocalPlayer.Name.."**||".."\n Level : "..game.Players.LocalPlayer.Character.Head.NameLevelBBGUI.LevelFrame.TextLabel.Text:split(".")[2]
                                .."\n EXP : "..tostring(game.Players.LocalPlayer.PlayerGui.HUD.BottomFrame.XPBar.XPBarAmount.Text:split(" ")[1])
                                .."\n Stardust : "..tostring(game.Players.LocalPlayer.PlayerGui.HUD.BottomFrame.CurrencyList.Stardust.Amount.Text).."\n Gems : "..tostring(game.Players.LocalPlayer.PlayerGui.HUD.BottomFrame.CurrencyList.Gem.Amount.Text)
                                .."\n Coins : "..tostring(game.Players.LocalPlayer.PlayerGui.HUD.BottomFrame.CurrencyList.Coins.Amount.Text),
                                ["inline"] = true
                            }}}} })
                    local response = http_request or request or HttpPost or syn.request
                    response({
                    Url = Options.Webhook.Value,
                    Method = "POST",
                    Headers = {
                                    ["Content-Type"] = "application/json" },
                    Body = BBody})
                end
            end)
        repeat wait(0.25) until Options.Replay_Return_Next.Value
        if Options.Replay_Return_Next.Value then
            repeat wait(0.15)
            firesignal(game.Players.LocalPlayer.PlayerGui.HUD.MissionEnd.BG.Actions[Options.Ended_Action.Value].Activated,game.Players.LocalPlayer)
            until not game.Players.LocalPlayer.PlayerGui.HUD.MissionEnd.Visible or not Options.Replay_Return_Next.Value
        end
    end)
end))

coroutine.resume(coroutine.create(function()
    while wait() do
    pcall(function ()
        if not game.Players.LocalPlayer.PlayerGui.HUD.FastForward.Visible or
        tostring(game.Players.LocalPlayer.PlayerGui.HUD.FastForward.TextLabel.Text) == Options.Speed.Value then
        else
        if Options.SPEED.Value and Options.Speed.Value == "2X" and tostring(game.Players.LocalPlayer.PlayerGui.HUD.FastForward.TextLabel.Text) ~= "2X" then
            repeat
                if tostring(game.Players.LocalPlayer.PlayerGui.HUD.FastForward.TextLabel.Text) ~= "2X" then
            game:GetService("ReplicatedStorage").Remotes.Input:FireServer('SpeedChange',true)
            task.wait(1)
            end
            until tostring(game.Players.LocalPlayer.PlayerGui.HUD.FastForward.TextLabel.Text) == "2X" or not Options.SPEED.Value or Options.Speed.Value ~= "2X"
        elseif Options.SPEED.Value and Options.Speed.Value == "3X" and tostring(game.Players.LocalPlayer.PlayerGui.HUD.FastForward.TextLabel.Text) ~= "3X" then
            if not game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 12828275) then
            else
            repeat 
                if tostring(game.Players.LocalPlayer.PlayerGui.HUD.FastForward.TextLabel.Text) ~= "3X" and game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 12828275) then
            game:GetService("ReplicatedStorage").Remotes.Input:FireServer('SpeedChange',false)
            task.wait(1)
                end
            until tostring(game.Players.LocalPlayer.PlayerGui.HUD.FastForward.TextLabel.Text) == "1X" or not Options.SPEED.Value or Options.Speed.Value ~= "1X"
            or not game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 12828275)
                   end
               end
            end
         end)
      end
end))

bv.MaxForce = Vector3.new(100000,100000,100000)
bv.Velocity = Vector3.new(0,0,0)
coroutine.resume(coroutine.create(function()
    while task.wait() do
        if getgenv().STOP or not Options.Auto_Lobby.Value or not game:GetService("ReplicatedStorage").Lobby.Value then
        else
        if game.Players.LocalPlayer.PlayerGui.HUD.Start.Visible then
            firesignal(game.Players.LocalPlayer.PlayerGui.HUD.Start.MouseButton1Click,game.Players.LocalPlayer)
        end
        local plr = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not Check_The_START() and  not getgenv().STOP_TP then
            plr.CFrame = GET_THE_FARM()
            bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
        elseif Check_The_START() and not getgenv().STOP then
            plr.CFrame = CF()
            SelectMap()
            Play()
        end
        end
    end
end))


function ClamsReward()
    for i,v in pairs(game.Players.LocalPlayer.PlayerGui.HUD.TasksV2.Content.TaskList.ScrollFrame:GetChildren()) do
        if v:IsA("Frame") and v.ClaimButton.Button.Active then
            firesignal(v.ClaimButton.Button.MouseButton1Click,game.Players.LocalPlayer)
        end
    end
end

function VisibleForCodex(value)
	if game:GetService("CoreGui"):FindFirstChild("Codex") then
		game:GetService("CoreGui"):FindFirstChild("Codex"):WaitForChild("gui").Enabled = value
	end
end

function VisibleForTrigon(value)
    for i,v in pairs(game:GetService("CoreGui"):GetDescendants()) do
        if v.Name == "ExecFrame" and v.Parent.Name == "MainFrame" then
            v.Parent.Parent.Enabled = value
        end
     end
end

local Task
local Event
coroutine.resume(coroutine.create(function()
    while wait() do pcall(function ()
    if  Options.AutoCliamReward.Value and game:GetService("ReplicatedStorage").Lobby.Value then
        if game.Players.LocalPlayer.PlayerGui:WaitForChild("HUD"):WaitForChild("LeftButton"):WaitForChild("TaskButton"):WaitForChild("ImageLabel").Visible then
            if not game.Players.LocalPlayer.PlayerGui.HUD.TasksV2.Visible then
                repeat
            VisibleForCodex(false)
            Task = game.Players.LocalPlayer.PlayerGui.HUD.LeftButton.TaskButton
            game:GetService("VirtualInputManager"):SendMouseButtonEvent(Task.AbsolutePosition.X + 27.5, Task.AbsolutePosition.Y + 50, 0, not game.UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1), game, 0)
            VisibleForCodex(false)
            task.wait(0.3)
            until game.Players.LocalPlayer.PlayerGui.HUD.TasksV2.Visible

            else
                repeat
                    ClamsReward()
                    Event = game.Players.LocalPlayer.PlayerGui.HUD.TasksV2.Tabs.Event.FG
                    firesignal(game.Players.LocalPlayer.PlayerGui.HUD.TasksV2.Tabs.Tasks.FG.MouseButton1Click,game.Players.LocalPlayer)
                    task.wait(1)
                    ClamsReward()
                    firesignal(game.Players.LocalPlayer.PlayerGui.HUD.TasksV2.Tabs.Daily.FG.MouseButton1Click,game.Players.LocalPlayer)
                    task.wait(1)
                    ClamsReward()
                until not game.Players.LocalPlayer.PlayerGui:WaitForChild("HUD"):WaitForChild("LeftButton"):WaitForChild("TaskButton"):WaitForChild("ImageLabel").Visible
            end
        end
        if not game.Players.LocalPlayer.PlayerGui:WaitForChild("HUD"):WaitForChild("LeftButton"):WaitForChild("TaskButton"):WaitForChild("ImageLabel").Visible and game.Players.LocalPlayer.PlayerGui.HUD.TasksV2.Visible then
            Task = game.Players.LocalPlayer.PlayerGui.HUD.LeftButton.TaskButton
            repeat
            game:GetService("VirtualInputManager"):SendMouseButtonEvent(Task.AbsolutePosition.X + 27.5, Task.AbsolutePosition.Y + 50, 0, not game.UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1), game, 0)
            task.wait(0.3)
            until not game.Players.LocalPlayer.PlayerGui.HUD.TasksV2.Visible
            VisibleForCodex(true)
        end
    end
end)
end
end))

game.Players.LocalPlayer.OnTeleport:Connect(function(state)
    getgenv().OnTeleport = true
    local QueueOnTeleport = queue_on_teleport or queueonteleport or (syn and syn.queue_on_teleport)
    if state == Enum.TeleportState.InProgress and Options.AutoExecuteScript.Value then
    QueueOnTeleport(
        "loadstring(game:HttpGet('https://raw.githubusercontent.com/Mangadexwannatest/CanislupusXHUB/main/All_Start_Tower_Defense.lua'))()"
    )
    end
end)

end
wait(5)
until game.CoreGui:FindFirstChild("CrazyDay")
end -- End Of If
