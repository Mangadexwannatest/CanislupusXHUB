repeat task.wait() until game:IsLoaded()
repeat task.wait()until game:GetService("Players").LocalPlayer ~= nil
if not game:GetService("Players").LocalPlayer.Character then game:GetService("Players").LocalPlayer.CharacterAdded:Wait()wait()end
repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")

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
                            if v2.Name == "TextLabel" and string.find(v2.Text,"Anime Crossover Defense") then
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
    end)

    spawn(function ()
        repeat wait() until game:WaitForChild("CoreGui"):FindFirstChild("CrazyDay")
        local Button = game.CoreGui:FindFirstChild("Close/Open"):FindFirstChild("TextButton")
        Button.InputBegan:Connect(function(input)
            if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                game:WaitForChild("CoreGui"):WaitForChild("CrazyDay"):FindFirstChild("MainStatus").Visible = not game:WaitForChild("CoreGui"):WaitForChild("CrazyDay"):FindFirstChild("MainStatus").Visible
            end
        end)
    end)

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

    local function getroom()
        if game.PlaceId ~= 17399149936 then return end
        for i,v in pairs(game:GetService("Workspace").TeleportRoomStory.Teleporters.Story:GetChildren()) do
            if v.Name == "Chamber" then
                if (v.Values.OwnerName.Value == "" or nil) then
                    return v
                end
            end
        end
    end

    local function current_index(parent,value)
        local int = Instance.new("IntValue")
        int.Name = "Index"
        int.Parent = parent
        int.Value = value
    end

    local function Time()
        return Workspace.DistributedGameTime
    end

    local function Wave()
        if game.PlaceId == 17399149936 then return end
        if game.Players.LocalPlayer.PlayerGui.ScreenGui.TopFrame.TextFrame.WavesFrame.WaveText.Text:split(" ") then
            return game.Players.LocalPlayer.PlayerGui.ScreenGui.TopFrame.TextFrame.WavesFrame.WaveText.Text:split(" ")[2]
        else
            return game.Players.LocalPlayer.PlayerGui.ScreenGui.TopFrame.TextFrame.WavesFrame.WaveText.Text:split("Wave")[2]
        end
    end

    local function Money()
        if game.PlaceId == 17399149936 then return end
        return game.Players.LocalPlayer.PlayerGui.ScreenGui.UnitsSlotsFrame.CoinsFrame.CoinsText.Text
    end

    local function unit_number(values)
        if game.PlaceId == 17399149936 then return end
        for i,v in pairs(game.Players.LocalPlayer.PlayerGui.ScreenGui.UnitsSlotsFrame:GetChildren()) do
            if v.Name ~= "LoadUnitsSlots" and v.Name:match("Slot") then
                if tostring(v:WaitForChild("Values"):WaitForChild("UnitID").Value) == tostring(values) then
                    return v.Name:split("Slot")[2]
                end
            end
        end
    end

    local roomcframe,roomid
    local function get_the_cframeofdoor()
        return CFrame.new(table.unpack(roomcframe:gsub(" ", ""):split(",")))
    end
    local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
    local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
    local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

    local Window = Fluent:CreateWindow({
        Title = "Anime Crossover Defense",
        SubTitle = "Last Update May/11/2024 [CrazyDay:edek#1004]",
        TabWidth = 160,
        Size = UDim2.fromOffset(580, 460),
        Acrylic = true,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.LeftControl
    })

    local Tabs = {
        Main = Window:AddTab({ Title = "Main", Icon = "" }),
        Lobby = Window:AddTab({ Title = "Lobby", Icon = "" }),
        Game = Window:AddTab({ Title = "Game", Icon = "" }),
        Other = Window:AddTab({Title = "Other",Icon = ""}),
        Settings = Window:AddTab({ Title = "Settings", Icon = "" })
        }

        local Options = Fluent.Options
        local ignore_the_values = {}
        local Macro_Files = {}
        local Macro = {}
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
        for i,v in pairs(listfiles("/CrazyDay/ACD/Macro")) do
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
        if not isfolder("CrazyDay/ACD") then
            repeat wait()
            makefolder("/CrazyDay/ACD")
        until isfolder("CrazyDay/ACD")
        warn('make folder 2')
        end
    end

    if not isfolder("/CrazyDay/ACD/Macro") then
        repeat
            makefolder("/CrazyDay/ACD/Macro")
            task.wait(0.35)
        until isfolder("/CrazyDay/ACD/Macro")
    end

    if isfolder("/CrazyDay/ACD/Macro") then
        if not isfile("/CrazyDay/ACD/Macro/Crazy Day.lua") then
            writefile("/CrazyDay/ACD/Macro/Crazy Day.lua", game:GetService("HttpService"):JSONEncode({}))
        end
    end


    for i,v in pairs(listfiles("/CrazyDay/ACD/Macro")) do
        table.insert(Macro_Files,v:split("/")[5]:split(".lua")[1])
    end
    repeat task.wait() until #Macro_Files >= 1
    ------------- Macro
    Tabs.Main:AddParagraph({Title = "Macro Status [nil]",Content = "Status nil [0]\nCurrent Time : 0.00"})
    local CurrentFiles = Tabs.Main:AddDropdown("Current_File", {
        Title = "Select File",
        Values = Macro_Files,
        Multi = false,
        Default = 1,
    })

    local ignore_Its = Tabs.Main:AddDropdown("ignore_If", {
        Title = "Ignore time / wave if",
        Description = "will out of wait for time / wave while playing macro",
        Values = {"money reach"},
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
            writefile(string.format("/CrazyDay/ACD/Macro".."/%s.lua", bool)	, "")
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
            if Options.Current_File.Value == nil or not isfile(string.format("/CrazyDay/ACD/Macro/".."%s.lua",Options.Current_File.Value)) then
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
                            delfile(string.format("/CrazyDay/ACD/Macro/".."%s.lua",Options.Current_File.Value))
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
            if Options.Current_File.Value == nil or not isfile(string.format("/CrazyDay/ACD/Macro/".."%s.lua",Options.Current_File.Value)) then
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
                            writefile(string.format("/CrazyDay/ACD/Macro".."/%s.lua",Options.Current_File.Value), game:GetService("HttpService"):JSONEncode({}))
                        end
                    },{
                        Title = "Cancel",
                        Callback = function()
                        end
                    }
                }
            }
        )
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
                Last_action = {
                    ["Action"] = {
                        ["end"] = {["1"] = "Status Recording Ended ["..tostring(#Macro).."]" }
                }
            }
            MacroStatusTExt().Text = "Macro Status [nil]"
        end
    end)

    -------- Lobby Mode
    Tabs.Lobby:AddDropdown("Select_World", {
        Title = "Select World",
        Values = {"World1","World2","World3","World4"},
        Multi = false,
        Default = 1,
    })

    local stage = Tabs.Lobby:AddDropdown("Select_Stage", {
        Title = "Select Stage",
        Values = {"Stage1","Stage2","Stage3","Stage4 (Infinite Mode)"},
        Multi = false,
        Default = 1,
    })

    local autojoin = Tabs.Lobby:AddToggle("auto_join_room", {Title = "Auto Join Lobby", Default = false })

    local realstage,realroom

    stage:OnChanged(function (value)
        if game.PlaceId ~= 17399149936 then return end
        if value == "Stage4 (Infinite Mode)" then
            roomcframe,roomid = tostring(getroom().HitBox.CFrame),tostring(getroom().Values.StageID.Value)
            realstage,realroom = "Stage4",tostring(roomid.."inf")
        elseif value ~= "Stage4 (Infinite Mode)" then
            roomcframe,roomid = tostring(getroom().HitBox.CFrame),tostring(getroom().Values.StageID.Value)
            realstage,realroom = tostring(value),tostring(roomid)
        end
    end)

    
    autojoin:OnChanged(function ()
        if game.PlaceId ~= 17399149936 then return end
        roomcframe,roomid = tostring(getroom().HitBox.CFrame),tostring(getroom().Values.StageID.Value)
        if Options.auto_join_room.Value then
            repeat 
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = get_the_cframeofdoor()
                task.wait(0.1)
                until game.Players.LocalPlayer.PlayerGui.PlayGUI.StageSelect.Visible
            repeat
                game:GetService("ReplicatedStorage").RemoteEvents.Teleporters.SelectStage:FireServer(tostring(Options.Select_World.Value),tostring(realstage),tostring(realroom))
                wait(1)
                game:GetService("ReplicatedStorage").RemoteEvents.Teleporters.StartTeleport:FireServer()
                task.wait(0.1)
            until getgenv().OnTeleport
        end
    end)

    -------- Game Mode 

    Tabs.Game:AddToggle("RootItemDrop", {Title = "Auto Root Item Drop", Default = false })
    Tabs.Game:AddDropdown("select_missionend", {
        Title = "Select Action",
        Values = {"Replay","NextLevel","BackToLobby"},
        Multi = false,
        Default = 1,
    })
    Tabs.Game:AddToggle("return_replay_next", {Title = "Auto Replay // Back // Next", Default = false })

    task.spawn(function ()
        if game.PlaceId == 17399149936 then return end
        game:GetService("Workspace").DebrisFolder.ItemDrop.ChildAdded:Connect(function (v)
            pcall(function ()
                repeat task.wait() until Options.RootItemDrop.Value
                repeat
                game:GetService("ReplicatedStorage").RemoteEvents.Drops.CreateDrop:FireServer(v.Name)
                    v.Core.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    task.wait()
                    until not v.Parent
            end)
        end)
        game.Players.LocalPlayer.PlayerGui.EndOfGameGUI.EndOfGame:GetPropertyChangedSignal("Visible"):Connect(function ()
            repeat task.wait() until Options.return_replay_next.Value
            task.wait(1)
            game:GetService("ReplicatedStorage").RemoteEvents.UIRemoteEvents.PostEndGameClient:FireServer(Options.select_missionend.Value:lower())
        end)
    end)


    -------- Other Functions

    Tabs.Other:AddToggle("AutoRejoinError", {Title = "Auto Rejoin When Disconnect ", Default = false })
    local white = Tabs.Other:AddToggle("AutoWhiteScreen", {Title = "Auto White Screen", Default = false })
    Tabs.Other:AddToggle("AutoCloseAfterExecute", {Title = "Auto Close Gui After Execute", Default = false })
    Tabs.Other:AddToggle("AutoExecuteScript", {Title = "Auto Execute Script", Default = false })
    Tabs.Other:AddButton({
        Title = "Teleport Lobby",
        Description = nil,
        Callback = function()
            game:GetService("TeleportService"):Teleport(17399149936)
        end
    })

    white:OnChanged(function()
        if Options.AutoWhiteScreen.Value then
            game:GetService("RunService"):Set3dRenderingEnabled(false)
        else
            game:GetService("RunService"):Set3dRenderingEnabled(true)
        end
    end)

    local function stringtopos(str)
        return Vector3.new(table.unpack(str:gsub(" ", ""):split(",")))
    end

    local function check_index_values(Value)
        for i,v in pairs(game:GetService("Workspace").Units:GetChildren()) do
            if tostring(v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("PlayerName").Value) == game.Players.LocalPlayer.Name then
                if v:WaitForChild("U0Model"):WaitForChild("Values"):FindFirstChild("Index") and tonumber(v:WaitForChild("U0Model"):WaitForChild("Values"):FindFirstChild("Index").Value) == tonumber(Value) then
                    return v
                elseif v:WaitForChild("U0Model"):WaitForChild("Values"):FindFirstChild("Index") == nil then
                    return false
                end
            end
        end
    end

    local function check_its_index()
        for i,v in pairs(game:GetService("Workspace").Units:GetChildren()) do
            if tostring(v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("PlayerName").Value) == game.Players.LocalPlayer.Name then
                if v:WaitForChild("U0Model"):WaitForChild("Values"):FindFirstChild("Index") == nil then
                    return v.U0Model.Values
                end
            end
        end
    end

    local function checkitsmoney(val)
        if val["Money"] and table.find(ignore_the_values,"money reach") then
            if tonumber(Money()) >= tonumber(val["Money"]) then
                return true
            elseif tonumber(Money()) < tonumber(val["Money"]) then
                return false
            end
        elseif not val["Money"] and table.find(ignore_the_values,"money reach") then
            return false
        end
    end

    local function wait_for(values,number,actionname,Table)
        current_val = number
        Last_action = {
            ["Action"] = {
                [actionname] = Table
            }
        }

        repeat task.wait() until tonumber(Wave()) >= tonumber(values["Wave"]) or tonumber(Time()) >= tonumber(values["Time"]) or checkitsmoney(values)
        repeat task.wait() until tonumber(Time()) >= tonumber(values["Time"]) or checkitsmoney(values)

        if values["Money"] then
            repeat
                task.wait()
            until tonumber(Money()) >= tonumber(values["Money"])
        end
    end

    getgenv().canplaying = true
    local oncheck = false
    local function check_map()
        if oncheck then return end
        for i,v in pairs(listfiles("/CrazyDay/ACD/Macro")) do
            if string.split(v,"/")[5]:split(".lua")[1] == Options.Current_File.Value then
                local mapcheck = readfile(string.format("/CrazyDay/ACD/Macro".."/%s.lua",string.split(v,"/")[5]:split(".lua")[1]))
                getgenv().checkmap = game:GetService("HttpService"):JSONDecode(mapcheck)
            end
        end
            if oncheck then return end
            for i,v in pairs(getgenv().checkmap[1]) do
                if i == "MAP" and not oncheck then
                    repeat
                        getgenv().canplaying = false
                        oncheck = true
                        wait()
                    until not getgenv().canplaying and oncheck
                    if tostring(v) ~= tostring(game:GetService("ReplicatedStorage").ReplicatedInfoFolder.GameRules.MapName.Value) then
                        Window:Dialog({
                            Title = "Warning",
                            Content = "your map has changed are you sure you want to continue?",
                            Buttons = {
                                {
                                    Title = "Yes",
                                    Callback = function()
                                        oncheck = true
                                        getgenv().canplaying = true
                                    end
                                }, {
                                    Title = "No",
                                    Callback = function()
                                        oncheck = false
                                        Options.Play:SetValue(false)
                                        getgenv().canplaying = false
                                    end
                                }
                            }
                        })
                    elseif tostring(v) == tostring(game:GetService("ReplicatedStorage").ReplicatedInfoFolder.GameRules.MapName.Value) then
                        repeat
                            getgenv().canplaying = true
                            wait()
                        until getgenv().canplaying
                    end
                end
            end
        end

        local function ulttoggle(id,index,value,ult) -- กูใช้ remote เฉยๆแม่งไม่ติกให้กู
            for i,v in pairs(game:GetService("Workspace").Units:GetChildren()) do
                if tostring(v.U0Model.Values.UnitID.Value) == tostring(id) and tonumber(v.U0Model.Values.Index.Value) == tonumber(index) then
                    game:GetService("ReplicatedStorage").RemoteEvents.UltimateRemoteEvents.AutoUltToggle:FireServer(value,v.U0Model,tostring(v.U0Model.Values.UnitID.Value),tostring(ult))
                end
            end
        end

    local count_val = 0
    PlayToggle:OnChanged(function ()
        if game.PlaceId == 17399149936 then return end
        repeat task.wait() until #Macro_Files >= 1
        task.wait(0.5)
        if Options.Play.Value and game.PlaceId ~= 17399149936 then
            check_map()
            wait(0.1)
            repeat task.wait() until getgenv().canplaying
            for i,v in pairs(listfiles("/CrazyDay/ACD/Macro")) do
                if string.split(v,"/")[5]:split(".lua")[1] == Options.Current_File.Value then
                    local File = readfile(string.format("/CrazyDay/ACD/Macro".."/%s.lua",string.split(v,"/")[5]:split(".lua")[1]))
                    getgenv().Playing = game:GetService("HttpService"):JSONDecode(File)
                end
            end
        task.spawn(function ()
            repeat task.wait() until #Macro_Files >= 1
            if game.PlaceId == 17399149936 then return end
            task.wait(0.25)
            repeat task.wait() until getgenv().canplaying
            MacroStatusTExt().Text = "Macro Status ["..tostring(Options.Current_File.Value).."]"
            for val = 1,#getgenv().Playing do
                for i,v in pairs(getgenv().Playing [val]) do
                    if i == "PlaceUnit" then
                        wait_for(v,val,"new",{["1"] = "Waiting For Wave : "..tostring(v["Wave"]),["2"] = "Waiting For Time : "..tostring(v["Time"]),["3"] = "Waiting For Money : "..tostring(v["Money"]),["4"] = "Action : PlaceUnit",["5"] = "UnitID : "..tostring(v["UnitID"]),["6"] = "Unit Type : "..tostring(v["UnitType"]),["7"] = "Unit Index : "..tostring(v["Index"])  })
                        repeat
                            local index = check_index_values(v["Index"])
                            if not index then
                                game:GetService("ReplicatedStorage").RemoteFunctions.PlaceUnitFunctions.PlaceUnit:InvokeServer(tonumber(unit_number(v["UnitType"])),tostring(v["UnitType"]),tostring(v["UnitID"]),stringtopos(v["Position"]))
                                current_index(check_its_index(),tonumber(v["Index"]))
                            end
                            task.wait(0.1)
                        until index or not Options.Play.Value
                    elseif i == "UpgradeUnit" and check_index_values(v["Index"]) then
                        wait_for(v,val,"new",{["1"] = "Waiting For Wave : "..tostring(v["Wave"]),["2"] = "Waiting For Time : "..tostring(v["Time"]),["3"] = "Waiting For Money : "..tostring(v["Money"]),["4"] = "Action : UpgradeUnit",["5"] = "UpgradeType : "..tostring(v["TpyeUpgrade"]),["6"] = "Value : "..tostring(v["Value"]),["7"] = "Unit Index : "..tostring(v["Index"])  })
                        repeat
                            game:GetService("ReplicatedStorage").RemoteFunctions.UpgradeUnitFunctions.UpgradeUnit:InvokeServer(check_index_values(v["Index"]):WaitForChild("U0Model"),tonumber(v["TpyeUpgrade"]))
                            task.wait(0.25)
                        until tonumber(check_index_values(v["Index"]):WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("UpgradeValues"):WaitForChild("Path"..tostring(v["TpyeUpgrade"]).."Upgrades").Value) >= tonumber(v["Value"] + 1) or not Options.Play.Value
                    elseif i == "ChangeTargeting" and check_index_values(v["Index"]) then
                        wait_for(v,val,"new",{["1"] = "Waiting For Wave : "..tostring(v["Wave"]),["2"] = "Waiting For Time : "..tostring(v["Time"]),["3"] = "Action : ChangeTargeting",["4"] = "Value : "..tostring(v["Value"]),["5"] = "Unit Index : "..tostring(v["Index"])  })
                        repeat
                            game:GetService("ReplicatedStorage").RemoteEvents.ChangeUnitRemoteEvents.ChangeTargeting:FireServer("Right",check_index_values(v["Index"]):WaitForChild("U0Model"))
                            task.wait(0.25)
                        until tostring(check_index_values(v["Index"]):WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("Targeting").Value) == tostring(v["Value"]) or not Options.Play.Value
                    elseif i == "UseUltimate" and check_index_values(v["Index"]) then
                        wait_for(v,val,"new",{["1"] = "Waiting For Wave : "..tostring(v["Wave"]),["2"] = "Waiting For Time : "..tostring(v["Time"]),["3"] = "Action : UseUltimate",["4"] = "UnitID : "..tostring(v["UnitID"]),["5"] = "Ult Name : "..tostring(v["UltName"]),["6"] = "Unit Index : "..tostring(v["Index"])  })
                        game:GetService("ReplicatedStorage").RemoteEvents.UltimateRemoteEvents.UseUltimate:FireServer(check_index_values(v["Index"]):WaitForChild("U0Model"),tostring(v["UnitID"]),tostring(v["UltName"]) )
                    elseif i == "AutoUltToggle" and check_index_values(v["Index"]) then
                        wait_for(v,val,"new",{["1"] = "Waiting For Wave : "..tostring(v["Wave"]),["2"] = "Waiting For Time : "..tostring(v["Time"]),["3"] = "Action : AutoUltToggle",["4"] = "Value : "..tostring(v["Value"]),["5"] = "UnitID : "..tostring(v["UnitID"]),["6"] = "Ult Name : "..tostring(v["UltName"]),["7"] = "Unit Index : "..tostring(v["Index"])  })
                        ulttoggle(tostring(v["UnitID"]),tonumber(v["Index"],v["Value"]),tostring(v["UltName"]))

                    elseif i == "SellUnit" and check_index_values(v["Index"]) then 
                        wait_for(v,val,"new",{["1"] = "Waiting For Wave : "..tostring(v["Wave"]),["2"] = "Waiting For Time : "..tostring(v["Time"]),["3"] = "Action : SellUnit",["4"] = "Unit Index : "..tostring(v["Index"])  })
                            game:GetService("ReplicatedStorage").RemoteEvents.ChangeUnitRemoteEvents.SellUnit:FireServer(check_index_values(v["Index"]):WaitForChild("U0Model"))
                    elseif i == "SpeedChange" and tostring(game.Players.LocalPlayer.PlayerGui.ScreenGui.SpeedFrame.SpeedButton.TextLabel.Text) ~= tostring(v["Value"]) then
                        wait_for(v,val,"new",{["1"] = "Waiting For Wave : "..tostring(v["Wave"]),["2"] = "Waiting For Time : "..tostring(v["Time"]),["3"] = "Action : SpeedChange",["4"] = "Value : "..tostring(v["Value"])  })
                        repeat
                            task.wait(0.1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.SpeedChange.ChangeSpeedRemoteFunction:InvokeServer()
                        until tostring(game.Players.LocalPlayer.PlayerGui.ScreenGui.SpeedFrame.SpeedButton.TextLabel.Text) == tostring(v["Value"])
                    end
                    if val == #getgenv().Playing then
                        Last_action = {
                            ["Action"] = {
                                ["end"] = {["1"] = "Status Playing Ended ["..tostring(val).."/"..tostring(#getgenv().Playing).."]" }
                            }}
                        end
                    end
                end
            end)
        end
        if not Options.Play.Value and count_val ~= 0 and getgenv().Playing ~= nil then
            MacroStatusTExt().Text = "Macro Status [nil]"
            Last_action = {
                ["Action"] = {
                    ["end"] = {["1"] = "Status Playing Ended ["..tostring(count_val).."/"..tostring(#getgenv().Playing).."]" }
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
    InterfaceManager:SetFolder("/CrazyDay/ACD/"..game.Players:GetUserIdFromNameAsync(game.Players.LocalPlayer.Name))
    SaveManager:SetFolder("/CrazyDay/ACD/"..game.Players:GetUserIdFromNameAsync(game.Players.LocalPlayer.Name))
    InterfaceManager:BuildInterfaceSection(Tabs.Settings)
    SaveManager:BuildConfigSection(Tabs.Settings)
    Tabs.Settings:AddButton({
        Title = "Delete Autoload file",
        Description = nil,
        Callback = function()
            if not isfile("/CrazyDay/ACD/"..game.Players:GetUserIdFromNameAsync(game.Players.LocalPlayer.Name).."/settings/autoload.txt") then
                return Notify("Deleate Failed","not find autoload.txt")
            end
            Notify("Deleate Succeed","autoload.txt")
            delfile("/CrazyDay/ACD/"..game.Players:GetUserIdFromNameAsync(game.Players.LocalPlayer.Name).."/settings/autoload.txt")
        end})

        Tabs.Settings:AddButton({
            Title = "Delete Select Config List",
            Description = nil,
            Callback = function()
                if SaveManager.Options.SaveManager_ConfigList.Value == nil or not isfile("/CrazyDay/ACD/"..game.Players:GetUserIdFromNameAsync(game.Players.LocalPlayer.Name).."/settings/"..SaveManager.Options.SaveManager_ConfigList.Value..".json") then
                    return Notify("Deleate Failed","make sure you just select the file")
                end
                Notify("Delete Succeed",tostring(SaveManager.Options.SaveManager_ConfigList.Value))
                delfile("/CrazyDay/ACD/"..game.Players:GetUserIdFromNameAsync(game.Players.LocalPlayer.Name).."/settings/"..SaveManager.Options.SaveManager_ConfigList.Value..".json")
            end})
        Window:SelectTab(1)
        SaveManager:LoadAutoloadConfig()

    end -- End Of Do

    local function writemacro()
        writefile(string.format("/CrazyDay/ACD/Macro".."/%s.lua",Options.Current_File.Value), game:GetService("HttpService"):JSONEncode(Macro))
    end


    local money
    local Count = 0
    task.spawn(function ()
        if game.PlaceId == 17399149936 then return end
        task.spawn(function ()
            game.Players.LocalPlayer.PlayerGui.ScreenGui.UnitsSlotsFrame.CoinsFrame.ChangedNotifiers.ChildAdded:Connect(function (v)
                if string.find(v.Text,"-") then
                    money = v.Text:split("-")[2]
                end
            end)
        end)
        task.spawn(function ()
            game:GetService("Workspace").Units.ChildAdded:Connect(function (v)
                if not Macro["MAP"] then
                    table.insert(Macro,{
                        ["MAP"] = tostring(game:GetService("ReplicatedStorage").ReplicatedInfoFolder.GameRules.MapName.Value)
                    })
                end
                if tostring(v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("PlayerName").Value) == game.Players.LocalPlayer.Name then
                    if Options.Record.Value then
                        Count += 1
                        if v:WaitForChild("U0Model"):WaitForChild("Values"):FindFirstChild("Index") == nil then
                            repeat
                                if v:WaitForChild("U0Model"):WaitForChild("Values"):FindFirstChild("Index") == nil then
                                    current_index(v:WaitForChild("U0Model"):WaitForChild("Values"),tonumber(Count))
                                end
                                task.wait(0.115)
                            until v:WaitForChild("U0Model"):WaitForChild("Values"):FindFirstChild("Index")
                        end
                        table.insert(Macro,{
                            ["PlaceUnit"] = {
                                ["Wave"] = tostring(Wave()),
                                ["Time"] = tostring(Time()),
                                ["Money"] = tostring(money),
                                ["UnitType"] = tostring(v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("UnitID").Value..v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("ShinyID").Value),
                                ["UnitID"] = tostring(v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("UnitID").Value),
                                ["Position"] = tostring(v:WaitForChild("U0Model"):WaitForChild("HumanoidRootPart").Position),
                                ["Index"] = tostring(v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("Index").Value),
                            }
                        })
                        Last_action = {
                            ["Action"] = {
                                ["new"] = {
                                ["1"] = "Wave : "..tostring(Wave()),
                                ["2"] = "Time : "..tostring(Time()),
                                ["3"] = "Money : "..tostring(money),
                                ["4"] = "Action : PlaceUnit",
                                ["5"] = "UnitType : "..tostring(v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("UnitID").Value..v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("ShinyID").Value),
                                ["6"] = "UnitID : "..tostring(v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("UnitID").Value),
                                ["7"] = "Unit Index : "..tostring(v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("Index").Value),
                            }
                        }}
                        writemacro()
                    end
                    task.spawn(function ()
                        v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("Targeting"):GetPropertyChangedSignal("Value"):Connect(function ()
                            if Options.Record.Value then
                                table.insert(Macro,{
                                    ["ChangeTargeting"] = {
                                        ["Wave"] = tostring(Wave()),
                                        ["Time"] = tostring(Time()),
                                        ["Value"] = tostring(v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("Targeting").Value),
                                        ["Index"] = tostring(v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("Index").Value),
                                    }})
                                    Last_action = {
                                        ["Action"] = {
                                            ["new"] = {
                                            ["1"] = "Wave : "..tostring(Wave()),
                                            ["2"] = "Time : "..tostring(Time()),
                                            ["3"] = "Action : ChangeTargeting",
                                            ["4"] = "Value : "..tostring(v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("Targeting").Value),
                                            ["5"] = "Unit Index : "..tostring(v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("Index").Value),
                                        }
                                    }}
                                    writemacro()
                                end
                            end)
                        end)
                        task.spawn(function ()
                            v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("UpgradeValues"):WaitForChild("Path1Upgrades"):GetPropertyChangedSignal("Value"):Connect(function ()
                                if Options.Record.Value then
                                    table.insert(Macro,{
                                        ["UpgradeUnit"] = {
                                            ["Wave"] = tostring(Wave()),
                                            ["Time"] = tostring(Time()),
                                            ["Money"] = tostring(money),
                                            ["TpyeUpgrade"] = tostring(1),
                                            ["Value"] = tostring(v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("UpgradeValues"):WaitForChild("Path1Upgrades").Value - 1),
                                            ["Index"] = tostring(v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("Index").Value),
                                        }})
                                        Last_action = {
                                            ["Action"] = {
                                                ["new"] = {
                                                ["1"] = "Wave : "..tostring(Wave()),
                                                ["2"] = "Time : "..tostring(Time()),
                                                ["3"] = "Money : "..tostring(money),
                                                ["4"] = "Action : UpgradeUnit",
                                                ["5"] = "Upgrade Type : 1",
                                                ["6"] = "Value : "..tostring(v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("UpgradeValues"):WaitForChild("Path1Upgrades").Value - 1),
                                                ["7"] = "Unit Index : "..tostring(v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("Index").Value),
                                            }
                                        }}
                                        writemacro()
                                    end
                                end)
                                v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("UpgradeValues"):WaitForChild("Path2Upgrades"):GetPropertyChangedSignal("Value"):Connect(function ()
                                    if Options.Record.Value then
                                        table.insert(Macro,{
                                            ["UpgradeUnit"] = {
                                                ["Wave"] = tostring(Wave()),
                                                ["Time"] = tostring(Time()),
                                                ["Money"] = tostring(money),
                                                ["TpyeUpgrade"] = tostring(2),
                                                ["Value"] = tostring(v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("UpgradeValues"):WaitForChild("Path2Upgrades").Value) - 1,
                                                ["Index"] = tostring(v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("Index").Value),
                                            }})
                                            Last_action = {
                                                ["Action"] = {
                                                    ["new"] = {
                                                    ["1"] = "Wave : "..tostring(Wave()),
                                                    ["2"] = "Time : "..tostring(Time()),
                                                    ["3"] = "Money : "..tostring(money),
                                                    ["4"] = "Action : UpgradeUnit",
                                                    ["5"] = "Upgrade Type : 2",
                                                    ["6"] = "Value : "..tostring(v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("UpgradeValues"):WaitForChild("Path2Upgrades").Value - 1),
                                                    ["7"] = "Unit Index : "..tostring(v:WaitForChild("U0Model"):WaitForChild("Values"):WaitForChild("Index").Value),
                                                }
                                            }}
                                            writemacro()
                                        end
                                    end)
                                end)
                                    task.spawn(function ()
                                        game.Players.LocalPlayer.PlayerGui.ScreenGui.SpeedFrame.SpeedButton.TextLabel:GetPropertyChangedSignal("Text"):Connect(function ()
                                            if Options.Record.Value then
                                                table.insert(Macro,{
                                                    ["SpeedChange"] = {
                                                        ["Wave"] = tostring(Wave()),
                                                        ["Time"] = tostring(Time()),
                                                        ["Value"] = tostring(game.Players.LocalPlayer.PlayerGui.ScreenGui.SpeedFrame.SpeedButton.TextLabel.Text),
                                                    }})
                                                    Last_action = {
                                                        ["Action"] = {
                                                            ["new"] = {
                                                            ["1"] = "Wave : "..tostring(Wave()),
                                                            ["2"] = "Time : "..tostring(Time()),
                                                            ["3"] = "Action : SpeedChange",
                                                            ["4"] = "Value : "..tostring(game.Players.LocalPlayer.PlayerGui.ScreenGui.SpeedFrame.SpeedButton.TextLabel.Text),
                                                        }
                                                    }}
                                                    writemacro()
                                                end
                                            end)
                                        end)
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
                                        if Options.Record.Value and game.PlaceId ~= 17399149936 then
                                            if method == "FireServer" and (self.Name == "UseUltimate" or "AutoUltToggle" or "SellUnit") then
                                                if self.Name == "UseUltimate" and game.Players.LocalPlayer.PlayerGui.ScreenGui.UnitShower.UltimateButtons:FindFirstChild("UltimateTemplate") then
                                                    local action_1 = arg[1]
                                                    local action_2 = arg[2]
                                                    local action_3 = arg[3]
                                                    if not game.Players.LocalPlayer.PlayerGui.ScreenGui.UnitShower.UltimateButtons:WaitForChild("UltimateTemplate"):WaitForChild("InnerFrame"):WaitForChild("CooldownBar").Visible then
                                                    table.insert(Macro,{
                                                        ["UseUltimate"] = {
                                                            ["Wave"] = tostring(Wave()),
                                                            ["Time"] = tostring(Time()),
                                                            ["UnitID"] = tostring(action_2),
                                                            ["UltName"] = tostring(action_3),
                                                            ["Index"] = tostring(action_1:WaitForChild("Values"):WaitForChild("Index").Value),
                                                        }
                                                    })
                                                    Last_action = {
                                                        ["Action"] = {
                                                            ["new"] = {
                                                            ["1"] = "Wave : "..tostring(Wave()),
                                                            ["2"] = "Time : "..tostring(Time()),
                                                            ["3"] = "Action : UseUltimate",
                                                            ["4"] = "UnitID : "..tostring(action_2),
                                                            ["5"] = "Ult Name : "..tostring(action_3),
                                                            ["6"] = "Unit Index : "..tostring(action_1:WaitForChild("Values"):WaitForChild("Index").Value),
                                                        }
                                                    }}
                                                    writemacro()
                                                end
                                            elseif self.Name == "AutoUltToggle" and game.Players.LocalPlayer.PlayerGui.ScreenGui.UnitShower.UltimateButtons:FindFirstChild("UltimateTemplate") then
                                                table.insert(Macro,{
                                                    ["AutoUltToggle"] = {
                                                        ["Wave"] = tostring(Wave()),
                                                        ["Time"] = tostring(Time()),
                                                        ["Value"] = arg[1],
                                                        ["UnitID"] = tostring(arg[3]),
                                                        ["UltName"] = tostring(arg[4]),
                                                        ["Index"] = tostring(arg[2]:WaitForChild("Values"):WaitForChild("Index").Value),
                                                    }
                                                })
                                                Last_action = {
                                                    ["Action"] = {
                                                        ["new"] = {
                                                        ["1"] = "Wave : "..tostring(Wave()),
                                                        ["2"] = "Time : "..tostring(Time()),
                                                        ["3"] = "Action : AutoUltToggle",
                                                        ["4"] = "Value : "..tostring(arg[1]),
                                                        ["5"] = "UnitID : "..tostring(arg[3]),
                                                        ["6"] = "Ult Name : "..tostring(arg[4]),
                                                        ["7"] = "Unit Index : "..tostring(arg[2]:WaitForChild("Values"):WaitForChild("Index").Value),
                                                    }
                                                }}
                                                writemacro()
                                            elseif self.Name == "SellUnit" then
                                                table.insert(Macro,{
                                                    ["SellUnit"] = {
                                                        ["Wave"] = tostring(Wave()),
                                                        ["Time"] = tostring(Time()),
                                                        ["Index"] = tostring(arg[1]:WaitForChild("Values"):WaitForChild("Index").Value),
                                                    }
                                                })
                                                Last_action = {
                                                    ["Action"] = {
                                                        ["new"] = {
                                                        ["1"] = "Wave : "..tostring(Wave()),
                                                        ["2"] = "Time : "..tostring(Time()),
                                                        ["3"] = "Action : SellUnit",
                                                        ["4"] = "Unit Index : "..tostring(arg[1]:WaitForChild("Values"):WaitForChild("Index").Value),
                                                    }
                                                }}
                                                writemacro()
                                                end
                                            end
                                        end
                                    end)
                                    return b(self,...)
                                end)
                            end)
                        end)

                        local function mainstatus(val)
                            if Options.Record.Value and val == "new" then
                                return "Status Recording ["..#Macro.."]\n"
                            elseif Options.Play.Value and val == "new" then
                                return "Status Playing ["..current_val.."/"..#getgenv().Playing.."]\n"
                            end
                        end

                        task.spawn(function ()
                            while wait() do
                                if game.PlaceId == 17399149936 then return end
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
                                    elseif i =="new" and v["8"] and not v["9"] and (Options.Record.Value or Options.Play.Value )then
                                        Get_Paragrahp().Text = mainstatus(i)..v["1"].."\n"..v["2"].."\n"..v["3"].."\n"..v["4"].."\n"..v["5"].."\n"..v["6"].."\n"..v["7"].."\n"..v["8"].."\nCurrent Time : "..tostring(Time())
                                    end
                                    end
                                end
                            end
                        end)

                        
                        spawn(function ()
                            game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(Kick)
                                if ((Kick.Name == "ErrorPrompt") and Kick:FindFirstChild("MessageArea") and Kick.MessageArea:FindFirstChild("ErrorFrame")) then
                                    if Options.AutoRejoinError.Value then
                                        repeat
                                    game:GetService("TeleportService"):Teleport(17399149936)
                                    wait()
                                        until not Kick.Parent
                                end
                            end
                        end)
                    end)

                    spawn(function ()
                        repeat wait() until game:IsLoaded()
                        game:WaitForChild("CoreGui"):WaitForChild("CrazyDay")
                        repeat wait() until game.CoreGui:FindFirstChild("CrazyDay")
                        repeat wait() until Options.AutoCloseAfterExecute.Value
                        game.CoreGui.CrazyDay:FindFirstChild("MainStatus").Visible = false
                    end)

                    spawn(function ()
                        game.Players.LocalPlayer.OnTeleport:Connect(function(state)
                            getgenv().OnTeleport = true
                            local QueueOnTeleport = queue_on_teleport or queueonteleport or (syn and syn.queue_on_teleport)
                            if state == Enum.TeleportState.InProgress and Options.AutoExecuteScript.Value then
                                QueueOnTeleport(
                                    "loadstring(game:HttpGet('https://raw.githubusercontent.com/Mangadexwannatest/CanislupusXHUB/main/ACD.lua'))()"
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
