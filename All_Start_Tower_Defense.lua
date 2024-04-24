   
   repeat wait() until game:IsLoaded()
   repeat wait(0.2) until game.Players.LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("HUD")
   game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart')

   if game.CoreGui:FindFirstChild("CrazyDay") == nil then
       warn("Loading Gui..")
   
   local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
   local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
   local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
   
   -- Ui
   local Window = Fluent:CreateWindow({
       Title = "All Star Tower Defense",
       SubTitle = "Last Update April/21/2024 [YT:CrazyDay/edek#1004]",
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
   local Time
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
        Values = {"Wave","Money"},
        Multi = true,
        Default = {"Wave","Money"},
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

    local XSPEED = Tabs.Main:AddDropdown("Speed", {
        Title = "Select speed",
        Description = nil,
        Values = {"1X","2X"},
        Multi = false,
        Default = 2,
    })
    
        Tabs.Main:AddDropdown("Ended_Action", {
        Title = "Select Action",
        Description = nil,
        Values = {"Replay","Return","Next"},
        Multi = false,
        Default = 1,
    })

    Tabs.Main:AddToggle("SPEED", {Title = "Auto speed", Default = false })
    Tabs.Main:AddToggle("MissionEnded", {Title = "Auto MissionEnded", Default = false })


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
        if not table.find(Values,"Wave") and getgenv().Wave_Read then
            getgenv().Wave_Read = false
        end
        if not table.find(Values,"Money") and getgenv().Money_Read then
            getgenv().Money_Read = false
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

    white:OnChanged(function()
        if Options.AutoWhiteScreen.Value then
            game:GetService("RunService"):Set3dRenderingEnabled(false)
        else
            game:GetService("RunService"):Set3dRenderingEnabled(true)
        end
    end)

    RecordToggle:OnChanged(function()
        if Options.Record.Value then
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
        return string.split(game.Players.LocalPlayer.PlayerGui.HUD.Wave.Text,'/')[1]:split(' ')[2]
    end

    local function Money()
        return game.Players.LocalPlayer.Money.Value
    end
    

    game.Workspace.Unit.ChildAdded:Connect(function(v)
        if Options.Record.Value then
        v:WaitForChild("HumanoidRootPart") 
        v:WaitForChild("Owner")
        if tostring(v.Owner.Value) == game.Players.LocalPlayer.Name then
            if v:FindFirstChild("UpgradeTag").Value >= 0 then
                if tostring(game.Players.LocalPlayer.PlayerGui.HUD.Wave.Text) ~= "-Wave-" then
                table.insert(getgenv().Recording, {["Wave"] = Wave() })
                end
    
                for ii,vv in next,game.Players.LocalPlayer.PlayerGui.HUD.BottomFrame.Unit:GetChildren() do
                    if vv:IsA("Frame") and tostring(vv.Unit.Value) == tostring(v.Name) then
                        local MONEY = vv:FindFirstChild("ImageLabel"):FindFirstChild("TextLabel").Text
                table.insert(getgenv().Recording, {["Money"] = MONEY })
                    end
                end
                table.insert(getgenv().Recording, {["Place"] = {["Position"] = tostring(v:WaitForChild("HumanoidRootPart").Position) , ["Unit"] = tostring(v.Name) }})
                
                task.spawn(function ()
                v:FindFirstChild('UpgradeTag'):GetPropertyChangedSignal("Value"):Connect(function() 
                    if tostring(v.Owner.Value) == game.Players.LocalPlayer.Name then
                    table.insert(getgenv().Recording, {["Wave"] = Wave() })
                    table.insert(getgenv().Recording, {["Money"] = string.split(game.Players.LocalPlayer.PlayerGui.HUD.AddedCash.Text,'$')[1]:split('-')[2] })

                    table.insert(getgenv().Recording, {["Upgrade"] = {["Position"] = tostring(v:FindFirstChild("HumanoidRootPart").Position) ,["UpgradeTag"] = tonumber(v:FindFirstChild('UpgradeTag').Value), ["Unit"] = tostring(v.Name) }})
                    end
                end)
                v:GetPropertyChangedSignal("Parent"):Connect(function()
                    Time = tick()
                    if not Time then
                        Time = tick()
                    end
                    if tostring(v.Owner.Value) == game.Players.LocalPlayer.Name then
                    table.insert(getgenv().Recording, {["Wave"] = Wave() })
                    table.insert(getgenv().Recording, {['Wait'] = tick() - Time})
                    Time = tick()

                    table.insert(getgenv().Recording, {["Sell"] = {["Unit"] = tostring(v.Name) , ['Position'] =  tostring(v:FindFirstChild("HumanoidRootPart").Position)}})

                      end
                 end)
              end)
            end
        end
    end  
end)

    local function PlaceUnit(CFrame,Unit)
        local args = {
        [1] = "Summon",
        [2] = {
        ["Rotation"] = 0,
        ["cframe"] = CFrame,
        ["Unit"] = Unit
        }}
        game:GetService("ReplicatedStorage").Remotes.Input:FireServer(unpack(args))
    end

    local function stringtocf(str)
        return CFrame.new(table.unpack(str:gsub(" ", ""):split(",")))
    end
    local function stringtopos(str)
        return Vector3.new(table.unpack(str:gsub(" ", ""):split(",")))
    end

    local function Upgrade(Unit,Position,UpgradeTag)
        if type(Position) == "string" then
            Position = stringtopos(Position)
        end
        for i,v in pairs(game.Workspace.Unit:GetChildren()) do
        if v.Name == Unit and v.HumanoidRootPart.CFrame == Position or (v.HumanoidRootPart.Position - Position).magnitude < 2 then 
        if tonumber(v.UpgradeTag.Value) ~= tonumber(UpgradeTag) and tostring(v.Owner.Value) == game.Players.LocalPlayer.Name then
        local args = {
            [1] = "Upgrade",
            [2] = v
        }
        
        game:GetService("ReplicatedStorage").Remotes.Server:InvokeServer(unpack(args))
                end
            end
        end
    end

    local function Sell(Unit,Position)
        if type(Position) == "string" then
            Position = stringtopos(Position)
        end
        for i,v in pairs(game.Workspace.Unit:GetChildren()) do
            if v.Name == Unit and v.HumanoidRootPart.CFrame == Position or (v.HumanoidRootPart.Position - Position).magnitude < 2 then 
                if tostring(v.Owner.Value) == game.Players.LocalPlayer.Name then
               local args = {
               [1] = "Sell",
               [2] = v
            }
             
            game:GetService("ReplicatedStorage").Remotes.Input:FireServer(unpack(args))
            end
         end
     end
 end
        
    --[[ ไม่ใช้ละ ขก ลบ
        local function RotationPoint(String, Separator)
        local Separator = Separator or ','
        local axes = {}
        for axis in String:gmatch('[^'..Separator..']+') do
            axes[#axes + 1] = axis
        end

        return CFrame.new(axes[1], axes[2], axes[3])
    end]]


    local function Verify_Unit(Position, NAME)
        if type(Position) == "string" then
            Position = stringtopos(Position)
        end
        for i, v in pairs(game.Workspace.Unit:GetChildren()) do
            if v.HumanoidRootPart.CFrame == Position or (v.HumanoidRootPart.Position - Position).magnitude < 2 then
                v:WaitForChild('Owner')
                if tostring(v.Owner.Value) == game.Players.LocalPlayer.Name then
                return v
                end
            end
        end
    end

    local function Verify_Unit_Upgrade(Position,UpgradeTag)
        if type(Position) == "string" then
            Position = stringtopos(Position)
        end
        for i, v in pairs(game.Workspace.Unit:GetChildren()) do
            if  v.HumanoidRootPart.CFrame == Position or (v.HumanoidRootPart.Position - Position).magnitude < 2 then 
                v:WaitForChild('Owner')
                if tonumber(v.UpgradeTag.Value) == tonumber(UpgradeTag) and tostring(v.Owner.Value) == game.Players.LocalPlayer.Name then
                warn('Upgrade : '..UpgradeTag)
                return v
                end
            end
        end
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
					for ii, vv in pairs(getgenv().Playing[i]) do
                        if ii == "Wave" and getgenv().Wave_Read then
                            warn('WAIT FOR WAVE  : '..vv)
                            repeat task.wait() until tostring(game.Players.LocalPlayer.PlayerGui.HUD.Wave.Text) ~= "-Wave-"
                            repeat wait() until tonumber(Wave()) >= tonumber(vv) or not getgenv().Wave_Read
                        elseif ii == "Money" and getgenv().Money_Read then
                            warn('WAIT FOR MONEY  : '..vv)
                            repeat wait() until tonumber(Money()) >= tonumber(vv) or not getgenv().Money_Read
                        elseif ii == 'Wait' then
                            warn('Wait : '..vv)
                            task.wait(vv)
                        elseif ii == "Place" then
                                repeat 
                                local Unit = Verify_Unit(vv['Position'], vv['Unit']) 
								PlaceUnit(stringtocf(vv["Position"]),vv["Unit"])
                                task.wait(0.25)
                                until Unit or not Options.Play.Value
                                warn('Place Unit : '..vv['Unit'])
                        elseif ii == "Upgrade" then
                                repeat 
                                local Upgarde_check = Verify_Unit_Upgrade(vv['Position'],vv['UpgradeTag'])
                                Upgrade(vv["Unit"],vv["Position"],vv["UpgradeTag"])
                                task.wait(0.35)
                                until Upgarde_check or not Options.Play.Value
                        elseif  ii == "Sell" then
                                repeat
                                local Sell_Check =  Verify_Unit(vv['Position'],vv['Unit'])
                                Sell(vv['Unit'],vv['Position'])
                                task.wait(0.35)
                                warn('Sell Unit : '..vv['Unit'])
                                until not Sell_Check
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

local firesignal = function(signal, arg2)
    if getconnections(signal) then
        firesignal(signal, arg2)
    end
end

coroutine.resume(coroutine.create(function()
    game.Players.LocalPlayer.PlayerGui.HUD.MissionEnd:GetPropertyChangedSignal('Visible'):Connect(function ()
        repeat wait(0.25) until Options.MissionEnded.Value
        if Options.MissionEnded.Value then
            repeat wait(0.15)
            firesignal(game.Players.LocalPlayer.PlayerGui.HUD.MissionEnd.BG.Actions[Options.Ended_Action.Value].Activated,game.Players.LocalPlayer)
            until not game.Players.LocalPlayer.PlayerGui.HUD.MissionEnd.Visible or not Options.MissionEnded.Value
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
            repeat wait(1)
            game:GetService("ReplicatedStorage").Remotes.Input:FireServer('SpeedChange',true)
            until tostring(game.Players.LocalPlayer.PlayerGui.HUD.FastForward.TextLabel.Text) == "2X" or not Options.SPEED.Value or Options.Speed.Value ~= "2X"
        elseif Options.SPEED.Value and Options.Speed.Value == "1X" and tostring(game.Players.LocalPlayer.PlayerGui.HUD.FastForward.TextLabel.Text) ~= "1X" then
            repeat wait(1)
            game:GetService("ReplicatedStorage").Remotes.Input:FireServer('SpeedChange',false)
            until tostring(game.Players.LocalPlayer.PlayerGui.HUD.FastForward.TextLabel.Text) == "1X" or not Options.SPEED.Value or Options.Speed.Value ~= "1X"
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
