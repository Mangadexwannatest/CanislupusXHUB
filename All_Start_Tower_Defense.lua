   
   repeat task.wait() until game:IsLoaded() and not game.Players.LocalPlayer.PlayerGui:WaitForChild("LoadingScreen").Frame.Visible
   repeat wait(0.2) until game.Players.LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("HUD")
   game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart')
   game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("HUD"):WaitForChild("NextWaveVote")

   if game.CoreGui:FindFirstChild("CrazyDay") == nil then
       warn("Loading Gui..")
   

    local firesignal = function(signal, arg2)
        if getconnections(signal) then
            firesignal(signal, arg2)
        end
    end
    
   local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
   local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
   local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
   
   -- Ui
   local Window = Fluent:CreateWindow({
       Title = "All Star Tower Defense",
       SubTitle = "Last Update April/25/2024 [YT:CrazyDay/edek#1004]",
       TabWidth = 160,
       Size = UDim2.fromOffset(580, 460),
       Acrylic = true,
       Theme = "Dark",
       MinimizeKey = Enum.KeyCode.LeftControl
   })
   local Tabs = {
       Main = Window:AddTab({ Title = "Main", Icon = "" }),
       Webhook = Window:AddTab({ Title = "Webhook", Icon = ""}),
       Other = Window:AddTab({ Title = 'Other' , Icon = ""}),
       Settings = Window:AddTab({ Title = "Settings", Icon = "" })
   }
   
   local Options = Fluent.Options
   getgenv().Recording = {}
   local Macro_Files = {}
   local HUB = '/CrazyDay/'..game.Players.LocalPlayer.Name.."_All_Star_Tower_Defense/Macro"
   
   do

        if not isfolder("CrazyDay") then 
        repeat wait()
            makefolder("CrazyDay")
        until isfolder("CrazyDay")
        warn('make folder 1')
        end
        if isfolder("CrazyDay") then
            if not isfolder("CrazyDay/"..game.Players.LocalPlayer.Name.."_All_Star_Tower_Defense") then
                repeat wait()
                makefolder("/CrazyDay/"..game.Players.LocalPlayer.Name.."_All_Star_Tower_Defense")
            until isfolder("CrazyDay/"..game.Players.LocalPlayer.Name.."_All_Star_Tower_Defense")
            warn('make folder 2')
            end
        end

    function MakeFolder()
        if not isfolder(HUB) then 
            makefolder(HUB)
        end
    end

    function List()
        repeat 
            MakeFolder()
            wait() 
        until isfolder(HUB)
        if isfolder(HUB) then
            local List = listfiles(HUB)
            for i,v in next,List do
                table.insert(Macro_Files,string.split(v,"/")[5]:split(".")[1])
                    end
                end
            end
        
    List()
    local MacroOptions = Tabs.Main:AddDropdown("OptionsMacro", {
        Title = "Select File",
        Description = nil,
        Values = Macro_Files,
        Multi = false,
        Default = nil,
    })

    local Action = Tabs.Main:AddDropdown("Action", {
        Title = "Select Actions",
        Description = nil,
        Values = {"Wave","Money","Time","Game Speed","Skip Wave","UseSpecialMove","Auto Activate"},
        Multi = true,
        Default = {"Wave","Money","Time","Game Speed","Skip Wave","UseSpecialMove","Auto Activate"},
    })

    local Input = Tabs.Main:AddInput("Input", {
        Title = "Creat macro files",
        Description = nil,
        Default = nil,
        Placeholder = "nil",
        Numeric = false,
        Finished = true,
        Callback = function(bool)
            writefile(string.format(HUB.."/%s.lua", bool)	, "")
            table.clear(Macro_Files)
            List()
            MacroOptions:SetValue(nil)
            MacroOptions:SetValues(Macro_Files)
            Fluent:Notify({
                Title = "Creat succeed",
                Content = "Macro name",
                SubContent = bool,
                Duration = 5 
        })
        end
    })


    local RecordToggle = Tabs.Main:AddToggle("Record", {Title = "Macro Record", Default = false })
    local PlayToggle = Tabs.Main:AddToggle("Play", {Title = "Macro Play", Default = false })

    Tabs.Main:AddSection('Other')

    Tabs.Main:AddDropdown("Speed", {
        Title = "Select Game Speed",
        Description = nil,
        Values = {"2X","3X"},
        Multi = false,
        Default = 1,
    })
    
        Tabs.Main:AddDropdown("Ended_Action", {
        Title = "Select Action",
        Description = nil,
        Values = {"Replay","Return","Next"},
        Multi = false,
        Default = 1,
    })

    Tabs.Main:AddToggle("SPEED", {Title = "Auto Game Speed", Default = false })
    Tabs.Main:AddToggle("Replay_Return_Next", {Title = "Auto Replay // Return // Next", Default = false })


    Action:OnChanged(function(Value)
        local Values = {}
        for Value, State in next, Value do
            table.insert(Values, Value)
        end
        if table.find(Values,"Wave") and not getgenv().Wave_Read then
            getgenv().Wave_Read = true
        end
        if table.find(Values,"Money") and not getgenv().Money_Read then
            getgenv().Money_Read = true
        end 
        if table.find(Values,"Time") and not getgenv().Time_Read then
            getgenv().Time_Read = true
        end 
        if table.find(Values,"Game Speed") and not getgenv().GameSpeed_Read then
            getgenv().GameSpeed_Read = true
        end 
        if table.find(Values,"Skip Wave") and not getgenv().SkipWave_Read then
            getgenv().SkipWave_Read = true
        end 
        if table.find(Values,"UseSpecialMove") and not getgenv().UseSpecialMove_Read then
            getgenv().UseSpecialMove_Read = true
        end 
        if table.find(Values,"Auto Activate") and not getgenv().Auto_Activate_Read then
            getgenv().Auto_Activate_Read = true
        end 


        if not table.find(Values,"Wave") and getgenv().Wave_Read then
            getgenv().Wave_Read = false
        end
        if not table.find(Values,"Money") and getgenv().Money_Read then
            getgenv().Money_Read = false
        end 
        if not table.find(Values,"Time") and getgenv().Time_Read then
            getgenv().Time_Read = false
        end 
        if not table.find(Values,"Game Speed") and getgenv().GameSpeed_Read then
            getgenv().GameSpeed_Read = false
        end 
        if not table.find(Values,"Skip Wave") and not getgenv().SkipWave_Read then
            getgenv().SkipWave_Read = false
        end 
        if not table.find(Values,"UseSpecialMove") and getgenv().UseSpecialMove_Read then
            getgenv().UseSpecialMove_Read = false
        end 
        if not table.find(Values,"Auto Activate") and getgenv().Auto_Activate_Read then
            getgenv().Auto_Activate_Read = false
        end 


    end)

    Tabs.Main:AddParagraph({
        Title = "OTHER",
        Content = "WAIT FOR UPDATE"
    })

    Tabs.Webhook:AddParagraph({
        Title = "WEBHOOK",
        Content = "WAIT FOR UPDATE"
    })

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

    white:OnChanged(function()
        if Options.AutoWhiteScreen.Value then
            game:GetService("RunService"):Set3dRenderingEnabled(false)
        else
            game:GetService("RunService"):Set3dRenderingEnabled(true)
        end
    end)

    RecordToggle:OnChanged(function()
        if Options.Record.Value then
            getgenv().Recording = {}
            repeat wait() until not Options.Record.Value or game.Players.LocalPlayer.PlayerGui.HUD.MissionEnd.Visible
            Fluent:Notify({
                Title = "Record Ended",
                Content = "Macro name",
                SubContent = Options.OptionsMacro.Value,
                Duration = 5 })
                writefile(string.format(HUB.."/%s.lua",Options.OptionsMacro.Value), game:GetService("HttpService"):JSONEncode(getgenv().Recording))
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

    getgenv().AutoToggle = nil
    local Mouse = game.Players.LocalPlayer:GetMouse()
    local UserInput = game:GetService("UserInputService")
    local Enum_input = Enum.UserInputType
    local UnitSelect
    local Unit_Name
    local Connect_1
    local Auto = game.Players.LocalPlayer.PlayerGui.HUD:WaitForChild("UpgradeV2"):WaitForChild("SpecialButton"):WaitForChild("Auto")
    local UserAbility = game.Players.LocalPlayer.PlayerGui.HUD:WaitForChild("UpgradeV2"):WaitForChild("SpecialButton")
    UserInput.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum_input.MouseButton1 or input.UserInputType == Enum_input.MouseButton2 or input.UserInputType == Enum_input.Touch) then
        for i, v in ipairs(game.Workspace.Unit:GetChildren()) do
            for i, v2 in ipairs(v:GetDescendants()) do
                if v2 == Mouse.Target then
                    UnitSelect = nil
                    Unit_Name = nil
                    UnitSelect = v:WaitForChild("HumanoidRootPart").Position
                    Unit_Name = tostring(v.Name)
                   end
                end
            end
        end
    end)
    local function Traget_Time()
        return tonumber(Workspace.DistributedGameTime)
    end
    task.spawn(function ()
        UserAbility.Activated:Connect(function ()
            if not UserAbility.VisualGuide.Visible and Options.Record.Value then
                table.insert(getgenv().Recording, {
                    ["Wave"] = Wave(),
                    ["Time"] = {["Time"] = Traget_Time(), ["Game Speed"] = Time()},
                    ["UseSpecialMove"] = {
                        ["Position"] = tostring(UnitSelect),
                        ["Unit"] = Unit_Name
                    }})
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
                                ["Wave"] = Wave(),
                                ["Time"] = {["Time"] = Traget_Time(), ["Game Speed"] = Time()},
                                ["AutoToggle"] = {
                                    ["Position"] = tostring(UnitSelect),
                                    ["Unit"] = Unit_Name,
                                    ["Value"] = getgenv().AutoToggle,}})
                                Connect_1:Disconnect()
                                Connect_1 = nil
                           end)
                        end
                    end)
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
                    ["Wave"] = Wave(),
                    ["Time"] = {["Time"] = Traget_Time(), ["Game Speed"] = Time()},
                    ["Money"] = MONEY,
                    ["Summon"] = {
                        ["Rotation"] = 0,
                        ["Position"] = tostring(v:WaitForChild("HumanoidRootPart").Position),
                        ["Unit"] = tostring(v.Name)
                    }})
                    end
                end
                task.spawn(function ()
                v:WaitForChild('UpgradeTag'):GetPropertyChangedSignal("Value"):Connect(function() 
                    if tostring(v:WaitForChild("Owner").Value) == game.Players.LocalPlayer.Name then
                    table.insert(getgenv().Recording, {
                        ["Wave"] = Wave(),
                        ["Time"] = {["Time"] = Traget_Time(), ["Game Speed"] = Time()},
                        ["Money"] = string.split(game.Players.LocalPlayer.PlayerGui.HUD.AddedCash.Text,'$')[1]:split('-')[2],
                        ["Upgrade"] = {
                            ["Position"] = tostring(v:WaitForChild("HumanoidRootPart").Position),
                            ["Upgrade#"] = tonumber(v:WaitForChild('UpgradeTag').Value),
                            ["Unit"] = tostring(v.Name)
                        }})    
                      end
                    end)
                 end)
                 task.spawn(function()
                    v:GetPropertyChangedSignal("Parent"):Connect(function()
                        if tostring(v:WaitForChild("Owner").Value) == game.Players.LocalPlayer.Name then
                        table.insert(getgenv().Recording, {
                            ["Wave"] = Wave(),
                            ["Time"] = {["Time"] = Traget_Time(), ["Game Speed"] = Time()},
                            ["Sell"] = {
                                ["Position"] = tostring(v:WaitForChild("HumanoidRootPart").Position),
                                ["Unit"] = tostring(v.Name)
                            }})
                        end
                    end)
                 end)
            end
        end
     end)
