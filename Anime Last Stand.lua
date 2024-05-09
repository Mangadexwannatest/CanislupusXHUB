repeat task.wait() until game:IsLoaded()
repeat wait()until game:GetService("Players").LocalPlayer ~= nil
if not game:GetService("Players").LocalPlayer.Character then game:GetService("Players").LocalPlayer.CharacterAdded:Wait()wait()end
if game:WaitForChild("CoreGui"):FindFirstChild("CrazyDay") then return end

if game:WaitForChild("CoreGui"):FindFirstChild("CrazyDay") == nil then
    repeat
        if game:WaitForChild("CoreGui"):FindFirstChild("CrazyDay") then return end
        if game:WaitForChild("CoreGui"):FindFirstChild("CrazyDay") == nil then
            warn("Loading Gui. . .")

        spawn(function ()
                while wait() do pcall(function()
                    if game:WaitForChild("CoreGui"):FindFirstChild("CrazyDay") == nil then
                        for i,v in pairs(game:WaitForChild("CoreGui"):GetChildren()) do
                        if v.Name == "ScreenGui" then
                            for i2,v2 in pairs(v:GetDescendants()) do
                            if v2.Name == "TextLabel" and string.find(v2.Text,"Anime Last Stand") then
                                v2.Parent.Parent.Parent.Parent.Name = "CrazyDay"
                                warn("Found Gui. . .")
                            end
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
    end)

    spawn(function ()
        repeat task.wait() until game:WaitForChild("CoreGui"):FindFirstChild("CrazyDay")
        for i,v in pairs(game:WaitForChild("CoreGui"):FindFirstChild("CrazyDay"):GetChildren()) do
            if v.Name == "Frame" and i == 2 then
                repeat
                    v.Name = "MainStatus"
                    task.wait(0.25)
                until game:WaitForChild("CoreGui"):WaitForChild("CrazyDay"):FindFirstChild("MainStatus")
            end
        end
    end)

    spawn(function ()
        if not game:WaitForChild("CoreGui"):FindFirstChild("Close/Open") then
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
    
    spawn(function ()
        local Button = game.CoreGui:FindFirstChild("Close/Open"):FindFirstChild("TextButton")
        Button.InputBegan:Connect(function(input)
            if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
        game.CoreGui.CrazyDay:FindFirstChild("MainStatus").Visible = not game.CoreGui.CrazyDay:FindFirstChild("MainStatus").Visible
        end
    end)
    end)

    local firesignal = function(signal, arg2)
        if getconnections(signal) then
            firesignal(signal, arg2)
        end
    end

    local function stringtocf(str)
        return CFrame.new(table.unpack(str:gsub(" ", ""):split(",")))
    end
    local function stringtopos(str)
        return Vector3.new(table.unpack(str:gsub(" ", ""):split(",")))
    end

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

    local function VisibleForCodex(value)
        if game:GetService("CoreGui"):FindFirstChild("Codex") then
            game:GetService("CoreGui"):FindFirstChild("Codex"):WaitForChild("gui").Enabled = value
        end
    end

    local function VisibleGui(value)
        game.CoreGui.CrazyDay:FindFirstChild("MainStatus").Visible = value
    end

    local function VisibleForTrigon(value)
        for i,v in pairs(game:GetService("CoreGui"):GetDescendants()) do
            if v.Name == "ExecFrame" and v.Parent.Name == "MainFrame" then
                v.Parent.Parent.Enabled = value
            end
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

	local function Wave()
        return game:GetService("ReplicatedStorage").Wave.Value
    end


    local function Time()
        return workspace.DistributedGameTime
    end

    local function Money()
        return game.Players.LocalPlayer.Cash.Value
    end
    local current_cframe
    local function get_the_cframe()
        return CFrame.new(table.unpack(current_cframe:gsub(" ", ""):split(",")))
    end
    local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
    local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
    local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

    local Window = Fluent:CreateWindow({
        Title = "Anime Last Stand",
        SubTitle = "Last Update May/07/2024 [YT:CrazyDay/edek#1004]",
        TabWidth = 160,
        Size = UDim2.fromOffset(580, 460),
        Acrylic = true,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.LeftControl
    })
    local Tabs = {
        Main = Window:AddTab({ Title = "Main", Icon = "" }),
        Lobby = Window:AddTab({Title = "Lobby",Icon = ""}),
        Other = Window:AddTab({ Title = "Other" , Icon = ""}),
        Settings = Window:AddTab({ Title = "Settings", Icon = "" })
    }

    local Options = Fluent.Options
    local Macro_Files = {}
    local Macro = {}
    local current_action = {["Action"] = {["nil"] = {
        ["1"] = nil
    }}}
    local currentval = 0
    local IngoreTimeIF = {}

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
            for i,v in pairs(listfiles("/CrazyDay/ALS/Macro")) do
                table.insert(Macro_Files,v:split("/")[5]:split(".lua")[1])
            end
        end

        if not isfolder("CrazyDay") then 
        repeat wait()
            makefolder("CrazyDay")
        until isfolder("CrazyDay")
        warn('make folder 1')
        end
        if isfolder("CrazyDay") then
            if not isfolder("CrazyDay/ALS") then
                repeat wait()
                makefolder("/CrazyDay/ALS")
            until isfolder("CrazyDay/ALS")
            warn('make folder 2')
            end
        end

    if not isfolder("/CrazyDay/ALS/Macro") then
        repeat
        makefolder("/CrazyDay/ALS/Macro")
        task.wait(0.35)
        until isfolder("/CrazyDay/ALS/Macro")
    end
    if isfolder("/CrazyDay/ALS/Macro") then
        if not isfile("/CrazyDay/ALS/Macro/Crazy Day.lua") then
            writefile("/CrazyDay/ALS/Macro/Crazy Day.lua", game:GetService("HttpService"):JSONEncode({}))
        end
    end

    for i,v in pairs(listfiles("/CrazyDay/ALS/Macro")) do
        table.insert(Macro_Files,v:split("/")[5]:split(".lua")[1])
    end
    repeat task.wait() until #Macro_Files >= 1
    Tabs.Main:AddParagraph({Title = "Macro Status",Content = "nil [0]"})
    local CurrentFiles = Tabs.Main:AddDropdown("Current_File", {
        Title = "Select File",
        Values = Macro_Files,
        Multi = false,
        Default = 1,
    })
    local ignoretime = Tabs.Main:AddDropdown("ignoretime", {
        Title = "Ignore time / wave if",
        Values = {"Money Reach"},
        Multi = true,
        Default = {nil},
    })

    ignoretime:OnChanged(function (Value)
        IngoreTimeIF = {}
        for Value, State in next, Value do
            table.insert(IngoreTimeIF, Value)
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
            writefile(string.format("/CrazyDay/ALS/Macro".."/%s.lua", bool)	, "")
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
            if Options.Current_File.Value == nil or not isfile(string.format("/CrazyDay/ALS/Macro/".."%s.lua",Options.Current_File.Value)) then
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
                            delfile(string.format("/CrazyDay/ALS/Macro/".."%s.lua",Options.Current_File.Value))
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
            if Options.Current_File.Value == nil or not isfile(string.format("/CrazyDay/ALS/Macro/".."%s.lua",Options.Current_File.Value)) then
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
                            writefile(string.format("/CrazyDay/ALS/Macro".."/%s.lua",Options.Current_File.Value), game:GetService("HttpService"):JSONEncode({}))
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

    local RecordToggle = Tabs.Main:AddToggle("Record", {Title = "Macro Record", Default = false })
    local PlayToggle = Tabs.Main:AddToggle("Play", {Title = "Macro Play", Default = false })

    RecordToggle:OnChanged(function ()
        if Options.Record.Value and Options.Play.Value then
            Options.Record:SetValue(false)
            Options.Play:SetValue(false)
            return Notify("Error","dont enable record / play macro together")
        end
    end)

    local currentmode = Tabs.Lobby:AddDropdown("Select_Mode", {
        Title = "Select Type",
        Description = nil,
        Values = {"Story","Challenge","Infinite","Raids"},
        Multi = false,
        Default = 1
    })

    Tabs.Lobby:AddToggle("AutoJoinLobby", {Title = "Auto Join Lobby ", Default = false })

    local function currentmodevalues()
        if game.PlaceId ~= 12886143095 then
            return
        end
        for i,v in pairs(game:GetService("Workspace").TeleporterFolder[Options.Select_Mode.Value]:GetChildren()) do
            if v.Name == "Teleporter" then
                if tostring(v:WaitForChild("Door"):WaitForChild("UI"):WaitForChild("PlayerCount").Text) == "0/4" then
                    return v:WaitForChild("Door")
                end
            end
        end
    end

    Tabs.Lobby:AddDropdown("Mains_MAP", {
        Title = "Select Main",
        Description = "select the map for (story // challenge // infinite)",
        Values = {"Desert Village","Water Part","Hollow Dimension","Planet Nemak","Star Mansion","Super Hero City","Hero Association"},
        Multi = false,
        Default = 1
    })

    Tabs.Lobby:AddDropdown("Raid_MAP", {
        Title = "Select Raid",
        Description = nil,
        Values = {"Marines Fort","Hell City"},
        Multi = false,
        Default = 1
    })

    Tabs.Lobby:AddDropdown("Select_Stage", {
        Title = "Select Stage",
        Description = nil,
        Values = {1,2,3,4,5,6},
        Multi = false,
        Default = 1
    })
    Tabs.Lobby:AddDropdown("ModeType", {
        Title = "Select Mode",
        Description = nil,
        Values = {"Normal","Nightmare"},
        Multi = false,
        Default = 1
    })

    local otherlobby = Tabs.Lobby:AddSection("Other")

    otherlobby:AddDropdown("ActionMissionEnd", {
        Title = "Select Action",
        Description = nil,
        Values = {"Leave","Retry","Next"},
        Multi = false,
        Default = 1
    })

    otherlobby:AddToggle("AutoMissionEnd", {Title = "Auto Leave // Retry // Next ", Default = false })


    currentmode:OnChanged(function (Value)
        if game.PlaceId ~= 12886143095 then return end
        if Value == "Raids" then
            current_cframe = tostring(currentmodevalues().CFrame)
        elseif Value == ("Story" or "Challenge" or "Infinite") then
            current_cframe = tostring(currentmodevalues().CFrame)
        end
    end)
    task.spawn(function ()
        while wait(1) do
            if game.PlaceId ~= 12886143095 then return end
            if Options.AutoJoinLobby.Value then
                if not game.Players.LocalPlayer.PlayerGui:FindFirstChild("MapSelection") and not game.Players.LocalPlayer.PlayerGui:FindFirstChild("TeleportUI") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = get_the_cframe()
                end
                if game.Players.LocalPlayer.PlayerGui:FindFirstChild("MapSelection") and not game.Players.LocalPlayer.PlayerGui:FindFirstChild("TeleportUI") then
                    if Options.Select_Mode.Value == "Raids" then
                        game:GetService("ReplicatedStorage").Remotes.Teleporter.MapSelect:InvokeServer("Ready",tostring(Options.Raid_MAP.Value),tonumber(Options.Select_Stage.Value))
                    else
                        game:GetService("ReplicatedStorage").Remotes.Teleporter.MapSelect:InvokeServer("Ready",tostring(Options.Mains_MAP.Value),tonumber(Options.Select_Stage.Value),Options.ModeType.Value)
                    end
                elseif game.Players.LocalPlayer.PlayerGui:FindFirstChild("TeleportUI") then
                    game:GetService("ReplicatedStorage").Remotes.Teleporter.Interact:FireServer("Skip")
                end
            end
        end
    end)

    Tabs.Other:AddToggle("AutoRejoinError", {Title = "Auto Rejoin When Disconnect ", Default = false })
    local white = Tabs.Other:AddToggle("AutoWhiteScreen", {Title = "Auto White Screen", Default = false })
    Tabs.Other:AddToggle("AutoCloseAfterExecute", {Title = "Auto Close Gui After Execute", Default = false })
    Tabs.Other:AddToggle("AutoExecuteScript", {Title = "Auto Execute Script", Default = false })
    Tabs.Other:AddButton({
        Title = "Teleport Lobby",
        Description = nil,
        Callback = function()
            game:GetService("TeleportService"):Teleport(12886143095)
        end
    })
    local UpdateLog = Tabs.Other:AddSection("Update Log")
    UpdateLog:AddParagraph({
        Title = "Last Update May/3/2024 [10:55 UTC + 07:00]",
        Content = ""
    })

    white:OnChanged(function()
        if Options.AutoWhiteScreen.Value then
            game:GetService("RunService"):Set3dRenderingEnabled(false)
        else
            game:GetService("RunService"):Set3dRenderingEnabled(true)
        end
    end)

    local function check_unit(Unit, Position)
        if game.PlaceId == 12886143095 then return end
        if type(Position) == "string" then
            Position = stringtopos(Position)
        end
        for i, v in pairs(game.Workspace.Towers:GetChildren()) do
            if v.Name == Unit and v:WaitForChild("Owner").Value == game.Players.LocalPlayer then
            if v.HumanoidRootPart.Position == Position or (v.HumanoidRootPart.Position - Position).magnitude < 2 then
                return v
                end
            end
        end
    end

    local function wait_for(number,val1,val2,val3)
        currentval = number
        current_action = {["Action"] = {
            [val2] = val3
        }}
        if not table.find(IngoreTimeIF,"Money Reach") then
        repeat task.wait() until tonumber(Wave()) >= tonumber(val1["Wave"]) or table.find(IngoreTimeIF,"Money Reach")

        elseif table.find(IngoreTimeIF,"Money Reach") then
            if val1["Money"] then
                repeat task.wait() until tonumber(Wave()) >= tonumber(val1["Wave"]) or tonumber(Money()) >= tonumber(stringofnum(val1["Money"]))
            elseif not val1["Money"] then
                repeat task.wait() until tonumber(Wave()) >= tonumber(val1["Wave"])
            end
        end

        if not table.find(IngoreTimeIF,"Money Reach") then
        repeat task.wait() until tonumber(Time()) >= tonumber(val1["Time"]) or table.find(IngoreTimeIF,"Money Reach")

        elseif table.find(IngoreTimeIF,"Money Reach") then
            if val1["Money"] then
        repeat task.wait() until tonumber(Time()) >= tonumber(val1["Time"]) or tonumber(Money()) >= tonumber(stringofnum(val1["Money"]))
            elseif not val1["Money"] then
                repeat task.wait() until tonumber(Time()) >= tonumber(val1["Time"])
            end
        end

        if val1["Money"] then
            repeat task.wait() until tonumber(Money()) >= tonumber(stringofnum(val1["Money"]))
        end
    end


    PlayToggle:OnChanged(function ()
        if game.PlaceId == 12886143095 then return end
        if Options.Play.Value then
            for i,v in pairs(listfiles("/CrazyDay/ALS/Macro")) do
                if string.split(v,"/")[5]:split(".lua")[1] == Options.Current_File.Value then
                    local File = readfile(string.format("/CrazyDay/ALS/Macro".."/%s.lua",string.split(v,"/")[5]:split(".lua")[1]))
                    getgenv().Playing = game:GetService("HttpService"):JSONDecode(File)
                end
            end
            task.spawn(function ()
                for val = 1,#getgenv().Playing do
                    for i,v in pairs(getgenv().Playing[val]) do
                        if not Options.Play.Value or game.PlaceId == 12886143095 then return end
                        local AutoSkilValue = game.Players.LocalPlayer.PlayerGui:WaitForChild("Settings"):WaitForChild("AutoSkip")
                        if i == "AutoSkip" and AutoSkilValue.Value ~= v["Value"] then
                            wait_for(val,v,"new",{["1"] = "Waiting For Wave : "..tostring(v["Wave"]),["2"] = "Waiting For Time : "..tostring(v["Time"]),["3"] = "Action : AutoSkip",["4"] = "Value : "..tostring(v["Value"])})
                                repeat
                                    local AutoSKipButton = game.Players.LocalPlayer.PlayerGui:WaitForChild("TopbarPlus"):WaitForChild("TopbarContainer"):WaitForChild("UnnamedIcon"):WaitForChild("DropdownContainer"):WaitForChild("DropdownFrame"):WaitForChild("AutoSkip"):WaitForChild("IconButton")
                                    firesignal(AutoSKipButton.MouseButton1Click,game.Players.LocalPlayer)
                                    task.wait(0.35)
                                until AutoSkilValue.Value == v["Value"]
                        elseif i == "VoteSkip" and not AutoSkilValue.Value and tonumber(Wave()) <= tonumber(v["Wave"]) then
                            wait_for(val,v,"new",{["1"] = "Waiting For Wave : "..tostring(v["Wave"]),["2"] = "Waiting For Time : "..tostring(v["Time"]),["3"] = "Action : VoteSkip"})
                            repeat task.wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("SkipWave") or tonumber(Wave()) > tonumber(v["Wave"])
                            task.wait(1)
                            game:GetService("ReplicatedStorage").Remotes.VoteSkip:FireServer()
                        elseif i == "PlaceTower" and not check_unit(v["Unit"], v["Position"]) then
                            wait_for(val,v,"new",{["1"] = "Waiting For Wave : "..tostring(v["Wave"]),["2"] = "Waiting For Time : "..tostring(v["Time"]),["3"] = "Waiting For Money : "..tostring(v["Money"]),["4"] = "Action : PlaceTower",["5"] = "Unit : "..tostring(v["Unit"])})
                            repeat
                                game:GetService("ReplicatedStorage").Remotes.PlaceTower:FireServer(v["Unit"],stringtocf(v["Position"]))
                                task.wait(0.25)
                            until check_unit(v["Unit"], v["Position"])
                        elseif i == "Upgrade" and check_unit(v["Unit"], v["Position"]) then
                            wait_for(val,v,"new",{["1"] = "Waiting For Wave : "..tostring(v["Wave"]),["2"] = "Waiting For Time : "..tostring(v["Time"]),["3"] = "Waiting For Money : "..tostring(v["Money"]),["4"] = "Action : Upgrade",["5"] = "Unit : "..tostring(v["Unit"]),["6"] = "Value : "..tostring(v["Value"]) })
                            repeat
                            game:GetService("ReplicatedStorage").Remotes.Upgrade:InvokeServer(check_unit(v["Unit"], v["Position"]))
                            task.wait(0.25)
                            until tonumber(check_unit(v["Unit"], v["Position"]):WaitForChild("Upgrade").Value) >= tonumber(v["Value"])
                        elseif i == "Sell" and check_unit(v["Unit"], v["Position"]) then
                            wait_for(val,v,"new",{["1"] = "Waiting For Wave : "..tostring(v["Wave"]),["2"] = "Waiting For Time : "..tostring(v["Time"]),["3"] = "Action : Sell",["4"] = "Unit : "..tostring(v["Unit"]) })
                            repeat
                                game:GetService("ReplicatedStorage").Remotes.Sell:InvokeServer(check_unit(v["Unit"],v["Position"]))
                                task.wait(0.25)
                            until not check_unit(v["Unit"], v["Position"])
                        elseif i == "Target" and check_unit(v["Unit"], v["Position"]) then
                            wait_for(val,v,"new",{["1"] = "Waiting For Wave : "..tostring(v["Wave"]),["2"] = "Waiting For Time : "..tostring(v["Time"]),["3"] = "Action : Target",["4"] = "Unit : "..tostring(v["Unit"]),["5"] = "Value : "..tostring(v["Value"]) })
                            repeat
                                game:GetService("ReplicatedStorage").Remotes.ChangeTargeting:InvokeServer(check_unit(v["Unit"], v["Position"]))
                                task.wait(0.25)
                            until tostring(check_unit(v["Unit"], v["Position"]):WaitForChild("Targeting").Value) == tostring(v["Value"])
                        elseif i == "Ability" and check_unit(v["Unit"], v["Position"]) then
                            wait_for(val,v,"new",{["1"] = "Waiting For Wave : "..tostring(v["Wave"]),["2"] = "Waiting For Time : "..tostring(v["Time"]),["3"] = "Action : Ability",["4"] = "Unit : "..tostring(v["Unit"]) })
                            game:GetService("ReplicatedStorage").Remotes.Ability:InvokeServer(check_unit(v["Unit"], v["Position"]))
                        end
                    end
                end
            end)
        end
    end)


    repeat task.wait() until #Macro_Files >= 1
    warn("Loaded")
    task.wait(0.55)
    SaveManager:SetLibrary(Fluent)
    InterfaceManager:SetLibrary(Fluent)
    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({})
    InterfaceManager:SetFolder("/CrazyDay/ALS/"..game.Players:GetUserIdFromNameAsync(game.Players.LocalPlayer.Name))
    SaveManager:SetFolder("/CrazyDay/ALS/"..game.Players:GetUserIdFromNameAsync(game.Players.LocalPlayer.Name))
    InterfaceManager:BuildInterfaceSection(Tabs.Settings)
    SaveManager:BuildConfigSection(Tabs.Settings)
    Tabs.Settings:AddButton({
        Title = "Delete Autoload file",
        Description = nil,
        Callback = function()
            if not isfile("/CrazyDay/ALS/"..game.Players:GetUserIdFromNameAsync(game.Players.LocalPlayer.Name).."/settings/autoload.txt") then
                return Notify("Deleate Failed","not find autoload.txt")
            end
            Notify("Deleate Succeed","autoload.txt")
            delfile("/CrazyDay/ALS/"..game.Players:GetUserIdFromNameAsync(game.Players.LocalPlayer.Name).."/settings/autoload.txt")
        end})
    Tabs.Settings:AddButton({
        Title = "Delete Select Config List",
        Description = nil,
        Callback = function()
            if SaveManager.Options.SaveManager_ConfigList.Value == nil or not isfile("/CrazyDay/ALS/"..game.Players:GetUserIdFromNameAsync(game.Players.LocalPlayer.Name).."/settings/"..SaveManager.Options.SaveManager_ConfigList.Value..".json") then
                return Notify("Deleate Failed","make sure you just select the file")
            end
            Notify("Delete Succeed",tostring(SaveManager.Options.SaveManager_ConfigList.Value))
            delfile("/CrazyDay/ALS/"..game.Players:GetUserIdFromNameAsync(game.Players.LocalPlayer.Name).."/settings/"..SaveManager.Options.SaveManager_ConfigList.Value..".json")
        end})
    Window:SelectTab(1)
    SaveManager:LoadAutoloadConfig()

    end -- End Of Do

    local function writemacro()
        writefile(string.format("/CrazyDay/ALS/Macro".."/%s.lua",Options.Current_File.Value), game:GetService("HttpService"):JSONEncode(Macro))
    end

    local function set_grap(val1,val2)
        current_action = {["Action"] = {
            [val1] = val2
        }}
    end

    local money
    task.spawn(function ()
        if game.PlaceId == 12886143095 then return end
        task.spawn(function ()
            game.Players.LocalPlayer.PlayerGui.ChildAdded:Connect(function(v)
                if v.Name == "Upgrade" and Options.Record.Value then
                    if tonumber(v:WaitForChild("BG"):WaitForChild("Buttons"):WaitForChild("Ability"):WaitForChild("TextLabel").Text) == nil then
                        getgenv().incool_down = false
                    else
                        getgenv().incool_down = true
                    end
                    repeat task.wait() until not v.Parent or not Options.Record.Value
                    getgenv().incool_down = false
                end
            end)
        end)
        game.Players.LocalPlayer.PlayerGui:WaitForChild("MainUI"):WaitForChild("ErrorHolder").ChildAdded:Connect(function (v)
            if string.find(v.Text,"-") then
                money = v.Text:split("-$")[2]
                end
            end)
        game.workspace.Towers.ChildAdded:Connect(function (v)
        if Options.Record.Value then
            if v:WaitForChild("Owner").Value == game.Players.LocalPlayer then
                table.insert(Macro,{
                    ["PlaceTower"] = {
                        ["Wave"] = tostring(Wave()),
                        ["Time"] = tostring(Time()),
                        ["Money"] = tostring(money),
                        ["Unit"] = tostring(v.Name),
                        ["Position"] = tostring(v:WaitForChild("HumanoidRootPart").Position),
                    }})
                    set_grap("new",{["1"] = "Wave : "..tostring(Wave()),["2"] = "Time : "..tostring(Time()),["3"] = "Money : "..tostring(money),["4"] = "Action : PlaceTower",["5"] = "Unit : "..tostring(v.Name)})
                    writemacro()
            task.spawn(function ()
                v:WaitForChild("Upgrade"):GetPropertyChangedSignal("Value"):Connect(function ()
                    if Options.Record.Value then
                    table.insert(Macro,{
                        ["Upgrade"] = {
                            ["Wave"] = tostring(Wave()),
                            ["Time"] = tostring(Time()),
                            ["Money"] = tostring(money),
                            ["Unit"] = tostring(v.Name),
                            ["Value"] = tostring(v:WaitForChild("Upgrade").Value),
                            ["Position"] = tostring(v:WaitForChild("HumanoidRootPart").Position),
                        }})
                        set_grap("new",{["1"] = "Wave : "..tostring(Wave()),["2"] = "Time : "..tostring(Time()),["3"] = "Money : "..tostring(money),["4"] = "Action : Upgrade",["5"] = "Unit : "..tostring(v.Name),["6"] = "Value : "..tostring(v:WaitForChild("Upgrade").Value) })
                        writemacro()
                    end
                    end)
                end)
            task.spawn(function ()
                    v:GetPropertyChangedSignal("Parent"):Connect(function ()
                        if Options.Record.Value then
                            table.insert(Macro,{
                            ["Sell"] = {
                                ["Wave"] = tostring(Wave()),
                                ["Time"] = tostring(Time()),
                                ["Unit"] = tostring(v.Name),
                                ["Position"] = tostring(v:WaitForChild("HumanoidRootPart").Position),
                            }})
                            set_grap("new",{["1"] = "Wave : "..tostring(Wave()),["2"] = "Time : "..tostring(Time()),["3"] = "Action : Sell",["4"] = "Unit : "..tostring(v.Name) })
                            writemacro()
                        end
                    end)
                end)
            task.spawn(function ()
                v:WaitForChild("Targeting"):GetPropertyChangedSignal("Value"):Connect(function ()
                    if Options.Record.Value then
                        table.insert(Macro,{
                            ["Target"] = {
                                ["Wave"] = tostring(Wave()),
                                ["Time"] = tostring(Time()),
                                ["Unit"] = tostring(v.Name),
                                ["Value"] = tostring(v:WaitForChild("Targeting").Value),
                                ["Position"] = tostring(v:WaitForChild("HumanoidRootPart").Position),
                            }})
                            set_grap("new",{["1"] = "Wave : "..tostring(Wave()),["2"] = "Time : "..tostring(Time()),["3"] = "Action : Target",["4"] = "Unit : "..tostring(v.Name),["5"] =  "Value : "..tostring(v:WaitForChild("Targeting").Value) })
                            writemacro()
                        end
                    end)
                end)
            task.spawn(function ()
                game.Players.LocalPlayer.PlayerGui:WaitForChild("Settings"):WaitForChild("AutoSkip"):GetPropertyChangedSignal("Value"):Connect(function()
                    if Options.Record.Value then
                        table.insert(Macro,{
                            ["AutoSkip"] = {
                                ["Wave"] = tostring(Wave()),
                                ["Time"] = tostring(Time()),
                                ["Value"] = game.Players.LocalPlayer.PlayerGui:WaitForChild("Settings"):WaitForChild("AutoSkip").Value,
                            }})
                            set_grap("new",{["1"] = "Wave : "..tostring(Wave()),["2"] = "Time : "..tostring(Time()),["3"] = "Action : AutoSkip",["4"] =  "Value : "..tostring(game.Players.LocalPlayer.PlayerGui:WaitForChild("Settings"):WaitForChild("AutoSkip").Value)})
                            writemacro()
                        end
                    end)
                end)
                task.spawn(function ()
                    game:GetService("ReplicatedStorage").Wave:GetPropertyChangedSignal("Value"):Connect(function ()
                        if Options.Record.Value then
                        table.insert(Macro,{
                            ["AutoSkip"] = {
                                ["Wave"] = tostring(Wave()),
                                ["Time"] = tostring(Time()),
                                ["Value"] = game.Players.LocalPlayer.PlayerGui:WaitForChild("Settings"):WaitForChild("AutoSkip").Value,
                            }})
                            set_grap("new",{["1"] = "Wave : "..tostring(Wave()),["2"] = "Time : "..tostring(Time()),["3"] = "Action : Check AutoSkip",["4"] =  "Value : "..tostring(game.Players.LocalPlayer.PlayerGui:WaitForChild("Settings"):WaitForChild("AutoSkip").Value)})
                            writemacro()
                        end
                    end)
                end)
                task.spawn(function ()
                    local a = getrawmetatable(game);
                    local b = a.__namecall;
                    setreadonly(a,false)
                    a.__namecall = newcclosure(function (self,...)
                        local arg = {...};
                        local method = getnamecallmethod();
                        task.spawn(function ()
                            if Options.Record.Value then
                            if self.Name == "Ability" and method == "InvokeServer" then
                                local action_1 = arg[1]
                                if not getgenv().incool_down then
                                    table.insert(Macro,{
                                        ["Ability"] = {
                                            ["Wave"] = tostring(Wave()),
                                            ["Time"] = tostring(Time()),
                                            ["Unit"] = tostring(action_1),
                                            ["Position"] = tostring(action_1:WaitForChild("HumanoidRootPart").Position),
                                        }})
                                    set_grap("new",{["1"] = "Wave : "..tostring(Wave()),["2"] = "Time : "..tostring(Time()),["3"] = "Action : Ability",["4"] = "Unit : "..tostring(action_1) })
                                    writemacro()
                                end
                            elseif self.Name == "VoteSkip" and method == "FireServer" then
                                table.insert(Macro,{
                                    ["VoteSkip"] = {
                                        ["Wave"] = tostring(Wave()),
                                        ["Time"] = tostring(Time()),
                                    }})
                                    set_grap("new",{["1"] = "Wave : "..tostring(Wave()),["2"] = "Time : "..tostring(Time()),["3"] = "Action : VoteSkip" })
                                    writemacro()
                                end
                            end
                            end)
                            return b(self,...)
                        end)
                    end)
                end
            end
        end)
    end)

    local function main_playstatus(val)
        if Options.Record.Value and val == "new" then
            return "Status Recording ["..#Macro.."]\n"
        elseif Options.Play.Value  and val == "new" then
            return "Status Playing ["..currentval.."/"..#getgenv().Playing.."]\n"
        end
    end

    task.spawn(function ()
        while wait() do
            if game.PlaceId == 12886143095 then return end
            if Options.Record.Value or Options.Play.Value then
                for i,v in pairs(current_action["Action"]) do
                    if i == "new" and v["3"] and not v["4"] then
                        Get_Paragrahp().Text = main_playstatus(i)..v["1"].."\n"..v["2"].."\n"..v["3"].."\nCurrent Time : "..tostring(Time())
                    elseif i == "new" and v["4"] and not v["5"] then
                        Get_Paragrahp().Text = main_playstatus(i)..v["1"].."\n"..v["2"].."\n"..v["3"].."\n"..v["4"].."\nCurrent Time : "..tostring(Time())
                    elseif i == "new" and v["5"] and not v["6"] then
                        Get_Paragrahp().Text = main_playstatus(i)..v["1"].."\n"..v["2"].."\n"..v["3"].."\n"..v["4"].."\n"..v["5"].."\nCurrent Time : "..tostring(Time())
                    elseif i == "new" and v["6"] and not v["7"] then
                        Get_Paragrahp().Text = main_playstatus(i)..v["1"].."\n"..v["2"].."\n"..v["3"].."\n"..v["4"].."\n"..v["5"].."\n"..v["6"].."\nCurrent Time : "..tostring(Time())
                    end
                end
            end
        end
    end)

    spawn(function ()
        if game.PlaceId == 12886143095 then return end
        game.Players.LocalPlayer.PlayerGui.ChildAdded:Connect(function(v)
            if v.Name == "EndGameUI" then
                repeat wait() until Options.AutoMissionEnd.Value
                repeat
                    VisibleForCodex(false)
                    VisibleForTrigon(false)
                    VisibleGui(false)
                    local ui = game.Players.LocalPlayer.PlayerGui:WaitForChild("EndGameUI"):WaitForChild("BG"):WaitForChild("Buttons"):WaitForChild(Options.ActionMissionEnd.Value):WaitForChild("Button")
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(ui.AbsolutePosition.X + 27.5, ui.AbsolutePosition.Y + 50, 0, not game.UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1), game, 0)
                    task.wait(0.5)
                until not v.Parent
                VisibleForCodex(true)
                VisibleForTrigon(true)
                VisibleGui(true)
            end
        end)
    end)

    spawn(function ()
        repeat wait() until game:IsLoaded()
        game.CoreGui:WaitForChild("CrazyDay")
        repeat wait() until game:WaitForChild("CoreGui"):FindFirstChild("CrazyDay")
        repeat wait() until Options.AutoCloseAfterExecute.Value
        game.CoreGui.CrazyDay:FindFirstChild("MainStatus").Visible = false
    end)

    spawn(function ()
        game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(Kick)
            if ((Kick.Name == "ErrorPrompt") and Kick:FindFirstChild("MessageArea") and Kick.MessageArea:FindFirstChild("ErrorFrame")) then
                if Options.AutoRejoinError.Value then
                    game:GetService("TeleportService"):Teleport(12886143095)
                end
            end
        end)
    end)

    spawn(function ()
        game.Players.LocalPlayer.OnTeleport:Connect(function(state)
            getgenv().OnTeleport = true
            local QueueOnTeleport = queue_on_teleport or queueonteleport or (syn and syn.queue_on_teleport)
            if state == Enum.TeleportState.InProgress and Options.AutoExecuteScript.Value then
            QueueOnTeleport(
                "loadstring(game:HttpGet('https://raw.githubusercontent.com/Mangadexwannatest/CanislupusXHUB/main/Anime%20Last%20Stand.lua'))()"
            )
            end
        end)
    end)

    local function unload_ui()
        while wait() do
            if Fluent.Unloaded then
            game.CoreGui:FindFirstChild("Close/Open"):Destroy()
                break 
                end
        end
    end
    coroutine.resume(coroutine.create(unload_ui))

end
task.wait(1)
until game.CoreGui:FindFirstChild("CrazyDay")
end -- End Of If

