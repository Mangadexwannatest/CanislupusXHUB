repeat wait() until game:IsLoaded()
game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart')
task.wait(1)

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

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
                        if k.Name == "TextLabel" and string.find(k.Text,"Anime Last Stand") then
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

local Window = Fluent:CreateWindow({
    Title = "Anime Last Stand",
    SubTitle = "Last Update May/03/2024 [CrazyDay:edek#1004]",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})
local Tabs = { 
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    GameMode = Window:AddTab({Title = "Game Mode",Icon = ""}),
    Webhook = Window:AddTab({ Title = "Webhook", Icon = ""}),
    Other = Window:AddTab({ Title = 'Other' , Icon = ""}),
    Settings = Window:AddTab({ Title = "Settings", Icon = "" }
)}
local Options = Fluent.Options
local Macro_Files = {}
getgenv().Recording = {}
local Actions = {}
do

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

    local Action = Tabs.Main:AddDropdown("Action", {
        Title = "Select Actions (Macro Play)",
        Description = "recommended to enable all",
        Values = {"Place","Upgrade","Sell","Target","Auto Wave Skip"},
        Multi = true,
        Default = {nil},
    })

    Action:OnChanged(function(Value)
        Actions = {}
        for Value, State in next, Value do
            table.insert(Actions, Value)
        end
    end)

    local Input = Tabs.Main:AddInput("Input", {
        Title = "Creat macro files",
        Description = nil,
        Default = nil,
        Placeholder = "nil",
        Numeric = false,
        Finished = true,
        Callback = function(bool)
            if not table.find(Macro_Files,bool) then
            writefile(string.format("/CrazyDay/ALS/Macro".."/%s.lua", bool)	, "")
            Macro_Files = {}
            for i,v in pairs(listfiles("/CrazyDay/ALS/Macro")) do
                table.insert(Macro_Files,v:split("/")[5]:split(".lua")[1])
            end
            MacroOptions:SetValues(Macro_Files)
            MacroOptions:SetValue(bool)
            Fluent:Notify({
                Title = "Create succeed",
                Content = "Macro name",
                SubContent = bool,
                Duration = 5
        })
        end
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
            delfile(string.format("/CrazyDay/ALS/Macro/".."%s.lua",Options.OptionsMacro.Value))
            Macro_Files = {}
            for i,v in pairs(listfiles("/CrazyDay/ALS/Macro")) do
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
        writefile(string.format("/CrazyDay/ALS/Macro".."/%s.lua",Options.OptionsMacro.Value), game:GetService("HttpService"):JSONEncode({}))
    end
    })


    local function Get_Paragrahp()
        for i,v in pairs(game:WaitForChild("CoreGui"):WaitForChild("CrazyDay"):WaitForChild("MainStatus"):WaitForChild("CanvasGroup"):GetChildren()) do
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

    local RecordToggle = Tabs.Main:AddToggle("Record", {Title = "Macro Record",Description = "after record disable to save or wait for the game has ended", Default = false })
    local PlayToggle = Tabs.Main:AddToggle("Play", {Title = "Macro Play", Default = false })
    getgenv().MissionEnd = nil
    Tabs.GameMode:AddDropdown("ActionMissionEnd", {
        Title = "Select Action",
        Description = nil,
        Values = {"Leave","Retry","Next"},
        Multi = false,
        Default = 1
    })
    Tabs.GameMode:AddToggle("AutoMissionEnd", {Title = "Auto Leave // Retry // Next ", Default = false })

    Tabs.Other:AddToggle("AutoRejoinError", {Title = "Auto Rejoin When Disconnect ", Default = false })
    local white = Tabs.Other:AddToggle("AutoWhiteScreen", {Title = "Auto White Screen", Default = false })
    Tabs.Other:AddToggle("AutoCloseAfterExecute", {Title = "Auto Close Gui After Execute", Default = false })
    Tabs.Other:AddToggle("AutoExecuteScript", {Title = "Auto Execute Script", Default = false })
    Tabs.Other:AddButton({
        Title = "TELEPORT LOBBY",
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

    RecordToggle:OnChanged(function()
        if Options.Record.Value and Options.OptionsMacro.Value ~= nil then
            Get_Paragrahp().Text = "Status : Recording...\nnil\nnil\nnil"
            repeat wait() until not Options.Record.Value or getgenv().MissionEnd
            Fluent:Notify({
                Title = "Record Ended",
                Content = "Macro name",
                SubContent = Options.OptionsMacro.Value,
                Duration = 5 })
                writefile(string.format("/CrazyDay/ALS/Macro".."/%s.lua",Options.OptionsMacro.Value), game:GetService("HttpService"):JSONEncode(getgenv().Recording))
            end
    end)
    

    local function Wave()
        return tostring(game:GetService("ReplicatedStorage").Wave.Value)
    end


    local function Time()
        return tostring(Workspace.DistributedGameTime)
    end
    
    local function Money()
        return tostring(game.Players.LocalPlayer.Cash.Value)
    end

    local money
    local skip_wave_true
    local skip_wave_false
    task.spawn(function ()
    if not game:GetService("ReplicatedStorage"):FindFirstChild("ZonePlusReference") then
    local AutoSKipButton = game.Players.LocalPlayer.PlayerGui:WaitForChild("TopbarPlus"):WaitForChild("TopbarContainer"):WaitForChild("UnnamedIcon"):WaitForChild("DropdownContainer"):WaitForChild("DropdownFrame"):WaitForChild("AutoSkip"):WaitForChild("IconButton")
    game.Players.LocalPlayer.PlayerGui:WaitForChild("MainUI"):WaitForChild("ErrorHolder").ChildAdded:Connect(function (v)
    if string.find(v.Text,"-") then
        money = v.Text:split("-$")[2]
        end
    end)


    game.Players.LocalPlayer.PlayerGui.ChildAdded:Connect(function(v)
        if v.Name == "EndGameUI" then
            getgenv().MissionEnd = true
            repeat wait() until Options.AutoMissionEnd.Value
            repeat
                firesignal(game.Players.LocalPlayer.PlayerGui:WaitForChild("BG"):WaitForChild("Buttons"):WaitForChild(Options.ActionMissionEnd.Value):WaitForChild("Button").MouseButton1Click,game.Players.LocalPlayer)
                wait(1)
            until not v.Parent
        end
    end)

    game.Players.LocalPlayer.PlayerGui.ChildAdded:Connect(function (v)
    if v.Name == "SkipWave" and Options.Record.Value then
    task.spawn(function ()
    skip_wave_true = v:WaitForChild("BG"):WaitForChild("Yes").Activated:Connect(function ()
        if Options.Record.Value then
        table.insert(getgenv().Recording,{
            ["Vote Wave"] = {
                ["Wave"] = Wave(),
                ["Time"] = Time(),
                ["Value"] = true
            }})
            Get_Paragrahp().Text = "Status : Recording ["..#getgenv().Recording.."]\nWave : "..Wave().."\nTime : "..Time().."\nAction : Vote Wave\nValue : true"
            repeat task.wait() until not v.Parent or not Options.Record.Value
            if skip_wave_false then
                skip_wave_false:Disconnect()
                skip_wave_false = nil
            end
            skip_wave_true:Disconnect()
            skip_wave_true = nil
        end
        end)
    end)
    task.spawn(function ()
    skip_wave_false = v:WaitForChild("BG"):WaitForChild("No").Activated:Connect(function ()
        if Options.Record.Value then
        table.insert(getgenv().Recording,{
            ["Vote Wave"] = {
                ["Wave"] = Wave(),
                ["Time"] = Time(),
                ["Value"] = false
            }})
            Get_Paragrahp().Text = "Status : Recording ["..#getgenv().Recording.."]\nWave : "..Wave().."\nTime : "..Time().."\nAction : Vote Wave\nValue : false"
            repeat task.wait() until not v.Parent or not Options.Record.Value
                if skip_wave_true then
                    skip_wave_true:Disconnect()
                    skip_wave_true = nil
                end
                skip_wave_false:Disconnect()
                skip_wave_false = nil
                end
                end)
            end)
        end
    end)

    game:GetService("ReplicatedStorage").Wave:GetPropertyChangedSignal("Value"):Connect(function ()
        if AutoSKipButton.BackgroundColor3 == Color3.fromRGB(0, 0, 0) and Options.Record.Value then
            table.insert(getgenv().Recording,{
            ["Check Auto Skip Wave"] = {
                ["Wave"] = Wave(),
                ["Time"] = Time(),
                ["Value"] = false
            }})
            Get_Paragrahp().Text = "Status : Recording ["..#getgenv().Recording.."]\nWave : "..Wave().."\nTime : "..Time().."\nAction : Check Auto Skip Wave\nValue : false"
        elseif AutoSKipButton.BackgroundColor3 == Color3.fromRGB(245, 245, 245) and Options.Record.Value then
            table.insert(getgenv().Recording,{
                ["Check Auto Skip Wave"] = {
                    ["Wave"] = Wave(),
                    ["Time"] = Time(),
                    ["Value"] = true
                }})
                Get_Paragrahp().Text = "Status : Recording ["..#getgenv().Recording.."]\nWave : "..Wave().."\nTime : "..Time().."\nAction : Check Auto Skip Wave\nValue : true"
        end
    end)


    AutoSKipButton:GetPropertyChangedSignal("BackgroundColor3"):Connect(function()
    if AutoSKipButton.BackgroundColor3 == Color3.fromRGB(0, 0, 0) and Options.Record.Value then
        table.insert(getgenv().Recording,{
            ["Auto Skip Wave"] = {
                ["Wave"] = Wave(),
                ["Time"] = Time(),
                ["Value"] = false
            }})
            Get_Paragrahp().Text = "Status : Recording ["..#getgenv().Recording.."]\nWave : "..Wave().."\nTime : "..Time().."\nAction : Auto Skip Wave Wave\nValue : false"
    elseif AutoSKipButton.BackgroundColor3 == Color3.fromRGB(245, 245, 245) and Options.Record.Value then
        table.insert(getgenv().Recording,{
            ["Auto Skip Wave"] = {
                ["Wave"] = Wave(),
                ["Time"] = Time(),
                ["Value"] = true
            }})
            Get_Paragrahp().Text = "Status : Recording ["..#getgenv().Recording.."]\nWave : "..Wave().."\nTime : "..Time().."\nAction : Auto Skip Wave Wave\nValue : true"
        end
    end)


    game.Workspace:WaitForChild("Towers").ChildAdded:Connect(function (v)
        if tostring(v:WaitForChild("Owner").Value) == game.Players.LocalPlayer.Name then
            if Options.Record.Value then
                     table.insert(getgenv().Recording,{
                        ["Place"] = {
                        ["Wave"] = Wave(),
                        ["Time"] = Time(),
                        ["Money"] = tostring(money),
                        ["Unit"] = tostring(v.Name),
                        ["Position"] = tostring(v:WaitForChild("HumanoidRootPart").Position),
                    }})
                    Get_Paragrahp().Text = "Status : Recording ["..#getgenv().Recording.."]\nWave : "..Wave().."\nTime : "..Time().."\nMoney : "..tostring(money).."\nAction : Place\nUnit : "..tostring(v.Name)
            end
            task.spawn(function ()
                v:WaitForChild("Upgrade"):GetPropertyChangedSignal("Value"):Connect(function ()
                    if Options.Record.Value then
                    table.insert(getgenv().Recording,{
                        ["Upgrade"] = {
                        ["Wave"] = Wave(),
                        ["Time"] = Time(),
                        ["Money"] = tostring(money),
                        ["Unit"] = tostring(v.Name),
                        ["Position"] = tostring(v:WaitForChild("HumanoidRootPart").Position),
                        ["Value"] = tostring(v:WaitForChild("Upgrade").Value)
                        }})
                        Get_Paragrahp().Text = "Status : Recording ["..#getgenv().Recording.."]\nWave : "..Wave().."\nTime : "..Time().."\nMoney : "..tostring(money).."\nAction : Upgrade\nUnit : "..tostring(v.Name)
                     end
                end)
            end)
            task.spawn(function ()
                v:WaitForChild("Targeting"):GetPropertyChangedSignal("Value"):Connect(function ()
                    if Options.Record.Value then
                        table.insert(getgenv().Recording,{
                            ["Target"] = {
                                ["Wave"] = Wave(),
                                ["Time"] = Time(),
                                ["Unit"] = tostring(v.Name),
                                ["Position"] = tostring(v:WaitForChild("HumanoidRootPart").Position),
                                ["Value"] = tostring(v:WaitForChild("Targeting").Value)
                            }
                        })
                        Get_Paragrahp().Text = "Status : Recording ["..#getgenv().Recording.."]\nWave : "..Wave().."\nTime : "..Time().."\nAction : Target Changed\nUnit : "..tostring(v.Name).."\nValue : "..tostring(v:WaitForChild("Targeting").Value)
                    end
                end)
            end)
            task.spawn(function ()
                v:GetPropertyChangedSignal("Parent"):Connect(function ()
                    if Options.Record.Value then
                    table.insert(getgenv().Recording,{
                        ["Sell"] = {
                        ["Wave"] = Wave(),
                        ["Time"] = Time(),
                        ["Unit"] = tostring(v.Name),
                        ["Position"] = tostring(v:WaitForChild("HumanoidRootPart").Position),
                        }})
                        Get_Paragrahp().Text ="Status : Recording ["..#getgenv().Recording.."]\nWave : "..Wave().."\nTime : "..Time().."\nAction : Sell\nUnit : "..tostring(v.Name)
                    end
                end)
            end)
        end
    end)
end
end)
     
    local function stringtocf(str)
        return CFrame.new(table.unpack(str:gsub(" ", ""):split(",")))
    end
    local function stringtopos(str)
        return Vector3.new(table.unpack(str:gsub(" ", ""):split(",")))
    end


    local function Check_Unit_Position(Unit, Position)
        if type(Position) == "string" then
            Position = stringtopos(Position)
        end
        for i, v in pairs(game.Workspace.Towers:GetChildren()) do
            if v.Name == Unit and tostring(v:WaitForChild("Owner").Value) == game.Players.LocalPlayer.Name then
            if v.HumanoidRootPart.Position == Position or (v.HumanoidRootPart.Position - Position).magnitude < 2 then
                return v
                end
            end
        end
    end

    local function Upgrade(Unit,Position,Value)
        if type(Position) == "string" then
            Position = stringtopos(Position)
        end
        for i, v in pairs(game.Workspace.Towers:GetChildren()) do
            if v.Name == Unit and tostring(v:WaitForChild("Owner").Value) == game.Players.LocalPlayer.Name then
            if v.HumanoidRootPart.Position == Position or (v.HumanoidRootPart.Position - Position).magnitude < 2 then
            if tostring(v:WaitForChild("Upgrade").Value) < tostring(Value) then
            game:GetService("ReplicatedStorage").Remotes.Upgrade:InvokeServer(v)
            elseif tostring(v:WaitForChild("Upgrade").Value) >= tostring(Value) then
            return v
                  end
               end
            end
        end
    end

    local function Changed_Target(Unit,Position,Value)
        if type(Position) == "string" then
            Position = stringtopos(Position)
        end
        for i, v in pairs(game.Workspace.Towers:GetChildren()) do
            if v.Name == Unit and tostring(v:WaitForChild("Owner").Value) == game.Players.LocalPlayer.Name then
            if v.HumanoidRootPart.Position == Position or (v.HumanoidRootPart.Position - Position).magnitude < 2 then
            if tostring(v:WaitForChild("Targeting").Value) ~= tostring(Value) then
                game:GetService("ReplicatedStorage").Remotes.ChangeTargeting:InvokeServer(v)
            elseif tostring(v:WaitForChild("Targeting").Value) == tostring(Value) then
                return v
            end
            end
            end
        end
    end
    -- Script generated by SimpleSpy - credits to exx#9394

--game:GetService("ReplicatedStorage").Remotes.VoteSkip:FireServer()


    local function AutoSkip(value)
        local XAD = game.Players.LocalPlayer.PlayerGui:WaitForChild("TopbarPlus"):WaitForChild("TopbarContainer"):WaitForChild("UnnamedIcon"):WaitForChild("DropdownContainer"):WaitForChild("DropdownFrame"):WaitForChild("AutoSkip"):WaitForChild("IconButton")
        if value then
            if XAD.BackgroundColor3 ~= Color3.fromRGB(245, 245, 245) then
            repeat
            firesignal(XAD.MouseButton1Click,game.Players.LocalPlayer)
            wait()
            until XAD.BackgroundColor3 == Color3.fromRGB(245, 245, 245)
            end
        else
            if XAD.BackgroundColor3 ~= Color3.fromRGB(0, 0, 0) then
            repeat
            firesignal(XAD.MouseButton1Click,game.Players.LocalPlayer)
            wait()
            until XAD.BackgroundColor3 == Color3.fromRGB(0, 0, 0)
            end
        end
    end

    local function wait_and_set(count,value,text)
        Get_Paragrahp().Text = "Status : Playing "..tostring(count).."/"..tostring(#getgenv().Playing).."\nWaiting For Wave : "..tostring(value["Wave"]).."\nWaiting For Time : "..tostring(value["Time"]).."\n"..text
        repeat task.wait() until tonumber(Wave()) >= tonumber(value["Wave"])
        repeat task.wait() until tonumber(Time()) >= tonumber(value["Time"])
    end

    PlayToggle:OnChanged(function ()
        if #Actions <= 0 and Options.Play.Value then
            Fluent:Notify({
                Title = "WARNING",
                Content = "SELECT THE ACTIONS TO PLAY FIRST",
                SubContent = nil,
                Duration = 5
        })
        Options.Play:SetValue(false)
        else
        if Options.Play.Value and not game:GetService("ReplicatedStorage"):FindFirstChild("ZonePlusReference") then
            for i,v in pairs(listfiles("/CrazyDay/ALS/Macro")) do
                if string.split(v,"/")[5]:split(".lua")[1] == Options.OptionsMacro.Value then
                    local File = readfile(string.format("/CrazyDay/ALS/Macro".."/%s.lua",string.split(v,"/")[5]:split(".lua")[1]))
                    getgenv().Playing = game:GetService("HttpService"):JSONDecode(File)
                end
            end
            for val = 1,#getgenv().Playing do
                for i,v in pairs(getgenv().Playing[val]) do
                ---Auto Skip 
                if i == "Auto Skip Wave" or i == "Check Auto Skip Wave" and table.find(Actions,"Auto Wave Skip") then
                    wait_and_set(val,v,"Action : Auto Skip Wave".."\nValue : "..tostring(v["Value"]))
                    AutoSkip(v["Value"])
                --- Place
                elseif i == "Place" and table.find(Actions,"Place") then
                        wait_and_set(val,v,"Waiting For Money : "..tostring(v["Money"]).."\nAction : Place".."\nUnit : "..tostring(v["Unit"]))
                        if string.find(v["Money"],"k") then
                            local mun = v["Money"]:split(".")
                            local real = table.concat(mun,""):gsub("k","0")
                            repeat task.wait() until tonumber(Money()) >= tonumber(real)
                        elseif not string.find(v["Money"],"k") then
                            repeat task.wait() until tonumber(Money()) >= tonumber(v["Money"])
                        end
                        repeat
                            game:GetService("ReplicatedStorage").Remotes.PlaceTower:FireServer(v["Unit"],stringtocf(v["Position"]))
                            task.wait(0.25)
                        until Check_Unit_Position(v["Unit"],v["Position"]) or not table.find(Actions,"Place") or not Options.Play.Value
                    --- Upgrade
                    elseif i == "Upgrade" and table.find(Actions,"Upgrade") then
                        wait_and_set(val,v,"Waiting For Money : "..tostring(v["Money"]).."\nAction : Upgrade".."\nUnit : "..tostring(v["Unit"]))
                        if string.find(v["Money"],"k") then
                            local mun = v["Money"]:split(".")
                            local real = table.concat(mun,""):gsub("k","0")
                            repeat task.wait() until tonumber(Money()) >= tonumber(real)
                        elseif not string.find(v["Money"],"k") then
                            repeat task.wait() until tonumber(Money()) >= tonumber(v["Money"])
                        end
                        repeat
                            Upgrade(v["Unit"],v["Position"],v["Value"])
                            task.wait(0.25)
                        until Upgrade(v["Unit"],v["Position"],v["Value"]) or not table.find(Actions,"Place") or not Options.Play.Value
                    --- Traget
                    elseif i == "Target" and table.find(Actions,"Target") then
                        wait_and_set(val,v,"Action : Target Changed\nValue : "..tostring(v["Value"]))
                        repeat
                            Changed_Target(v["Unit"],v["Position"],v["Value"])
                            task.wait(0.25)
                        until Changed_Target(v["Unit"],v["Position"],v["Value"]) or not table.find(Actions,"Target") or not Options.Play.Value
                    ----- Sell
                    elseif i == "Sell" and table.find(Actions,"Sell") then 
                        wait_and_set(val,v,"Action : Sell".."\nUnit : "..tostring(v["Unit"]))
                        repeat
                            game:GetService("ReplicatedStorage").Remotes.Sell:InvokeServer(Check_Unit_Position(v["Unit"],v["Position"]))
                            task.wait(0.25)
                        until not Check_Unit_Position(v["Unit"],v["Position"]) or not table.find(Actions,"Sell") or not Options.Play.Value
                    end
                    if val == #getgenv().Playing then
                        Get_Paragrahp().Text = "Status : Playing Ended "..tostring(val).."/"..tostring(#getgenv().Playing)
                    end
                end
            end
        end
    end
end)



    repeat task.wait() until #Macro_Files >= 1
    warn("Loaded")
    task.wait(1)
    SaveManager:SetLibrary(Fluent)
    InterfaceManager:SetLibrary(Fluent)
    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({})
    InterfaceManager:SetFolder("/CrazyDay/ALS/"..game.Players:GetUserIdFromNameAsync(game.Players.LocalPlayer.Name))
    SaveManager:SetFolder("/CrazyDay/ALS/"..game.Players:GetUserIdFromNameAsync(game.Players.LocalPlayer.Name))
    InterfaceManager:BuildInterfaceSection(Tabs.Settings)
    SaveManager:BuildConfigSection(Tabs.Settings)
    Window:SelectTab(1)
    SaveManager:LoadAutoloadConfig()
    
    end -- End Of Do
    end -- End of If

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
                if not game:GetService("ReplicatedStorage"):FindFirstChild("ZonePlusReference") then
                game:WaitForChild("CoreGui"):WaitForChild("CurrentTime"):FindFirstChild("CureentTime").Text = "Time : "..tostring(Workspace.DistributedGameTime)
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

    coroutine.resume(coroutine.create(function()
        pcall(function()
                game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(Kick)
                    if ((Kick.Name == "ErrorPrompt") and Kick:FindFirstChild("MessageArea") and Kick.MessageArea:FindFirstChild("ErrorFrame")) then
                        if Options.AutoRejoinError.Value then
                            game:GetService("TeleportService"):Teleport(12886143095)
                        end
                    end
                end)
            end)
    end))

    coroutine.resume(coroutine.create(function()
        game.Players.LocalPlayer.OnTeleport:Connect(function(State)
            local QueueOnTeleport = queue_on_teleport or queueonteleport or (syn and syn.queue_on_teleport)
            local script = 
            [[
                repeat wait() until game:IsLoaded()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Mangadexwannatest/CanislupusXHUB/main/Anime%20Last%20Stand.lua"))()
        
            local success = pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Mangadexwannatest/CanislupusXHUB/main/Anime%20Last%20Stand.lua"))()
             end)
             
             print(success)
             if not success then
                wait(20)
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Mangadexwannatest/CanislupusXHUB/main/Anime%20Last%20Stand.lua"))()
             end
            ]]
            if State == Enum.TeleportState.InProgress and Options.AutoExecuteScript.Value then
                QueueOnTeleport(script)
                end
        end)
    end))
