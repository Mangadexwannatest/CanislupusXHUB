repeat task.wait() until game:IsLoaded()
if game:WaitForChild("CoreGui"):FindFirstChild("CrazyDay") then return end
    repeat
        game:WaitForChild("CoreGui") game:WaitForChild("Players")
        task.wait(0.1)
        if game:WaitForChild("CoreGui"):FindFirstChild("CrazyDay") == nil then
            warn("Loading Gui. . .")

    coroutine.resume(coroutine.create(function()
        repeat task.wait() until game:WaitForChild("CoreGui"):FindFirstChild("CrazyDay")
        if game:WaitForChild("CoreGui"):FindFirstChild("Close/Open") == nil then
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
    end))

    coroutine.resume(coroutine.create(function()
        repeat task.wait() until game:WaitForChild("CoreGui"):FindFirstChild("Close/Open")
        local Button = game:WaitForChild("CoreGui"):WaitForChild("Close/Open"):WaitForChild("TextButton")
        Button.InputBegan:Connect(function(input)
            if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
        game:WaitForChild("CoreGui"):WaitForChild("CrazyDay"):WaitForChild("MainStatus").Visible = not game:WaitForChild("CoreGui"):WaitForChild("CrazyDay"):WaitForChild("MainStatus").Visible
        end
    end)
    end))

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

    local function Get_Paragrahp()
        for i,v in pairs(game:GetService("CoreGui"):WaitForChild("CrazyDay"):WaitForChild("MainStatus"):WaitForChild("CanvasGroup"):GetChildren()) do
            if i == 1 then
                for ii,vv in pairs(v:GetChildren()) do
                    if ii == 3 then
                        if vv:FindFirstChild("Frame") then
                            for iii,vvv in pairs(vv.Frame:GetDescendants()) do
                                if vvv.Name == "TextLabel" and not string.find(vvv.Text,"Macro Status") then
                                    return vvv
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    local function MacroStatusTExt()
        for i,v in pairs(game:GetService("CoreGui"):WaitForChild("CrazyDay"):WaitForChild("MainStatus"):WaitForChild("CanvasGroup"):GetChildren()) do
            if i == 1 then
                for ii,vv in pairs(v:GetChildren()) do
                    if ii == 3 then
                        if vv:FindFirstChild("Frame") then
                            for iii,vvv in pairs(vv.Frame:GetDescendants()) do
                                if vvv.Name == "TextLabel" and string.find(vvv.Text,"Macro Status") then
                                    return vvv
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    local function stringtocf(str)
        return CFrame.new(table.unpack(str:gsub(" ", ""):split(",")))
    end
    local function stringtopos(str)
        return Vector3.new(table.unpack(str:gsub(" ", ""):split(",")))
    end


    local firesignal = function(signal, arg2)
        if getconnections(signal) then
            firesignal(signal, arg2)
        end
    end

    local tablead = {"k","m","b"}
    local function stringofnum(values)
        local num = 1
            for i,v in pairs(tablead) do
                values = string.gsub(values, v ,function ()
                num = num * (10 ^ (i * 3))
                return ''
            end)
        end
        return num * values
    end

    local function getmoney_units(values)
    for i,v in next,game.Players.LocalPlayer.PlayerGui.HUD.BottomFrame.Unit:GetChildren() do
        if v:IsA("Frame") and tostring(v.Unit.Value) == tostring(values) then
            return v:FindFirstChild("ImageLabel"):FindFirstChild("TextLabel").Text
            end
        end
    end

    local function Money()
        return game.Players.LocalPlayer.Money.Value
    end

    local function getupgradevalues()
        if game.Players.LocalPlayer.PlayerGui.HUD.UpgradeV2.Actions.Upgrade.Amount.Text ~= "Upgrade: MAX" then
        return game.Players.LocalPlayer.PlayerGui.HUD.UpgradeV2.Actions.Upgrade.Amount.Text:split("$")[2]
        end
    end

    local function Wave()
        if game:GetService("ReplicatedStorage").Map.Value == "Gauntlet" then
            return 0
        elseif game:GetService("ReplicatedStorage").Map.Value ~= "Gauntlet" then
        return game:GetService("ReplicatedStorage").WaveValue.Value
        end
    end


    local function waithow()
        return tonumber(1) / tonumber(game:GetService("ReplicatedStorage").SpeedUP.Value)
    end

    local time_start = 0
    coroutine.resume(coroutine.create(function()
        if game:GetService("ReplicatedStorage").Map.Value == "Gauntlet" then return end
        repeat task.wait() until tonumber(Wave()) > 0
        while wait(waithow()) do
            time_start += 1
        end
    end))

    local function Time()
        if game.Players.LocalPlayer.PlayerGui.HUD:FindFirstChild("Timerwave") and game:GetService("ReplicatedStorage").Map.Value == "Gauntlet" then
            return game.Players.LocalPlayer.PlayerGui.HUD.Timerwave.Text
        elseif game.Players.LocalPlayer.PlayerGui.HUD:FindFirstChild("Timerwave") == nil and game:GetService("ReplicatedStorage").Map.Value == "Gauntlet" then
            return 0
        elseif game:GetService("ReplicatedStorage").Map.Value ~= "Gauntlet" then
            --return Workspace.DistributedGameTime
            return time_start
        end
    end


    local function ClamsReward()
        for i,v in pairs(game.Players.LocalPlayer.PlayerGui.HUD.TasksV2.Content.TaskList.ScrollFrame:GetChildren()) do
            if v:IsA("Frame") and v.ClaimButton.Button.Active then
                firesignal(v.ClaimButton.Button.MouseButton1Click,game.Players.LocalPlayer)
            end
        end
    end

    local function skipwave_value()
        return tostring(game.Players.LocalPlayer.PlayerGui.HUD.Setting.Page.Main.Scroll.SettingV2.AutoSkip.Options.Toggle.CategoryName.Text)
    end

   local function VisibleForCodex(value)
        if game:GetService("CoreGui"):FindFirstChild("Codex") then
            game:GetService("CoreGui"):FindFirstChild("Codex"):WaitForChild("gui").Enabled = value
        end
    end

    local function VisibleForTrigon(value)
        for i,v in pairs(game:GetService("CoreGui"):GetDescendants()) do
            if v.Name == "ExecFrame" and v.Parent.Name == "MainFrame" then
                v.Parent.Parent.Enabled = value
            end
         end
    end

    local plr,gameidtp = game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait()wait()
    if tonumber(plr:WaitForChild("Head"):WaitForChild("NameLevelBBGUI"):WaitForChild("LevelFrame"):WaitForChild("TextLabel").Text:split(".")[2]) >= 100 then
        gameidtp = 7785334488
    elseif tonumber(plr:WaitForChild("Head"):WaitForChild("NameLevelBBGUI"):WaitForChild("LevelFrame"):WaitForChild("TextLabel").Text:split(".")[2]) < 100 then
        gameidtp = 4996049426
    end
    local Traget_CFrame,RoomName
    local bv = Instance.new("BodyVelocity")
    local function get_the_cframeofdoor()
        return CFrame.new(table.unpack(Traget_CFrame:gsub(" ", ""):split(",")))
    end

    local function current_index(parent,value)
        local int = Instance.new("IntValue")
        int.Name = "Index"
        int.Parent = parent
        int.Value = value
    end

    local function exec()
        return tostring(identifyexecutor())
    end


    local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
    local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
    local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

    local Window = Fluent:CreateWindow({
        Title = "All Star Tower Defense",
        SubTitle = "Last Update May/16/2024 [YT:CrazyDay/edek#1004]",
        TabWidth = 160,
        Size = UDim2.fromOffset(580, 460),
        Acrylic = true,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.LeftControl
    })
    local Tabs = {
        Main = Window:AddTab({ Title = "Main", Icon = "" }),
        Lobby = Window:AddTab({Title = "Lobby",Icon = ""}),
        Other = Window:AddTab({Title = "Other",Icon = ""}),
        Settings = Window:AddTab({ Title = "Settings", Icon = "" })
    }

    local Options = Fluent.Options
    local Macro_Files = {}
    local a = getrawmetatable(game)
    local backs = a.__namecall
    local Macro = {}
    local ignore_the_values = {}
    local current_val = 0
    local Last_action = {["Action"] = {["Default"] = {["1"] = nil,["2"] = nil,["3"] = nil}}}
    getgenv().Playing = nil

    do
        local function Notify(titile,Content,SubTitle,time)
            Fluent:Notify({
                Title = titile,
                Content = Content,
                SubContent = (SubTitle or nil),
                Duration = (time or 5)
            })
        end

        local function refreshmacroprofile()
            Macro_Files = {}
            for i,v in pairs(listfiles("/CrazyDay/ASTD/Macro")) do
                if exec() == "Fluxus" then
                    table.insert(Macro_Files,v:split([[\]])[2]:split(".lua")[1])
                elseif exec() ~= "Fluxus" then
                    table.insert(Macro_Files,v:split("/")[5]:split(".lua")[1])
                end
            end
        end

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
        if exec() == "Fluxus" then
            table.insert(Macro_Files,v:split([[\]])[2]:split(".lua")[1])
        elseif exec() ~= "Fluxus" then
            table.insert(Macro_Files,v:split("/")[5]:split(".lua")[1])
        end
    end
    repeat task.wait() until #Macro_Files >= 1
    ------------- Macro
    Tabs.Main:AddParagraph({Title = "Macro Status [nil]",Content = "Status nil [0]\nCurrent Time : 0"})
    local CurrentFiles = Tabs.Main:AddDropdown("Current_File", {
        Title = "Select File",
        Values = Macro_Files,
        Multi = false,
        Default = 1,
    })
    local ignore_Its = Tabs.Main:AddDropdown("ignore_If", {
        Title = "Ignore time / wave if",
        Description = "will out of wait for time / wave while playing macro if wave 0 or money reach",
        Values = {"wave 0","money reach"},
        Multi = true,
        Default = {nil},
    })
    ignore_Its:OnChanged(function (Value)
        ignore_the_values = {}
        for Value, State in next, Value do
            table.insert(ignore_the_values, Value)
        end
    end)
    Tabs.Main:AddInput("Input", {
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
            refreshmacroprofile()
            CurrentFiles:SetValues(Macro_Files)
            CurrentFiles:SetValue(bool)
            Notify("Creat Succeed",tostring(bool))
        end
    })

    Tabs.Main:AddButton({
        Title = "Deleate file",
        Description = "delete current macro file",
        Callback = function()
            if Options.Current_File.Value == nil or not isfile(string.format("/CrazyDay/ASTD/Macro/".."%s.lua",Options.Current_File.Value)) then
                return Notify("Error","can't find the file")
            end
            Window:Dialog({
                Title = "Current File : "..Options.Current_File.Value,
                Content = "are you sure you want to delete?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            if Options.Current_File.Value == "Crazy Day" then
                                return Notify("Error","can't delete the default profile")
                            end
                            Notify("Deleate Succeed",Options.Current_File.Value)
                            delfile(string.format("/CrazyDay/ASTD/Macro/".."%s.lua",Options.Current_File.Value))
                            refreshmacroprofile()
                            CurrentFiles:SetValues(Macro_Files)
                            CurrentFiles:SetValue(nil)
                        end
                    },{
                        Title = "Cancel",
                        Callback = function()
                            refreshmacroprofile()
                            CurrentFiles:SetValues(Macro_Files)
                            CurrentFiles:SetValue(Options.Current_File.Value)
                        end
                    }
                }
            })
        end
    })
    Tabs.Main:AddButton({
        Title = "Reset file",
        Description = "all your record in the file that you select will be reset to nil",
        Callback = function()
            if Options.Current_File.Value == nil or not isfile(string.format("/CrazyDay/ASTD/Macro/".."%s.lua",Options.Current_File.Value)) then
                return Notify("Error","can't find the file")
            end
            Window:Dialog({
                Title = "Current File : "..Options.Current_File.Value,
                Content = "are you sure you want to reset?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            Notify("Reset Succeed",Options.Current_File.Value)
                            Macro = {}
                            writefile(string.format("/CrazyDay/ASTD/Macro".."/%s.lua",Options.Current_File.Value), game:GetService("HttpService"):JSONEncode({}))
                        end
                    },{
                        Title = "Cancel",
                        Callback = function()

                        end
                    }
                }
            })
        end
    })
    Tabs.Main:AddButton({
        Title = "Copy file",
        Description = "press the button to copy all current macro file values",
        Callback = function()
            local xo = readfile(string.format("/CrazyDay/ASTD/Macro".."/%s.lua",Options.Current_File.Value))
            setclipboard(
                game:GetService("HttpService"):JSONEncode(xo):gsub('"%[','['):gsub('%]"',']'):gsub([[\]],'')
            )
            Notify("Copy Succeed",Options.Current_File.Value,"Macro Step Value : "..#game:GetService("HttpService"):JSONDecode(readfile(string.format("/CrazyDay/ASTD/Macro".."/%s.lua",Options.Current_File.Value))))
        end
    })

    local RecordToggle = Tabs.Main:AddToggle("Record", {Title = "Macro Record", Default = false })
    local PlayToggle = Tabs.Main:AddToggle("Play", {Title = "Macro Play", Default = false })

    RecordToggle:OnChanged(function ()
        if Options.Record.Value and Options.Play.Value then
            Options.Record:SetValue(false)
            Options.Play:SetValue(false)
            return Notify("Error","dont enable record / play macro together")
        end
        if Options.Record.Value and not Options.Play.Value then
            MacroStatusTExt().Text = "Macro Status ["..tostring(Options.Current_File.Value).."]"
            Last_action = {
                ["Action"] = {
                    ["end"] = {["1"] = "Status Recording ["..tostring(#Macro).."]" }
                }}
            repeat task.wait() until not Options.Record.Value
            MacroStatusTExt().Text = "Macro Status [nil]"
            Last_action = {
                ["Action"] = {
                    ["end"] = {["1"] = "Status Recording Ended ["..tostring(#Macro).."]" }
                }}
        end
    end)

    local importoptions = Tabs.Main:AddSection('Import Macro')

    importoptions:AddDropdown("ImportMethod", {
        Title = "Select Mehod",
        Description = nil,
        Values = {"Discord","Github"},
        Multi = false,
        Default = 1,
    })

    importoptions:AddInput("ImportName", {
        Title = "Import Name",
        Description = "the name of file to make for import",
        Default = nil,
        Placeholder = "nil",
        Numeric = false,
        Finished = true,})

    importoptions:AddInput("ImportLink", {
        Title = "Import Link",
        Description = "link of file location",
        Default = nil,
        Placeholder = "nil",
        Numeric = false,
        Finished = true,})

    importoptions:AddButton({
        Title = "Import",
        Description = "press the button to import file",
        Callback = function()
            if Options.ImportName.Value == (nil or "") or Options.ImportLink.Value == (nil or "") then return Notify("Error","Value","make sure you dont forgot the import name/link") end
            if (Options.ImportMethod.Value == "Discord" and not string.find(Options.ImportLink.Value,"https://cdn.discordapp.com/attachments/")) or (Options.ImportMethod.Value == "Github" and not string.find(Options.ImportLink.Value,"https://github.com/")) then return Notify("Error",tostring(Options.ImportMethod.Value),"make sure your link it's correct") end
            repeat
                if not isfile(string.format("/CrazyDay/ASTD/Macro".."/%s.lua",Options.ImportName.Value)) then
                    writefile(string.format("/CrazyDay/ASTD/Macro".."/%s.lua",Options.ImportName.Value), game:GetService("HttpService"):JSONEncode({}))
                end
                wait()
            until isfile(string.format("/CrazyDay/ASTD/Macro".."/%s.lua",Options.ImportName.Value))
            if Options.ImportMethod.Value == "Discord" then
                local getinfo = game:GetService("HttpService"):JSONEncode(game:HttpGet(tostring(Options.ImportLink.Value)))
                writefile(string.format("/CrazyDay/ASTD/Macro".."/%s.lua",Options.ImportName.Value), getinfo:gsub('"%[','['):gsub('%]"',']'):gsub([[\]],''))
            elseif Options.ImportMethod.Value == "Github" then
                local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or (request)
                local linkmain = tostring(Options.ImportLink.Value)
                local rawlink_g = linkmain:gsub("https://github.com","https://raw.githubusercontent.com"):gsub("/blob","")
                local raw = httprequest({Url = tostring(rawlink_g),Method = "GET"})
                local linkinfo = game:GetService("HttpService"):JSONEncode(raw.Body):gsub([[\]],''):gsub('"%[','['):gsub('%]n"',']')
                writefile(string.format("/CrazyDay/ASTD/Macro".."/%s.lua",Options.ImportName.Value), linkinfo)
            end
            refreshmacroprofile()
            CurrentFiles:SetValues(Macro_Files)
            CurrentFiles:SetValue(Options.ImportName.Value)
            Notify("Import Succeed",Options.ImportName.Value,"Macro Step Value : "..#game:GetService("HttpService"):JSONDecode(readfile(string.format("/CrazyDay/ASTD/Macro".."/%s.lua",Options.ImportName.Value))))
        end
    })

    importoptions:AddButton({
        Title = "How to Import?",
        Description = "press the button to copy the link for import file tutorial",
        Callback = function()
            if Options.ImportMethod.Value == "Discord" then
                setclipboard(tostring("https://streamable.com/ochwcz"))
                Notify("Copy Succeed",tostring(Options.ImportMethod.Value),"https://streamable.com/ochwcz")
            elseif Options.ImportMethod.Value == "Github" then
                setclipboard(tostring("https://streamable.com/w1o9z0"))
                Notify("Copy Succeed",tostring(Options.ImportMethod.Value),"https://streamable.com/w1o9z0")
            end
        end
    })

    ------------- Game Options
    Tabs.Main:AddSection('Other')

    local option_speed = Tabs.Main:AddDropdown("Speed", {
        Title = "Select Game Speed",
        Description = nil,
        Values = {"2X","3X"},
        Multi = false,
        Default = 1,
    })

    option_speed:OnChanged(function(Value)
        if Value == "3X" and not game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 12828275) then
            option_speed:SetValue("2X")
            Notify("Error","buy the gamepass first")
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
            repeat task.wait() until game.Players.LocalPlayer.PlayerGui.HUD.ModeVoteFrame.Visible
            repeat
                game:GetService("ReplicatedStorage").Remotes.Input:FireServer("VoteGameMode",tostring(Options.Mode_vote.Value))
            wait(1)
            until not game.Players.LocalPlayer.PlayerGui.HUD.ModeVoteFrame.Visible
        end
    end)

    ----------- Game Lobby
    local MAP = {
        ["World1"] = {},
        ["World2"] = {}
    }
    local StoryTable = {}
    local InfiniteTable = {}
    local ChallengeTable = {}
    local AdventuresTable = {}
    local Lable
    coroutine.resume(coroutine.create(function()
        if not game:GetService("ReplicatedStorage").Lobby.Value then
        Lable = "Current World : "..tostring(game:GetService("ReplicatedStorage").Map.Value)
        elseif game.Workspace:FindFirstChild("Queue"):FindFirstChild("W2 PERM") and game:GetService("ReplicatedStorage").Lobby.Value then
        Lable = "Current World : 1"
        elseif not game.Workspace:FindFirstChild("Queue"):FindFirstChild("W2 PERM") and game:GetService("ReplicatedStorage").Lobby.Value then
        Lable = "Current World : 2"
        end
        for i,v in pairs(game.Players.LocalPlayer.PlayerGui.HUD.MissionsV2.MissionChooser.Main.World1:GetChildren()) do
            if v:IsA("Frame") then
                table.insert(MAP["World1"],{["MAP"] = {
                    ["Number"] = tonumber(v.MissionTitle.Text:split(".")[1]),
                    ["Name"] = tostring(v.MissionTitle.Text:split(".")[2])
                }})
                end
            end
            table.sort(MAP["World1"],function (a,b)
                return a["MAP"]["Number"] < b["MAP"]["Number"]
            end)
        for i,v in pairs(game.Players.LocalPlayer.PlayerGui.HUD.MissionsV2.MissionChooser.Main.World2:GetChildren()) do
            if v:IsA("Frame") then
                table.insert(MAP["World2"],{["MAP"] = {
                    ["Number"] = tonumber(v.MissionTitle.Text:split(".")[1]),
                    ["Name"] = tostring(v.MissionTitle.Text:split(".")[2])
                    }})
                end
            end
            table.sort(MAP["World2"],function (a,b)
                return a["MAP"]["Number"] < b["MAP"]["Number"]
            end)
        for i,v in pairs(game.Players.LocalPlayer.PlayerGui.HUD.MissionsV2.MissionChooser.Main.Infinite:GetChildren()) do
            if v:IsA("Frame")  then
                table.insert(InfiniteTable,tostring(v.MissionTitle.Text))
            end
        end
        for i,v in pairs(game.Players.LocalPlayer.PlayerGui.HUD.MissionsV2.MissionChooser.Main.Misc:GetChildren()) do
            if v:IsA("Frame") then
                    table.insert(InfiniteTable,tostring(v.MissionTitle.Text))
            end
        end
        for i,v in pairs(game.Players.LocalPlayer.PlayerGui.HUD.MissionsV2.MissionChooser.Main.Challenges:GetChildren()) do
        if v:IsA("Frame")  then
            table.insert(ChallengeTable,tostring(v.MissionTitle.Text))
           end
        end
        for i,v in pairs(game.Players.LocalPlayer.PlayerGui.HUD.MissionsV2.MissionChooser.Main.Adventures:GetChildren()) do
            if v:IsA("Frame") then
                table.insert(AdventuresTable,tostring(v.MissionTitle.Text))
            end
        end
        ---------------------------
        for i = 1,#MAP["World1"] do
            for i,v in pairs(MAP["World1"][i]) do
                if i == "MAP" then
                    table.insert(StoryTable,v["Number"].."."..v["Name"])
                end
            end
        end
        for i = 1,#MAP["World2"] do
            for i,v in pairs(MAP["World2"][i]) do
                if i == "MAP" then
                    table.insert(StoryTable,v["Number"].."."..v["Name"])
                end
            end
        end
    end))

    Tabs.Lobby:AddParagraph({
        Title = "Current World",
        Content = tostring(Lable)
    })
    local MOD_SELECT = Tabs.Lobby:AddDropdown("Select_Mode", {
        Title = "Select Mode",
        Description = nil,
        Values = {"Story","Infinity","Challenge","Adventures"},
        Multi = false,
        Default = 1
    })

    Tabs.Lobby:AddDropdown("Story_Map", {
        Title = "Select Map (Story)",
        Description = nil,
        Values = StoryTable,
        Multi = false,
        Default = 1,
    })
    Tabs.Lobby:AddDropdown("Infinite_Map", {
        Title = "Select Map (Infinite)",
        Description = nil,
        Values = InfiniteTable,
        Multi = false,
        Default = 1,
    })
    Tabs.Lobby:AddDropdown("Challenge_Map", {
        Title = "Select Map (Challenge)",
        Description = nil,
        Values = ChallengeTable,
        Multi = false,
        Default = 1,
    })
    Tabs.Lobby:AddDropdown("Adventures_Map", {
        Title = "Select Map (Adventures)",
        Description = nil,
        Values = AdventuresTable,
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

    local warn1 = Tabs.Lobby:AddToggle("Auto_Lobby", {Title = "Auto Join Lobby", Default = false })

    warn1:OnChanged(function()
        if (Options.Select_Mode.Value == "Challenge" or "Adventures") and Options.Auto_Lobby.Value and game:GetService("ReplicatedStorage").Lobby.Value and Lable ~= "Current World : 2" then
            return Notify("Error","this mode not support on this wolrd") end
        if not Options.Auto_Lobby.Value and game.Players.LocalPlayer.Character.Humanoid.PlatformStand then
            game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
            bv.Parent = nil
        end
    end)


    MOD_SELECT:OnChanged(function()
        if Options.Select_Mode.Value == Options.Select_Mode.Values[1] and game:GetService("ReplicatedStorage").Lobby.Value then
            Traget_CFrame,RoomName = tostring(Story().CFrame) , tostring(Story().Name)
        elseif Options.Select_Mode.Value == Options.Select_Mode.Values[2] and game:GetService("ReplicatedStorage").Lobby.Value then
            Traget_CFrame,RoomName = tostring(Infinite().CFrame) , tostring(Infinite().Name)
        elseif (Options.Select_Mode.Value == Options.Select_Mode.Values[3] or Options.Select_Mode.Values[4]) and game:GetService("ReplicatedStorage").Lobby.Value then
            Traget_CFrame,RoomName = tostring(Challenge_Adventures().CFrame) , tostring(Challenge_Adventures().Name)
        end
    end)

    Tabs.Lobby:AddToggle("AutoUpgradeSlot", {Title = "Auto Upgrade Slot",Description = "automatically upgrade when your inventory full", Default = false })
    coroutine.resume(coroutine.create(function()
    game.Players.LocalPlayer.PlayerGui.Notification.ChildAdded:Connect(function (v)
        if v.Name == "Message" and v:FindFirstChild("Message") and tostring(v:WaitForChild("Message"):FindFirstChild("Main"):FindFirstChild("Text").Text) ==  "Spend 150 Gems to Upgrade Inventory by 50 Slots" then
                repeat wait() until game.Players.LocalPlayer.PlayerGui.Notification:FindFirstChild("Message"):FindFirstChild("Message"):FindFirstChild("Main"):FindFirstChild("Options"):FindFirstChild("ReviewButton").Visible and Options.AutoUpgradeSlot.Value
                    repeat
                        firesignal(game.Players.LocalPlayer.PlayerGui.Notification:FindFirstChild("Message"):FindFirstChild("Message"):FindFirstChild("Main"):FindFirstChild("Options"):FindFirstChild("ReviewButton").MouseButton1Click,game.Players.LocalPlayer)
                        task.wait(0.15)
                    until not v.Parent or not Options.AutoUpgradeSlot.Value
                end
            end)
        end))
    Tabs.Lobby:AddToggle("AutoCliamReward",{Title = "Auto Clams Task",Description = "automatically clams all quest reward",Default = false})

    ------------- Other Functions

    Tabs.Other:AddToggle("AutoRejoinError", {Title = "Auto Rejoin When Disconnect ", Default = false })
    local white = Tabs.Other:AddToggle("AutoWhiteScreen", {Title = "Auto White Screen", Default = false })
    Tabs.Other:AddToggle("AutoCloseAfterExecute", {Title = "Auto Close Gui After Execute", Default = false })
    Tabs.Other:AddToggle("AutoExecuteScript", {Title = "Auto Execute Script", Default = false })
    Tabs.Other:AddButton({
        Title = "Teleport Lobby",
        Description = nil,
        Callback = function()
            game:GetService("TeleportService"):Teleport(gameidtp)
        end
    })
    local UpdateLog = Tabs.Other:AddSection("Update Log")
    UpdateLog:AddParagraph({
        Title = "Update Log",
        Content = "May/15/2024\n[+] Macro (Play/Record) Support Multiple Abilities\n\nMay/16/2024\n[+] Import Method (Discord/GitHub)\n[+] Import Macro\n[*] Fixed some time after unit reach max placement not record"
    })

    white:OnChanged(function()
        if Options.AutoWhiteScreen.Value then
            game:GetService("RunService"):Set3dRenderingEnabled(false)
        else
            game:GetService("RunService"):Set3dRenderingEnabled(true)
        end
    end)


    local function waveuionshow()
        return game.Players.LocalPlayer.PlayerGui.HUD.NextWaveVote.Visible
    end


    local function check_the_unitspawns(Unit,Position)
        if type(Position) == "string" then
            Position = stringtopos(Position)
        end
        for i,v in pairs(game.Workspace:WaitForChild("Unit"):GetChildren()) do
            if v.Name == Unit and tostring(v:WaitForChild("Owner").Value) == game.Players.LocalPlayer.Name then
                if v.HumanoidRootPart.Position == Position or (v.HumanoidRootPart.Position - Position).magnitude < 2 then
                    return v
                end
            end
        end
    end

    local function check_index_values(Unit,Value)
        for i,v in pairs(game.Workspace:WaitForChild("Unit"):GetChildren()) do
            if v.Name == Unit and v:WaitForChild("Owner").Value == game.Players.LocalPlayer then
                if v:FindFirstChild("Index") and tonumber(v.Index.Value) == tonumber(Value) then
                    return v
                elseif v:FindFirstChild("Index") == nil then
                    return false
                end
            end
        end
    end

    local function check_its_index(Unit)
        for i,v in pairs(game.Workspace:WaitForChild("Unit"):GetChildren()) do
            if v.Name == Unit and v:WaitForChild("Owner").Value == game.Players.LocalPlayer then
                if v:FindFirstChild("Index") == nil then
                    return v
                end
            end
        end
    end

    local function fire(values)
        local Signals = {"Activated", "MouseButton1Down", "MouseButton2Down", "MouseButton1Click", "MouseButton2Click"}
        for i,Signal in pairs(Signals) do
            firesignal(values[Signal])
        end
    end

    local function get_multiple(value)
        if game.Players.LocalPlayer.PlayerGui:FindFirstChild("MultipleAbilities") == nil then return end
        for i,v in pairs(game.Players.LocalPlayer.PlayerGui.MultipleAbilities.Frame:GetChildren()) do
            if v.Name == "ImageButton" and tostring(v.TextLabel.Text) == value then
                fire(v)
            end
        end
    end

    local function wave_of_0()
        if game:GetService("ReplicatedStorage").Map.Value ~= "Gauntlet" and table.find(ignore_the_values,"wave 0") and tonumber(Wave()) == tonumber(0) then
            return true
        end
    end

    local function wait_for(values,number,actionname,val)
        current_val = number
        Last_action = {
            ["Action"] = {
                [actionname] = val
            }}

            if not table.find(ignore_the_values,"money reach") then
                repeat task.wait() until tonumber(Wave()) >= tonumber(values["Wave"]) or table.find(ignore_the_values,"money reach") or tonumber(Time()) >= tonumber(values["Time"]) or wave_of_0()
            elseif table.find(ignore_the_values,"money reach") then
                if values["Money"] then
                    repeat task.wait() until tonumber(Wave()) >= tonumber(values["Wave"]) or (tonumber(Money()) >= tonumber(stringofnum(values["Money"]))) or  (tonumber(Time()) >= tonumber(values["Time"])) or wave_of_0()
                elseif not values["Money"] then
                    repeat task.wait() until tonumber(Wave()) >= tonumber(values["Wave"]) or (tonumber(Time()) >= tonumber(values["Time"])) or wave_of_0()
                end
            end

            if not table.find(ignore_the_values,"money reach") then
                repeat task.wait() until tonumber(Time()) >= tonumber(values["Time"]) or table.find(ignore_the_values,"money reach") or wave_of_0()
            elseif table.find(ignore_the_values,"money reach") then
                if values["Money"] then
                    repeat task.wait() until tonumber(Time()) >= tonumber(values["Time"]) or tonumber(Money()) >= tonumber(stringofnum(values["Money"])) or wave_of_0()
                elseif not values["Money"] then
                    repeat task.wait() until tonumber(Time()) >= tonumber(values["Time"]) wave_of_0()
                end
            end

            if values["Money"] then
                repeat task.wait() until tonumber(Money()) >= tonumber(stringofnum(values["Money"]))
            end
        end

        local count = 0
        PlayToggle:OnChanged(function ()
            if game:GetService("ReplicatedStorage").Lobby.Value then return end
            repeat task.wait() until #Macro_Files >= 1
            task.wait(0.5)
            if Options.Play.Value and not game:GetService("ReplicatedStorage").Lobby.Value then
                for i,v in pairs(listfiles("/CrazyDay/ASTD/Macro")) do
                    if exec() == "Fluxus" then
                        if v:split([[\]])[2]:split(".lua")[1] == Options.Current_File.Value then
                            getgenv().Playing = game:GetService("HttpService"):JSONDecode(readfile(string.format("/CrazyDay/ASTD/Macro".."/%s.lua",v:split([[\]])[2]:split(".lua")[1])))
                        end
                    elseif exec() ~= "Fluxus" then
                        if v:split([[/]])[5]:split(".lua")[1] == Options.Current_File.Value then
                            getgenv().Playing = game:GetService("HttpService"):JSONDecode(readfile(string.format("/CrazyDay/ASTD/Macro".."/%s.lua",v:split([[/]])[5]:split(".lua")[1])))
                        end
                    end
                end
                coroutine.resume(coroutine.create(function()
                repeat task.wait() until #Macro_Files >= 1
                if game:GetService("ReplicatedStorage").Lobby.Value then return end
                task.wait(0.25)
                MacroStatusTExt().Text = "Macro Status ["..tostring(Options.Current_File.Value).."]"
                for val = 1,#getgenv().Playing do
                    for i,v in pairs(getgenv().Playing[val]) do
                        count = val
                        if i == "VoteGameMode" and game.Players.LocalPlayer.PlayerGui.HUD.ModeVoteFrame.Visible and not Options.Auto_Vote.Value then
                            Last_action = {
                                ["Action"] = {
                                    ["new"] = {["1"] = "Waiting For Wave : "..tostring(v["Wave"]),["2"] = "Waiting For Time : "..tostring(v["Time"]),["3"] = "Action : VoteGameMode",["4"] = "Value : "..tostring(v["Value"]) }
                                }}
                                coroutine.resume(coroutine.create(function()
                                    repeat task.wait() until game.Players.LocalPlayer.PlayerGui.HUD.ModeVoteFrame.Visible or tonumber(Wave()) > tonumber(v["Wave"])
                                    repeat
                                    game:GetService("ReplicatedStorage").Remotes.Input:FireServer("VoteGameMode",tostring(v["Value"]))
                                    task.wait(0.1)
                                    until not game.Players.LocalPlayer.PlayerGui.HUD.ModeVoteFrame.Visible or tonumber(Wave()) > tonumber(v["Wave"]) or Options.Auto_Vote.Value
                                end))
                        elseif i == "VoteWaveConfirm" and tonumber(Wave()) <= tonumber(v["Wave"]) and not skipwave_value() == "On" then
                            wait_for(v,val,"new",{["1"] = "Waiting For Wave : "..tostring(v["Wave"]),["2"] = "Waiting For Time : "..tostring(v["Time"]),["3"] = "Action : VoteWaveConfirm"})
                            repeat task.wait() until waveuionshow() or skipwave_value() == "On" or tonumber(Wave()) > tonumber(v["Wave"])
                            repeat
                                game:GetService("ReplicatedStorage").Remotes.Input:FireServer("VoteWaveConfirm")
                                task.wait(0.135)
                            until not waveuionshow() or skipwave_value() == "On" or tonumber(Wave()) > tonumber(v["Wave"]) or not Options.Play.Value
                        elseif i == "AutoSkipWaves_CHANGE" and tostring(skipwave_value()) ~= tostring(v["Value"]) then
                            wait_for(v,val,"new",{["1"] = "Waiting For Wave : "..tostring(v["Wave"]),["2"] = "Waiting For Time : "..tostring(v["Time"]),["3"] = "Action : AutoSkipWaves_CHANGE",["4"] = "Value : "..tostring(v["Value"])})
                            repeat
                            game:GetService("ReplicatedStorage").Remotes.Input:FireServer("AutoSkipWaves_CHANGE")
                            task.wait(0.25)
                            until tostring(skipwave_value()) == tostring(v["Value"]) or not Options.Play.Value
                        elseif i == "SpeedChange" then
                            wait_for(v,val,"new",{["1"] = "Waiting For Wave : "..tostring(v["Wave"]),["2"] = "Waiting For Time : "..tostring(v["Time"]),["3"] = "Action : SpeedChange",["4"] = "Value : "..tostring(v["Value"]),["5"] = "Bool : "..tostring(v["bool"]) })
                            repeat
                                if game.Players.LocalPlayer.PlayerGui.HUD:WaitForChild("FastForward"):WaitForChild("TextLabel").Text ~= tostring(v["Value"]) then
                                game:GetService("ReplicatedStorage").Remotes.Input:FireServer("SpeedChange",v["bool"])
                                end
                                task.wait(0.35)
                            until game.Players.LocalPlayer.PlayerGui.HUD:WaitForChild("FastForward"):WaitForChild("TextLabel").Text == tostring(v["Value"])
                        elseif i == "Summon" then
                            wait_for(v,val,"new",{["1"] = "Waiting For Wave : "..tostring(v["Wave"]),["2"] = "Waiting For Time : "..tostring(v["Time"]),["3"] = "Waiting For Money : "..tostring(v["Money"]),["4"] = "Action : Summon",["5"] = "Unit : "..tostring(v["Unit"]),["6"] = "Rotation : "..tostring(v["Rotation"]),["7"] = "Unit Index : "..tostring(v["Index"]) })
                            repeat
                                local index = check_index_values(v["Unit"], v["Index"])
                                game:GetService("ReplicatedStorage").Remotes.Input:FireServer("Summon",{
                                    ["Rotation"] = tonumber(v["Rotation"]),
                                    ["cframe"] = stringtocf(v["CFrame"]),
                                    ["Unit"] = v["Unit"],
                                })
                                task.wait()
                                if not index then
                                    current_index(check_its_index(v["Unit"] ),tonumber(v["Index"]))
                                end
                            until index or not Options.Play.Value
                        elseif i == "Upgrade" and check_index_values(v["Unit"], v["Index"]) then
                            if tonumber(check_index_values(v["Unit"], v["Index"]):WaitForChild("UpgradeTag").Value) < tonumber(v["Value"]) then
                            wait_for(v,val,"new",{["1"] = "Waiting For Wave : "..tostring(v["Wave"]),["2"] = "Waiting For Time : "..tostring(v["Time"]),["3"] = "Waiting For Money : "..tostring(v["Money"]),["4"] = "Action : Upgrade",["5"] = "Unit : "..tostring(v["Unit"]),["6"] = "Value : "..tostring(v["Value"] + 1),["7"] = "Unit Index : "..tostring(v["Index"]) })
                            repeat
                                game:GetService("ReplicatedStorage").Remotes.Server:InvokeServer("Upgrade",check_index_values(v["Unit"], v["Index"]))
                                task.wait()
                            until tonumber(check_index_values(v["Unit"], v["Index"]):WaitForChild("UpgradeTag").Value) >= tonumber(v["Value"]) or not Options.Play.Value
                        end
                        elseif i == "ChangePriority" and check_index_values(v["Unit"], v["Index"]) then
                            wait_for(v,val,"new",{["1"] = "Waiting For Wave : "..tostring(v["Wave"]),["2"] = "Waiting For Time : "..tostring(v["Time"]),["3"] = "Action : ChangePriority",["4"] = "Unit : "..tostring(v["Unit"]),["5"] = "Unit Index : "..tostring(v["Index"]) })
                            game:GetService("ReplicatedStorage").Remotes.Input:FireServer("ChangePriority",check_index_values(v["Unit"], v["Index"]))
                        elseif i == "AutoToggle" and check_index_values(v["Unit"], v["Index"]) then
                            wait_for(v,val,"new",{["1"] = "Waiting For Wave : "..tostring(v["Wave"]),["2"] = "Waiting For Time : "..tostring(v["Time"]),["3"] = "Action : AutoToggle",["4"] = "Unit : "..tostring(v["Unit"]),["5"] = "Value : "..tostring(v["Value"]),["6"] = "Unit Index : "..tostring(v["Index"]) })
                            game:GetService("ReplicatedStorage").Remotes.Input:FireServer("AutoToggle",check_index_values(v["Unit"], v["Index"]),v["Value"])
                        elseif i == "UseSpecialMove" and check_index_values(v["Unit"], v["Index"]) then
                            wait_for(v,val,"new",{["1"] = "Waiting For Wave : "..tostring(v["Wave"]),["2"] = "Waiting For Time : "..tostring(v["Time"]),["3"] = "Action : UseSpecialMove",["4"] = "Unit : "..tostring(v["Unit"]),["5"] = "Value : "..tostring(v["Value"]),["6"] = "Unit Index : "..tostring(v["Index"]) })
                            game:GetService("ReplicatedStorage").Remotes.Input:FireServer("UseSpecialMove",check_index_values(v["Unit"], v["Index"]),tostring(v["Value"]))
                        elseif i == "UseMultipleAbilities" and check_index_values(v["Unit"], v["Index"]) then
                            wait_for(v,val,"new",{["1"] = "Waiting For Wave : "..tostring(v["Wave"]),["2"] = "Waiting For Time : "..tostring(v["Time"]),["3"] = "Action : UseMultipleAbilities",["4"] = "Unit : "..tostring(v["Unit"]),["5"] = "Value : "..tostring(v["Value"]),["6"] = "Unit Index : "..tostring(v["Index"]) })
                            repeat
                                if game.Players.LocalPlayer.PlayerGui:FindFirstChild("MultipleAbilities") == nil then
                                    game:GetService("ReplicatedStorage").Remotes.Input:FireServer("UseSpecialMove",check_index_values(v["Unit"], v["Index"]),tostring(v["Value"]))
                                end
                                task.wait()
                            until game.Players.LocalPlayer.PlayerGui:FindFirstChild("MultipleAbilities")
                            game.Players.LocalPlayer.PlayerGui:WaitForChild("MultipleAbilities"):WaitForChild("Frame"):WaitForChild("ImageButton")
                            repeat
                                get_multiple(tostring(v["Value"]))
                                task.wait()
                            until game.Players.LocalPlayer.PlayerGui:FindFirstChild("MultipleAbilities") == nil
                        elseif i == "Sell" and check_index_values(v["Unit"], v["Index"]) then
                            wait_for(v,val,"new",{["1"] = "Waiting For Wave : "..tostring(v["Wave"]),["2"] = "Waiting For Time : "..tostring(v["Time"]),["3"] = "Action : Sell",["4"] = "Unit : "..tostring(v["Unit"]),["5"] = "Unit Index : "..tostring(v["Index"]) })
                            repeat
                                game:GetService("ReplicatedStorage").Remotes.Input:FireServer("Sell",check_index_values(v["Unit"], v["Index"]))
                                task.wait()
                            until not check_index_values(v["Unit"], v["Index"]) or not Options.Play.Value
                        end
                        if val == #getgenv().Playing then
                            Last_action = {
                                ["Action"] = {
                                    ["end"] = {["1"] = "Status Playing Ended ["..tostring(val).."/"..tostring(#getgenv().Playing).."]" }
                                }}
                            end
                        end
                    end
                end))
            end
            if not Options.Play.Value and count ~= 0 and getgenv().Playing ~= nil then
                MacroStatusTExt().Text = "Macro Status [nil]"
                Last_action = {
                    ["Action"] = {
                        ["end"] = {["1"] = "Status Playing Ended ["..tostring(count).."/"..tostring(#getgenv().Playing).."]" }
                    }}
            end
        end)

    repeat task.wait() until #Macro_Files >= 1
    warn("Loaded")
    task.wait(0.55)
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
            if not isfile("/CrazyDay/ASTD/"..game.Players:GetUserIdFromNameAsync(game.Players.LocalPlayer.Name).."/settings/autoload.txt") then
                return Notify("Deleate Failed","not find autoload.txt")
            end
            Notify("Deleate Succeed","autoload.txt")
            delfile("/CrazyDay/ASTD/"..game.Players:GetUserIdFromNameAsync(game.Players.LocalPlayer.Name).."/settings/autoload.txt")
        end})
    Tabs.Settings:AddButton({
        Title = "Delete Select Config List",
        Description = nil,
        Callback = function()
            if SaveManager.Options.SaveManager_ConfigList.Value == nil or not isfile("/CrazyDay/ASTD/"..game.Players:GetUserIdFromNameAsync(game.Players.LocalPlayer.Name).."/settings/"..SaveManager.Options.SaveManager_ConfigList.Value..".json") then
                return Notify("Deleate Failed","make sure you just select the file")
            end
            Notify("Delete Succeed",tostring(SaveManager.Options.SaveManager_ConfigList.Value))
            delfile("/CrazyDay/ASTD/"..game.Players:GetUserIdFromNameAsync(game.Players.LocalPlayer.Name).."/settings/"..SaveManager.Options.SaveManager_ConfigList.Value..".json")
        end})
    Window:SelectTab(1)
    SaveManager:LoadAutoloadConfig()

    end -- End Of Do

    coroutine.resume(coroutine.create(function()
        while wait() do pcall(function()
            if game:WaitForChild("CoreGui"):FindFirstChild("CrazyDay") == nil then
                for i,v in pairs(game:WaitForChild("CoreGui"):GetChildren()) do
                    if v.Name == "ScreenGui" then
                        for i2,v2 in pairs(v:GetDescendants()) do
                            if v2.Name == "TextLabel" and string.find(v2.Text,"All Star Tower") then
                                v2.Parent.Parent.Parent.Parent.Name = "CrazyDay" warn("Found Gui. . .") end
                            end
                        end
                    end
                end
            end)
            if game:WaitForChild("CoreGui"):FindFirstChild("CrazyDay") then
                warn("break")
                break
            end
        end
    end))
    
    coroutine.resume(coroutine.create(function()
        repeat task.wait() until game:WaitForChild("CoreGui"):FindFirstChild("CrazyDay")
        for i,v in pairs(game:WaitForChild("CoreGui"):WaitForChild("CrazyDay"):GetChildren()) do
            if v.Name == "Frame" and i == 2 then
                repeat
                    v.Name = "MainStatus"
                    task.wait(0.25)
                until game:WaitForChild("CoreGui"):WaitForChild("CrazyDay"):FindFirstChild("MainStatus")
            end
        end
    end))

    local function writemacro()
        writefile(string.format("/CrazyDay/ASTD/Macro".."/%s.lua",Options.Current_File.Value), game:GetService("HttpService"):JSONEncode(Macro))
    end


    local l_unit_l
    local count = 0
    local TEXTMULTIPLE
    local speed
    coroutine.resume(coroutine.create(function()
        coroutine.resume(coroutine.create(function()
            game.Workspace.Unit.ChildAdded:Connect(function (v)
                if v:WaitForChild("Owner").Value == game.Players.LocalPlayer then
                    v:WaitForChild("UpgradeTag"):GetPropertyChangedSignal("Value"):Connect(function ()
                        if Options.Record.Value then
                            table.insert(Macro,{
                                ["Upgrade"] = {
                                    ["Wave"] = tostring(Wave()),
                                    ["Time"] = tostring(Time()),
                                    ["Money"] = tostring(getupgradevalues()),
                                    ["Unit"] = tostring(v.Name),
                                    ["Value"] = tostring(v:WaitForChild("UpgradeTag").Value),
                                    ["Index"] = tostring(v:WaitForChild("Index").Value),
                            }
                        })
                        Last_action = {
                            ["Action"] = {
                                ["new"] = {
                                ["1"] = "Wave : "..tostring(Wave()),
                                ["2"] = "Time : "..tostring(Time()),
                                ["3"] = "Money : "..tostring(getupgradevalues()),
                                ["4"] = "Action : Upgrade",
                                ["5"] = "Unit : "..tostring(v.Name),
                                ["6"] = "Value : "..tostring(v:WaitForChild("UpgradeTag").Value + 1),
                                ["7"] = "Unit Index : "..tostring(v:WaitForChild("Index").Value),
                            }}}
                            writemacro()
                        end
                    end)
                end
            end)
        end))
        setreadonly(a,false)
        a.__namecall = newcclosure(function(self,...)
            local arg = {...};
            local method = getnamecallmethod();
            coroutine.resume(coroutine.create(function()
                    if Options.Record.Value then
                        if (method == "FireServer" or "InvokeServer") and (arg[1] == "Summon" or "Upgrade" or "UseSpecialMove" or "AutoToggle" or "Sell" or "SpeedChange" or "ChangePriority" or "VoteWaveConfirm" or "AutoSkipWaves_CHANGE" or "VoteGameMode") then
                            if arg[1] == "Summon" and arg[2] then
                                local action_2 = arg[2]
                                if l_unit_l then
                                    l_unit_l:Disconnect()
                                    l_unit_l = nil
                                end
                                if tonumber(stringofnum(game.Players.LocalPlayer.PlayerGui.HUD.BottomFrame.CurrencyList.Cash.Text:split("$")[2])) >= tonumber(stringofnum(getmoney_units(action_2["Unit"]))) and not l_unit_l then
                                    l_unit_l = game.Workspace.Unit.ChildAdded:Connect(function (v)
                                            if v.Name == action_2["Unit"] and v:WaitForChild("Owner").Value == game.Players.LocalPlayer then
                                                count += 1
                                                    repeat
                                                        if v:FindFirstChild("Index") == nil then
                                                            current_index(v,tonumber(count))
                                                        end
                                                    task.wait()
                                                    until v:FindFirstChild("Index")
                                        table.insert(Macro,{
                                            ["Summon"] = {
                                            ["Wave"] = tostring(Wave()),
                                            ["Time"] = tostring(Time()),
                                            ["Money"] = tostring(getmoney_units(action_2["Unit"])),
                                            ["Rotation"] = tostring(action_2["Rotation"]),
                                            ["CFrame"] = tostring(action_2["cframe"]),
                                            ["Unit"] = tostring(action_2["Unit"]),
                                            ["Index"] = tostring(v:WaitForChild("Index").Value),
                                            }
                                        })
                                        Last_action = {
                                            ["Action"] = {
                                                ["new"] = {
                                                ["1"] = "Wave : "..tostring(Wave()),
                                                ["2"] = "Time : "..tostring(Time()),
                                                ["3"] = "Money : "..tostring(getmoney_units(action_2["Unit"])),
                                                ["4"] = "Action : "..tostring(arg[1]),
                                                ["5"] = "Unit : "..tostring(action_2["Unit"]),
                                                ["6"] = "Rotation : "..tostring(action_2["Rotation"]),
                                                ["7"] = "Unit Index : "..tostring(v:WaitForChild("Index").Value),
                                            }}}
                                            repeat
                                                if l_unit_l then
                                                    l_unit_l:Disconnect()
                                                    l_unit_l = nil
                                                end
                                                task.wait()
                                            until not l_unit_l
                                            writemacro()
                                        end
                                    end)
                                end
                        --end
                    --[[ ใช้ได้ยุ แต่พอ cps มากกว่า 10 แม่ง อัดไม่ทัน
                        elseif arg[1] == "Upgrade" and game.Players.LocalPlayer.PlayerGui.HUD.UpgradeV2.Actions.Upgrade.Amount.Text ~= "Upgrade: MAX" then
                        local action_1 = arg[1]
                        local action_2 = arg[2]
                        -- game.Players.LocalPlayer.PlayerGui.HUD.BottomFrame.CurrencyList.Cash.Text:split("$")[2]
                        if tonumber(stringofnum(game.Players.LocalPlayer.PlayerGui.HUD.BottomFrame.CurrencyList.Cash.Text:split("$")[2])) >= tonumber(stringofnum(getupgradevalues())) and not l_upgrade_l_cd then
                            l_upgrade_l_cd = action_2:WaitForChild("UpgradeTag"):GetPropertyChangedSignal("Value"):Connect(function ()
                                table.insert(Macro,{
                                    ["Upgrade"] = {
                                        ["Wave"] = tostring(Wave()),
                                        ["Time"] = tostring(Time()),
                                        ["Money"] = tostring(getupgradevalues()),
                                        ["Unit"] = tostring(action_2),
                                        ["Value"] = tostring(action_2:WaitForChild("UpgradeTag").Value),
                                        ["Position"] = tostring(action_2:WaitForChild("HumanoidRootPart").Position),
                                }
                            })
                            Last_action = {
                                ["Action"] = {
                                    ["new"] = {
                                    ["1"] = "Wave : "..tostring(Wave()),
                                    ["2"] = "Time : "..tostring(Time()),
                                    ["3"] = "Money : "..tostring(getupgradevalues()),
                                    ["4"] = "Action : "..tostring(action_1),
                                    ["5"] = "Unit : "..tostring(action_2),
                                    ["6"] = "Value : "..tostring(action_2:WaitForChild("UpgradeTag").Value + 1),
                                }}}
                            writemacro()
                        end)
                        end]]
                        elseif arg[1] == "Sell" then
                            local action_1 = arg[1]
                            local action_2 = arg[2]
                                table.insert(Macro,{
                                    ["Sell"] = {
                                        ["Wave"] = tostring(Wave()),
                                        ["Time"] = tostring(Time()),
                                        ["Unit"] = tostring(action_2),
                                        ["Index"] = tostring(action_2:WaitForChild("Index").Value),
                                    }
                                })
                                Last_action = {
                                    ["Action"] = {
                                        ["new"] = {
                                        ["1"] = "Wave : "..tostring(Wave()),
                                        ["2"] = "Time : "..tostring(Time()),
                                        ["3"] = "Action : "..tostring(action_1),
                                        ["4"] = "Unit : "..tostring(action_2),
                                        ["5"] = "Unit Index : "..tostring(action_2:WaitForChild("Index").Value),
                                    }}}
                                    writemacro()
                                elseif arg[1] == "AutoToggle" then
                                    local action_1 = arg[1]
                                    local action_2 = arg[2]
                                    local action_3 = arg[3]
                                    table.insert(Macro,{
                                        ["AutoToggle"] = {
                                            ["Wave"] = tostring(Wave()),
                                            ["Time"] = tostring(Time()),
                                            ["Unit"] = tostring(action_2),
                                            ["Value"] = action_3,
                                            ["Index"] = tostring(action_2:WaitForChild("Index").Value),
                                        }
                                    })
                                    Last_action = {
                                        ["Action"] = {
                                            ["new"] = {
                                            ["1"] = "Wave : "..tostring(Wave()),
                                            ["2"] = "Time : "..tostring(Time()),
                                            ["3"] = "Action : "..tostring(action_1),
                                            ["4"] = "Unit : "..tostring(action_2),
                                            ["5"] = "Value : "..tostring(action_3),
                                            ["6"] = "Unit Index : "..tostring(action_2:WaitForChild("Index").Value),
                                        }}}
                                        writemacro()
                                        task.wait(0.25)
                                    elseif arg[1] == "UseSpecialMove" then
                                        local action_1 = arg[1]
                                        local action_2 = arg[2]
                                        local action_3 = arg[3]
                                        if not action_2:WaitForChild("SpecialMove"):WaitForChild("Special_Enabled2").Value and game.Players.LocalPlayer.PlayerGui.HUD:WaitForChild("UpgradeV2").Visible then
                                            action_1 = arg[1]
                                            action_2 = arg[2]
                                            action_3 = arg[3]
                                            table.insert(Macro,{
                                                ["UseSpecialMove"] = {
                                                    ["Wave"] = tostring(Wave()),
                                                    ["Time"] = tostring(Time()),
                                                    ["Unit"] = tostring(action_2),
                                                    ["Value"] = tostring(action_3),
                                                    ["Index"] = tostring(action_2:WaitForChild("Index").Value),
                                                }
                                            })
                                            Last_action = {
                                                ["Action"] = {
                                                    ["new"] = {
                                                    ["1"] = "Wave : "..tostring(Wave()),
                                                    ["2"] = "Time : "..tostring(Time()),
                                                    ["3"] = "Action : "..tostring(action_1),
                                                    ["4"] = "Unit : "..tostring(action_2),
                                                    ["5"] = "Value : "..tostring(action_3),
                                                    ["6"] = "Unit Index : "..tostring(action_2:WaitForChild("Index").Value),
                                                }}}
                                                writemacro()
                                                task.wait(0.35)
                                            end
                                            coroutine.resume(coroutine.create(function()
                                                if game.Players.LocalPlayer.PlayerGui.HUD:WaitForChild("UpgradeV2").Visible and game.Players.LocalPlayer.PlayerGui.HUD:WaitForChild("UpgradeV2"):WaitForChild("SpecialButton"):WaitForChild("TextLabel").Text == "Multiple Abilities" and Options.Record.Value then
                                                    game.Players.LocalPlayer.PlayerGui:WaitForChild("MultipleAbilities"):WaitForChild("Frame")
                                                    for i,v in pairs(game.Players.LocalPlayer.PlayerGui.MultipleAbilities.Frame:GetChildren()) do
                                                        if v:IsA("ImageButton") and Options.Record.Value then
                                                            TEXTMULTIPLE = v.Activated:Connect(function ()
                                                                table.insert(Macro,{
                                                                    ["UseMultipleAbilities"] = {
                                                                        ["Wave"] = tostring(Wave()),
                                                                        ["Time"] = tostring(Time()),
                                                                        ["Unit"] = tostring(action_2),
                                                                        ["Value"] = tostring(v.TextLabel.Text),
                                                                        ["Index"] = tostring(action_2:WaitForChild("Index").Value),
                                                                    }
                                                                })
                                                                Last_action = {
                                                                    ["Action"] = {
                                                                        ["new"] = {
                                                                        ["1"] = "Wave : "..tostring(Wave()),
                                                                        ["2"] = "Time : "..tostring(Time()),
                                                                        ["3"] = "Action : UseMultipleAbilities",
                                                                        ["4"] = "Unit : "..tostring(action_2),
                                                                        ["5"] = "Value : "..tostring(v.TextLabel.Text),
                                                                        ["6"] = "Unit Index : "..tostring(action_2:WaitForChild("Index").Value),
                                                                    }}}
                                                                    repeat
                                                                        if TEXTMULTIPLE then
                                                                            TEXTMULTIPLE:Disconnect()
                                                                            TEXTMULTIPLE = nil
                                                                        end
                                                                        task.wait()
                                                                    until not TEXTMULTIPLE
                                                                    writemacro()
                                                                end)
                                                            end
                                                        end
                                                    end
                                                end))
                                        elseif arg[1] == "ChangePriority" then
                                            table.insert(Macro,{
                                                ["ChangePriority"] = {
                                                    ["Wave"] = tostring(Wave()),
                                                    ["Time"] = tostring(Time()),
                                                    ["Unit"] = tostring(arg[2]),
                                                    ["Index"] = tostring(arg[2]:WaitForChild("Index").Value),
                                                }
                                            })
                                            Last_action = {
                                                ["Action"] = {
                                                    ["new"] = {
                                                    ["1"] = "Wave : "..tostring(Wave()),
                                                    ["2"] = "Time : "..tostring(Time()),
                                                    ["3"] = "Action : "..tostring(arg[1]),
                                                    ["4"] = "Unit : "..tostring(arg[2]),
                                                    ["5"] = "Unit Index : "..tostring(arg[2]:WaitForChild("Index").Value),
                                                }}}
                                                writemacro()
                                                task.wait(0.1)
                                            elseif arg[1] == "SpeedChange" and not Options.SPEED.Value then
                                                local action_2 = arg[2]
                                                speed = game.Players.LocalPlayer.PlayerGui.HUD:WaitForChild("FastForward"):WaitForChild("TextLabel"):GetPropertyChangedSignal("Text"):Connect(function ()
                                                    table.insert(Macro,{
                                                        ["SpeedChange"] = {
                                                            ["Wave"] = tostring(Wave()),
                                                            ["Time"] = tostring(Time()),
                                                            ["Value"] = tostring(game.Players.LocalPlayer.PlayerGui.HUD:WaitForChild("FastForward"):WaitForChild("TextLabel").Text),
                                                            ["bool"] = action_2,
                                                        }
                                                    })
                                                    Last_action = {
                                                        ["Action"] = {
                                                            ["new"] = {
                                                            ["1"] = "Wave : "..tostring(Wave()),
                                                            ["2"] = "Time : "..tostring(Time()),
                                                            ["3"] = "Action : SpeedChange",
                                                            ["4"] = "Value : "..tostring(game.Players.LocalPlayer.PlayerGui.HUD:WaitForChild("FastForward"):WaitForChild("TextLabel").Text),
                                                            ["5"] = "Bool : "..tostring(action_2),
                                                        }}}
                                                        writemacro()
                                                        if speed or Options.SPEED.Value then
                                                            speed:Disconnect()
                                                            speed = nil
                                                        end
                                                    end)
                                                elseif arg[1] == "VoteWaveConfirm" then
                                                    local action_1 = arg[1]
                                                    if game.Players.LocalPlayer.PlayerGui.HUD.NextWaveVote.Visible then
                                                        table.insert(Macro,{
                                                            ["VoteWaveConfirm"] = {
                                                                ["Wave"] = tostring(Wave()),
                                                                ["Time"] = tostring(Time()),
                                                            }
                                                        })
                                                        Last_action = {
                                                            ["Action"] = {
                                                                ["new"] = {
                                                                ["1"] = "Wave : "..tostring(Wave()),
                                                                ["2"] = "Time : "..tostring(Time()),
                                                                ["3"] = "Action : "..tostring(action_1),
                                                            }}}
                                                            writemacro()
                                                            task.wait(0.15)
                                                        end
                                                    elseif arg[1] == "AutoSkipWaves_CHANGE" then
                                                        local action_1 = arg[1]
                                                        task.wait(0.55)
                                                        table.insert(Macro,{
                                                            ["AutoSkipWaves_CHANGE"] = {
                                                                ["Wave"] = tostring(Wave()),
                                                                ["Time"] = tostring(Time()),
                                                                ["Value"] = tostring(skipwave_value()),
                                                            }
                                                        })
                                                        Last_action = {
                                                            ["Action"] = {
                                                                ["new"] = {
                                                                ["1"] = "Wave : "..tostring(Wave()),
                                                                ["2"] = "Time : "..tostring(Time()),
                                                                ["3"] = "Action : "..tostring(action_1),
                                                                ["4"] = "Value : "..tostring(skipwave_value()),
                                                            }}}
                                                            writemacro()
                                                            task.wait(0.15)
                                                        elseif arg[1] == "VoteGameMode" and not Options.Auto_Vote.Value then
                                                            local action_1 = arg[1]
                                                            local action_2 = arg[2]
                                                            table.insert(Macro,{
                                                                ["VoteGameMode"] = {
                                                                    ["Wave"] = tostring(Wave()),
                                                                    ["Time"] = tostring(Time()),
                                                                    ["Value"] = tostring(action_2),
                                                                }
                                                            })
                                                            Last_action = {
                                                                ["Action"] = {
                                                                    ["new"] = {
                                                                    ["1"] = "Wave : "..tostring(Wave()),
                                                                    ["2"] = "Time : "..tostring(Time()),
                                                                    ["3"] = "Action : "..tostring(action_1),
                                                                    ["4"] = "Value : "..tostring(action_2),
                                                                }}}
                                                                writemacro()
                                                                task.wait(0.15)
                                                            end
                                                        end
                                                    end
                                                end))
                                                return backs(self,...)
                                            end)
                                            setreadonly(a,true)
                                        end))

                                        local function mainstatus(val)
                                            if Options.Record.Value and val == "new" then
                                                return "Status Recording ["..#Macro.."]\n"
                                            elseif Options.Play.Value and val == "new" then
                                                return "Status Playing ["..current_val.."/"..#getgenv().Playing.."]\n"
                                            end
                                        end

                                        coroutine.resume(coroutine.create(function()
                                            while wait() do
                                                if game:GetService("ReplicatedStorage").Lobby.Value then return end
                                                if game:WaitForChild("CoreGui"):FindFirstChild("CrazyDay") then
                                                    for i,v in pairs(Last_action["Action"]) do
                                                    if i == "Default" then
                                                        Get_Paragrahp().Text = "Status nil [0]\nCurrent Time : "..tostring(Time())
                                                    end
                                                    if i == "end" then
                                                        Get_Paragrahp().Text =v["1"].."\nCurrent Time : "..tostring(Time())
                                                    else
                                                    if i == "new" and v["3"] and not v["4"] and (Options.Record.Value or Options.Play.Value )then
                                                        Get_Paragrahp().Text = mainstatus(i)..v["1"].."\n"..v["2"].."\n"..v["3"].."\nCurrent Time : "..tostring(Time())
                                                    elseif i =="new" and v["4"] and not v["5"] and (Options.Record.Value or Options.Play.Value )then
                                                        Get_Paragrahp().Text = mainstatus(i)..v["1"].."\n"..v["2"].."\n"..v["3"].."\n"..v["4"].."\nCurrent Time : "..tostring(Time())
                                                    elseif i =="new" and v["5"] and not v["6"] and (Options.Record.Value or Options.Play.Value )then
                                                        Get_Paragrahp().Text = mainstatus(i)..v["1"].."\n"..v["2"].."\n"..v["3"].."\n"..v["4"].."\n"..v["5"].."\nCurrent Time : "..tostring(Time())
                                                    elseif i =="new" and v["6"] and not v["7"] and (Options.Record.Value or Options.Play.Value )then
                                                        Get_Paragrahp().Text = mainstatus(i)..v["1"].."\n"..v["2"].."\n"..v["3"].."\n"..v["4"].."\n"..v["5"].."\n"..v["6"].."\nCurrent Time : "..tostring(Time())
                                                    elseif i =="new" and v["7"] and not v["8"] and (Options.Record.Value or Options.Play.Value )then
                                                        Get_Paragrahp().Text = mainstatus(i)..v["1"].."\n"..v["2"].."\n"..v["3"].."\n"..v["4"].."\n"..v["5"].."\n"..v["6"].."\n"..v["7"].."\nCurrent Time : "..tostring(Time())
                                                    end
                                                    end
                                                    end
                                                end
                                            end
                                        end))

                                        coroutine.resume(coroutine.create(function()
                                            while wait() do pcall(function ()
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

                                    local function check_for_start()
                                        if game.Players.LocalPlayer.PlayerGui.HUD.Start.Visible or game.Players.LocalPlayer.PlayerGui.HUD.MissionsV2.Visible then
                                            return true
                                        else
                                            return false
                                        end
                                    end

                                    local function get_stage()
                                        if Options.Select_Mode.Value ~= "Story" then return end
                                        local tonumber = tonumber(Options.Story_Map.Value:split(".")[1])
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

                                local function startbutton()
                                    if Options.Select_Mode.Value ~= "Story" or not check_for_start() then return end
                                    if game.Players.LocalPlayer.PlayerGui.HUD.MissionsV2.MissionFrame.Visible then
                                        task.wait(2)
                                        for i,v in pairs(game.Players.LocalPlayer.PlayerGui.HUD.MissionsV2.MissionFrame:GetChildren()) do
                                            if v:IsA("Frame") and v.Name ~= "Friends" then
                                                firesignal(v:FindFirstChild("Main"):FindFirstChild("Options"):FindFirstChild("PlayButton").MouseButton1Click,game.Players.LocalPlayer)
                                            end
                                        end
                                    end
                                end

                                local function getmap()
                                    if not check_for_start() or game.Players.LocalPlayer.PlayerGui.HUD.Start.Visible then return end
                                    task.wait(1.5)
                                    for i,v in pairs(game.Players.LocalPlayer.PlayerGui.HUD.MissionsV2.MissionChooser.Main:GetDescendants()) do
                                        if v:FindFirstChild("MissionTitle") and v:FindFirstChild("FG") and v:FindFirstChild("MissionClick") then
                                            if string.find(v.MissionTitle.Text,Options.Story_Map.Value) and Options.Select_Mode.Value == "Story" then
                                                game:GetService("ReplicatedStorage").Remotes.Input:FireServer(RoomName.."Level",tostring(get_stage()),true)
                                            elseif string.find(v.MissionTitle.Text,Options.Infinite_Map.Value) and Options.Select_Mode.Value == "Infinity" then
                                                game:GetService("ReplicatedStorage").Remotes.Input:FireServer(RoomName.."Level",tostring(v),true)
                                            elseif Options.Select_Mode.Value == "Challenge" or Options.Select_Mode.Value == "Adventures" and (string.find(v.MissionTitle.Text,Options.Challenge_Map.Value) or string.find(v.MissionTitle.Text,Options.Adventures_Map.Value))  then
                                                game:GetService("ReplicatedStorage").Remotes.Input:FireServer(RoomName.."Level",tostring(v),true)
                                            end
                                        end
                                    end
                                end

                                bv.MaxForce = Vector3.new(100000,100000,100000)
                                bv.Velocity = Vector3.new(0,0,0)
                                coroutine.resume(coroutine.create(function()
                                    while wait() do
                                        if not Options.Auto_Lobby.Value or not game:GetService("ReplicatedStorage").Lobby.Value then
                                        else
                                            if game.Players.LocalPlayer.PlayerGui.HUD.Start.Visible then
                                                firesignal(game.Players.LocalPlayer.PlayerGui.HUD.Start.MouseButton1Click,game.Players.LocalPlayer)
                                            end
                                            if not check_for_start() and  not getgenv().STOP_TP then
                                                plr:WaitForChild("HumanoidRootPart").CFrame = get_the_cframeofdoor()
                                                bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                                                game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
                                            elseif check_for_start()  then
                                                getgenv().STOP_TP = true
                                                plr:WaitForChild("HumanoidRootPart").CFrame = CF()
                                                getmap()
                                                startbutton()
                                            end
                                        end
                                        if not Options.Auto_Lobby.Value and game.Players.LocalPlayer.Character.Humanoid.PlatformStand then
                                            game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                                            bv.Parent = nil
                                        end
                                    end
                                end))

                                coroutine.resume(coroutine.create(function()
                                    while wait() do pcall(function ()
                                        if Options.AutoCliamReward.Value and game:GetService("ReplicatedStorage").Lobby.Value then
                                            if game.Players.LocalPlayer.PlayerGui:WaitForChild("HUD"):WaitForChild("LeftButton"):WaitForChild("TaskButton"):WaitForChild("ImageLabel").Visible then
                                                if not game.Players.LocalPlayer.PlayerGui.HUD.TasksV2.Visible and not check_for_start() then
                                                    repeat
                                                        VisibleForCodex(false)
                                                        VisibleForTrigon(false)
                                                        Task = game.Players.LocalPlayer.PlayerGui.HUD.LeftButton.TaskButton
                                                        game:GetService("VirtualInputManager"):SendMouseButtonEvent(Task.AbsolutePosition.X + 27.5, Task.AbsolutePosition.Y + 50, 0, not game.UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1), game, 0)
                                                        VisibleForCodex(false)
                                                        VisibleForTrigon(false)
                                                        task.wait(0.3)
                                                    until game.Players.LocalPlayer.PlayerGui.HUD.TasksV2.Visible or check_for_start()
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
                                                    until not game.Players.LocalPlayer.PlayerGui:WaitForChild("HUD"):WaitForChild("LeftButton"):WaitForChild("TaskButton"):WaitForChild("ImageLabel").Visible or check_for_start()
                                                end
                                            end
                                            if not game.Players.LocalPlayer.PlayerGui:WaitForChild("HUD"):WaitForChild("LeftButton"):WaitForChild("TaskButton"):WaitForChild("ImageLabel").Visible and game.Players.LocalPlayer.PlayerGui.HUD.TasksV2.Visible and not check_for_start() then
                                                Task = game.Players.LocalPlayer.PlayerGui.HUD.LeftButton.TaskButton
                                                repeat
                                                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(Task.AbsolutePosition.X + 27.5, Task.AbsolutePosition.Y + 50, 0, not game.UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1), game, 0)
                                                    task.wait(0.3)
                                                until not game.Players.LocalPlayer.PlayerGui.HUD.TasksV2.Visible or check_for_start()
                                                VisibleForCodex(true)
                                                VisibleForTrigon(true)
                                            end
                                        end
                                    end)
                                end
                            end))

                            coroutine.resume(coroutine.create(function()
                                game.Players.LocalPlayer.PlayerGui.HUD.MissionEnd:GetPropertyChangedSignal('Visible'):Connect(function ()
                                    repeat wait(0.25) until Options.Replay_Return_Next.Value
                                    if Options.Replay_Return_Next.Value then
                                        repeat wait(0.15)
                                            firesignal(game.Players.LocalPlayer.PlayerGui.HUD.MissionEnd.BG.Actions[Options.Ended_Action.Value].Activated,game.Players.LocalPlayer)
                                        until not game.Players.LocalPlayer.PlayerGui.HUD.MissionEnd.Visible or not Options.Replay_Return_Next.Value
                                    end
                                end)
                            end))

                            local function excutescript()
                                local QueueOnTeleport = queue_on_teleport or queueonteleport or (syn and syn.queue_on_teleport)
                                QueueOnTeleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Mangadexwannatest/CanislupusXHUB/main/All_Start_Tower_Defense.lua'))()")
                            end

                            coroutine.resume(coroutine.create(function()
                                game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(Kick)
                                    if ((Kick.Name == "ErrorPrompt") and Kick:FindFirstChild("MessageArea") and Kick.MessageArea:FindFirstChild("ErrorFrame")) then
                                        repeat wait() until Options.AutoRejoinError.Value
                                        task.wait(2.5)
                                        game:GetService("TeleportService"):Teleport(gameidtp)
                                    end
                                end)
                            end))

                            coroutine.resume(coroutine.create(function()
                            repeat wait() until game:IsLoaded()
                            game:WaitForChild("CoreGui"):WaitForChild("CrazyDay")
                            repeat wait() until game.CoreGui:FindFirstChild("CrazyDay")
                            repeat wait() until Options.AutoCloseAfterExecute.Value
                            game.CoreGui.CrazyDay:FindFirstChild("MainStatus").Visible = false
                        end))

                        coroutine.resume(coroutine.create(function()
                            game.Players.LocalPlayer.OnTeleport:Connect(function(state)
                                getgenv().OnTeleport = true
                                if state == Enum.TeleportState.InProgress and Options.AutoExecuteScript.Value then
                                    excutescript()
                                end
                            end)
                        end))

                        local function unload_ui()
                            while wait() do
                                if Fluent.Unloaded then
                                    game:WaitForChild("CoreGui"):FindFirstChild("Close/Open"):Destroy()
                                    break
                                end
                            end
                        end
                        coroutine.resume(coroutine.create(unload_ui))

                    end
                task.wait(0.75)
            until game:WaitForChild("CoreGui"):FindFirstChild("CrazyDay")