end)
task.spawn(function ()
    game.Players.LocalPlayer.PlayerGui.HUD.NextWaveVote.YesButton.Activated:Connect(function()
        if Options.Record.Value then
        table.insert(getgenv().Recording, {
                ["Wave"] = Wave(),
                ["Time"] = {["Time"] = Traget_Time(), ["Game Speed"] = false}})
                -- LLL ใส่ แยกกัน เพราะว่า ตอนแม่ง insert เข้า table มันเอาค่าที่น้อยสุดขึ้้นก่อนส้นตีน
                table.insert(getgenv().Recording, {
                    ["VoteWave"] = {
                        ["Value"] = true,
                        ["Wave"] = Wave()
                    }})
                end
            end)
    game.Players.LocalPlayer.PlayerGui.HUD.NextWaveVote.NoButton.Activated:Connect(function()
        if Options.Record.Value then
        table.insert(getgenv().Recording, {
                ["Wave"] = Wave(),
                ["Time"] = {["Time"] = Traget_Time(), ["Game Speed"] = false}})
                -- LLL ใส่ แยกกัน เพราะว่า ตอนแม่ง insert เข้า table มันเอาค่าที่น้อยสุดขึ้้นก่อนส้นตีน
        table.insert(getgenv().Recording, {
            ["VoteWave"] = {
                ["Value"] = false,
                ["Wave"] = Wave()
            }})
        end
    end)
    game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("HUD"):WaitForChild("FastForward"):WaitForChild("TextLabel"):GetPropertyChangedSignal("Text"):Connect(function ()
        if Options.Record.Value then
            table.insert(getgenv().Recording, {
                ["Wave"] = Wave(),
                ["Time"] = {["Time"] = Traget_Time(), ["Game Speed"] = false}})
                -- LLL ใส่ แยกกัน เพราะว่า ตอนแม่ง insert เข้า table มันเอาค่าที่น้อยสุดขึ้้นก่อนส้นตีน
            table.insert(getgenv().Recording, {
                ["Game Speed On Changed"] = Time()
            })
        end
    end)
end)

        
    --[[ ไม่ใช้ละ ขก ลบ
        local function RotationPoint(String, Separator)
        local Separator = Separator or ','
        local axes = {}
        for axis in String:gmatch('[^'..Separator..']+') do
            axes[#axes + 1] = axis
        end

        return CFrame.new(axes[1], axes[2], axes[3])
    end]]


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
     end
  end
end
end
   local function Get_TheWaveI()
      return game.Players.LocalPlayer.PlayerGui.HUD.NextWaveVote.Visible
  end

    PlayToggle:OnChanged(function()
        if Options.Play.Value then
            repeat wait() until Options.OptionsMacro.Value ~= nil
            for i,v in next, listfiles(HUB) do
                if string.split(v,"/")[5]:split(".")[1] == Options.OptionsMacro.Value then
                    local File = readfile(string.format(HUB.."/%s.lua",string.split(v,"/")[5]:split(".")[1]))
                    getgenv().Playing = game:GetService("HttpService"):JSONDecode(File)
                end
            end
            task.spawn(function()
            warn("PLAY MACRO",#getgenv().Playing)
				for i = 1, #getgenv().Playing do
					for i, v in pairs(getgenv().Playing[i]) do
                        -- Wave
                        if i == "Wave" and getgenv().Wave_Read then
                            repeat wait() until Wave() >= tonumber(v) or not getgenv().Wave_Read
                        -- Time
                        elseif i == "Time" and getgenv().Time_Read then
                            repeat wait() until Traget_Time() >= tonumber(v["Time"]) or not getgenv().Time_Read
                        -- Changed Game Speed
                        elseif i == "Game Speed On Changed" and getgenv().GameSpeed_Read then
                            --Gaem Speed More than 2
                            if tostring(v) ~= "1X" and Time() ~= tostring(v) then
                                repeat 
                                game:GetService("ReplicatedStorage").Remotes.Input:FireServer('SpeedChange',true)
                                task.wait(1)
                                until Time() == tostring(v) or not getgenv().GameSpeed_Read or Options.SPEED.Value 
                                -- Gaem Speed 1X
                            elseif v ==  "1X" and Time() ~= v then
                                    repeat
                                    game:GetService("ReplicatedStorage").Remotes.Input:FireServer('SpeedChange',false)
                                    task.wait(1)
                                    until Time() == v or not getgenv().GameSpeed_Read or Options.SPEED.Value
                                end
                        -- Vote Wave
                        elseif i == "VoteWave" and Wave() <= v["Wave"] then
                            repeat task.wait() until Get_TheWaveI() or Wave() > v["Wave"] -- Wait For Wave Gui
                            repeat SkipWave(v["Value"]) task.wait(0.25)  until not Get_TheWaveI() or Wave() > v["Wave"] -- fire 
                        -- Money
                        elseif i == "Money" then
                            repeat wait() until Money() >= tonumber(v)
                        -- Summon
                        elseif i == "Summon" then
                            repeat
                                local Unit = Verify_Unit(v["Unit"], v["Position"]) -- Check Position
                                game:GetService("ReplicatedStorage").Remotes.Input:FireServer("Summon",{
                                    ["Rotation"] = v["Rotation"],
                                    ["cframe"] = stringtocf(v["Position"]),
                                    ["Unit"] = v["Unit"]
                                })
                                task.wait(0.25)
                            until Unit
                        -- Upgrade
                        elseif i == "Upgrade" then
                            repeat 
                                local Unit_Upgrade = Upgrade(v["Unit"],v["Position"],v["Upgrade#"]) -- Check Upgrade#
                                Upgrade(v["Unit"],v["Position"],v["Upgrade#"])
                                task.wait(0.25)
                            until Unit_Upgrade
                        -- Sell
                        elseif i == "Sell" then
                            repeat 
                                local iS_Unit = Verify_Unit(v["Unit"], v["Position"])
                                    Sell(v["Unit"], v["Position"])
                                task.wait(0.25)
                            until not iS_Unit -- Check if not unit position
                        
                        --Skill Activate
                        elseif i == "UseSpecialMove" then
                            repeat
                                local just_ability = UseSpecialMove(v["Unit"],v["Position"])
                                UseSpecialMove(v["Unit"],v["Position"])
                                task.wait(0.25)
                            until just_ability  -- Check if unit alr ability
                        -- Auto Toggle
                        elseif i == "AutoToggle" then
                            AutoToggleActivate(v["Unit"],v["Position"],v["Value"])
                            -- No check gu tum mai pen 
                     end
                end
			end
        end)
    end
end)

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("CrazyDay")
SaveManager:SetFolder("/CrazyDay/"..game.Players.LocalPlayer.Name.."_All_Star_Tower_Defense")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
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

function unload_ui()
    while wait() do
        if Fluent.Unloaded then 
        game.CoreGui:FindFirstChild("Close/Open"):Destroy()
            break 
         end
    end
end
coroutine.resume(coroutine.create(unload_ui))



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
    local Button = game.CoreGui:FindFirstChild("Close/Open"):FindFirstChild("TextButton")
    Button.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
    for i,v in pairs(game.CoreGui.CrazyDay:GetChildren()) do
            if v.Name == "Frame" and i == 2 then
                v.Visible = not v.Visible
                        end
                    end
                end
           end)
    end))

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
    game.Players.LocalPlayer.PlayerGui.HUD.MissionEnd:GetPropertyChangedSignal('Visible'):Connect(function ()
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


coroutine.resume(coroutine.create(function()
    game.Players.LocalPlayer.OnTeleport:Connect(function(State)
        local QueueOnTeleport = queue_on_teleport or queueonteleport or (syn and syn.queue_on_teleport)
        local script = 
        [[
            repeat wait() until game:IsLoaded()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Mangadexwannatest/CanislupusXHUB/main/All_Start_Tower_Defense.lua"))()
    
        local success = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Mangadexwannatest/CanislupusXHUB/main/All_Start_Tower_Defense.lua"))()
         end)
         
         print(success)
         if not success then
            wait(20)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Mangadexwannatest/CanislupusXHUB/main/All_Start_Tower_Defense.lua"))()
         end
        ]]
        if State == Enum.TeleportState.InProgress and Options.AutoExecuteScript.Value then
            QueueOnTeleport(script)
            end
    end)
end))

end -- End Of If
