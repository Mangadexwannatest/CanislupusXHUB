repeat task.wait() until game:IsLoaded()
   if game.PlaceId == 1499872953 then

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({Name = "CanisLupus X Hub",LoadingTitle = "CanisLupusX",LoadingSubtitle = "By CanisLupusX",ConfigurationSaving = {Enabled = true,FolderName = "CanisLupusX",FileName = "BoKuNoRoblox_"..game.Players.LocalPlayer.Name},
Discord = {Enabled = true,Invite = "https://discord.gg/GCtRvfNp",RememberJoins = false},
KeySystem = false,KeySettings = {Title = "Sirius Hub",Subtitle = "Key System",Note = "Join the discord (discord.gg/sirius)",FileName = "SiriusKey",SaveKey = true,GrabKeyFromSite = false,Key = "Hello"}})
local Tab = Window:CreateTab("Main", 4483362458)
local Tab2 = Window:CreateTab("Status", 4483362458)
local Tab3 = Window:CreateTab("Misc", 4483362458)
local Section = Tab:CreateSection("Main")
local Section2 = Tab2:CreateSection("Status")
local Section3 = Tab3:CreateSection("Misc")
--------------------------------------------// Local Misc \\--------------------------------------------

local questname = game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestObjectives.NPCName
local amoutquest = game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestObjectives.KilledAmount
local lvlplr = game:GetService("Workspace").S1c2R5i66p5t5s51.PlayerData[game.Players.LocalPlayer.Name].Level
local cash = game:GetService("Workspace").S1c2R5i66p5t5s51.PlayerData[game.Players.LocalPlayer.Name].Cash
local plr = game.Players.LocalPlayer.Character


--------------------------------------------// E N D \\------------------------------------------------


Rayfield:Notify({Title = "Welcome to CanisLupusX Hub",Content = "Thank for user we script!",Duration = 6.5,Image = 4483362458,Actions = {Ignore = {Name = "Okay!",Callback = function()end},},})

local Paragraph = Tab:CreateParagraph({Title = "T.I.P", Content = "Up only strength stats for ez farm"})
local Label1 = Tab:CreateLabel("Time | ")
local Label2 = Tab:CreateLabel("Status | ....... ")

Tab:CreateToggle({Name = "Auto Level",CurrentValue = getgenv().Autolvl,Flag = "AutoLvl",Callback = function(Value)
  getgenv().Autolvl = Value
end,})

Tab2:CreateToggle({Name = "Strength",CurrentValue = getgenv().AutoStrenght,Flag = "Strength",Callback = function(Value)
  getgenv().AutoStrenght = Value
end,})

Tab2:CreateToggle({Name = "Agility",CurrentValue = getgenv().Agility,Flag = "Agility",Callback = function(Value)
  getgenv().AutoAgility = Value
end,})

Tab2:CreateToggle({Name = "Durability",CurrentValue = getgenv().Durability,Flag = "Durability",Callback = function(Value)
  getgenv().AutoDurability = Value
end,})


Tab3:CreateParagraph({Title = "Auto Rejoin ⬇", Content = "if player got kick or have error ui will automatic rejoin"})
Tab3:CreateToggle({Name = "Auto Rejoin",CurrentValue = getgenv().autorejoin,Flag = "AutoRejoin",Callback = function(Value)
  getgenv().autorejoin = Value
end,})

--------------------------------------------// function \\--------------------------------------------

ClickEquipButton=function()for i,v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.MainMenus.WeaponsMenu.Equipbutton[v])) do v:Fire()end end end
SelectPistols=function()for i,v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.MainMenus.WeaponsMenu.ScrollingFrame.Pistol.Button[v])) do v:Fire() end end end
ClickCode=function()for i,v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.MainMenus.CodesMenu.Confirm[v])) do v:Fire() end end end
SelectPistolsToBuy=function()for i,v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.NewWeaponShop.ShopFrame.WeaponShop.Scroll.Pistol[v])) do v:Fire() end end end
ConfirmBuy=function()for i,v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.NewWeaponShop.ShopFrame.WeaponShop.ItemFrame.Buy[v])) do v:Fire() end end end
GetSubPrefix=function(a) local a=tostring(a):gsub(" ","");local bX="";if#a==2 then local Yp=string.sub(a,#a,#a+1);bX=Yp=="1"and"st"or Yp=="2"and"nd"or Yp=="3"and"rd"or"th";end;return bX;end;

local h = "%A, %B"
local t = os.date(" %d",os.time())
local l = ", %Y."
h=os.date(h,os.time())..t..GetSubPrefix(t)..os.date(l,os.time());

spawn(function()
    while task.wait() do
    pcall(function()
        getgenv().Current_Time = "N/A"
        Label1:Set(("Time | %s "):format(getgenv().Current_Time))
            local a=math.floor(workspace.DistributedGameTime);
            local bR=math.floor(workspace.DistributedGameTime/60);
            local rR=math.floor(workspace.DistributedGameTime/60/60);
            if rR < 1 then
                if bR < 1 then
                    getgenv().Current_Time = a.."s";
                else
                    getgenv().Current_Time = bR.." m, "..a.." s";
                end;
                else getgenv().Current_Time = rR.." h, "..bR.." m, "..a.." s";
            end
            Label1:Set(("Time | %s "):format(getgenv().Current_Time))
      end)
   end
end)
        

local metatable = getrawmetatable(game)
local nc = metatable.namecall

setreadonly(metatable, false)

metatable.namecall = newcclosure(function(self, ...)
        local args = {...} 
        local name = self
    if getnamecallmethod() == "FireServer" and tostring(name) == "ExploitKick" then
            return nil
    end
    return nc(self,...)
end)

setreadonly(metatable, true)

--------------------------------------------// Script Call \\--------------------------------------------
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().autorejoin and game.PlaceId == 1499872953 then
                for i,v in pairs(game:GetService("CoreGui").RobloxPromptGui:GetDescendants()) do
                 if v.Name == 'ErrorPrompt' then
            game:GetService("TeleportService"):Teleport(1499872953)
                       end
                   end
                end
            end)
        end
    end)


spawn(function()
    while wait() do
        pcall(function()
            if game:GetService("Players").LocalPlayer.PlayerGui.IntroGui.Menu.Visible == true then
              for i,v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do 
                  for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.IntroGui.Menu.Center.StartButton[v])) do v:Fire()
                end 
             end
          end
      end)
   end
end)

spawn(function()
    while wait(10) do
        pcall(function()
            if game:GetService("Players").LocalPlayer.PlayerGui.IntroGui.Menu.Visible == true and string.find(game:GetService("Players").LocalPlayer.PlayerGui.IntroGui.Menu.Center.StartButton.Text,"Loading") then
    game:GetService("TeleportService"):Teleport(1499872953)
            end
        end)
    end
end)




spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().Autolvl and game.PlaceId == 1499872953 then
        if not game:GetService("Players").LocalPlayer.PlayerGui.MainMenus.WeaponsMenu.ScrollingFrame:FindFirstChild("Pistol") then
        Label2:Set("Status | Filling Code ....")
        game:GetService("Players").LocalPlayer.PlayerGui.MainMenus.CodesMenu.EnterCode.Text = "InfiniteRaid!"
        Label2:Set("Status | Filling Code ... InfiniteRaid")
        ClickCode()
        Label2:Set("Status | Filling Code ... InfiniteRaid")
        wait(11)
        game:GetService("Players").LocalPlayer.PlayerGui.MainMenus.CodesMenu.EnterCode.Text = "ThanksFor570k!"
        Label2:Set("Status | Filling Code ... ThanksFor570k")
        ClickCode()
        Label2:Set("Status | Filling Code ... ThanksFor570k")
        wait(11)
        game:GetService("Players").LocalPlayer.PlayerGui.MainMenus.CodesMenu.EnterCode.Text = "echoeyesonYT5K"
        Label2:Set("Status | Filling Code ... echoeyesonYT5K")
        ClickCode()
        Label2:Set("Status | Filling Code ... echoeyesonYT5K")
        wait(11)
        game:GetService("Players").LocalPlayer.PlayerGui.MainMenus.CodesMenu.EnterCode.Text = "Sc4rySkel3ton"
        Label2:Set("Status | Filling Code ... Sc4rySkel3ton")
        ClickCode()
        Label2:Set("Status | Filling Code ... Sc4rySkel3ton")
        wait(11)
        game:GetService("Players").LocalPlayer.PlayerGui.MainMenus.CodesMenu.EnterCode.Text = "newu1s"
        Label2:Set("Status | Filling Code ... newu1s")
        ClickCode()
        Label2:Set("Status | Filling Code ... newu1s")
        wait(11)
        game:GetService("Players").LocalPlayer.PlayerGui.MainMenus.CodesMenu.EnterCode.Text = "1MFAVS"
        Label2:Set("Status | Filling Code ... 1MFAVS")
        ClickCode()
        Label2:Set("Status | Filling Code ... 1MFAVS")
        wait(11)
        Label2:Set("Status | All codes have been used")
                  end
            end
        end)
     end
end)


spawn(function()
    while wait() do
        pcall(function()
            if getgenv().Autolvl and game.PlaceId == 1499872953  then
            if not game:GetService("Players").LocalPlayer.PlayerGui.MainMenus.WeaponsMenu.ScrollingFrame:FindFirstChild("Pistol") then
                for i,v in pairs(game:GetService("Workspace").InteractionNPCS:GetChildren()) do
    if v.Name == "MeiHatsume" and not game:GetService("Players").LocalPlayer.PlayerGui.MainMenus.WeaponsMenu.ScrollingFrame:FindFirstChild("Pistol") then
        local rang = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude 
        if rang > 100 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(453.724945, 1899.05713, -143.699966, 0.037670821, -5.62321176e-08, 0.999290228, 7.65957608e-09, 1, 5.5983314e-08, -0.999290228, 5.54520163e-09, 0.037670821)
        wait(2.5)
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, nil)
        repeat wait() until rang < 100
                            end
                        end
                   end
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if getgenv().Autolvl and game.PlaceId == 1499872953 then
            if cash.Value >= 100000 then
                if not game:GetService("Players").LocalPlayer.PlayerGui.MainMenus.WeaponsMenu.ScrollingFrame:FindFirstChild("Pistol") then
                Label2:Set("Status | Buying Weapon .... Pistol")
                SelectPistolsToBuy()
                wait(2.5)
                ConfirmBuy()
                      end
                 end
            end
        end)
    end
end)



spawn(function()
    while wait() do
        pcall(function()
            if getgenv().Autolvl and game.PlaceId == 1499872953 then
            if game:GetService("Players").LocalPlayer.PlayerGui.MainMenus.WeaponsMenu.ScrollingFrame:FindFirstChild("Pistol") then
        SelectPistols()
        if  game:GetService("Players").LocalPlayer.PlayerGui.MainMenus.WeaponsMenu.CenterInfo.Text ~= "★★★" and game:GetService("Players").LocalPlayer.PlayerGui.MainMenus.WeaponsMenu.ScrollingFrame:FindFirstChild("Pistol") then 
            game:GetService("ReplicatedStorage").WeaponShop.Item:FireServer("Pistol")
            game:GetService("ReplicatedStorage").WeaponShop.Item:FireServer("Pistol")
            game:GetService("ReplicatedStorage").WeaponShop.Item:FireServer("Pistol")
                   end
               end
            end
        end)
     end
end)

spawn(function()
    while wait(1) do
        pcall(function()
            if getgenv().Autolvl and game.PlaceId == 1499872953 then
        if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.MainMenus.Inventory.WepName.Text,"Pistols")
        and game:GetService("Players").LocalPlayer.PlayerGui.MainMenus.WeaponsMenu.ScrollingFrame:FindFirstChild("Pistol") then
        Label2:Set("Status | Equiping Weapon .... Pistol")
        SelectPistols()
        ClickEquipButton()
                end
           end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if getgenv().Autolvl and game.PlaceId == 1499872953 then
            if string.find(game:GetService("Players").LocalPlayer.PlayerGui.MainMenus.Inventory.WepName.Text,"Pistols") or game:GetService("Players").LocalPlayer.PlayerGui.MainMenus.Inventory.WepName.Text == "Pistol" then
if lvlplr.Value <= 49 and questname.Text ~= "Defeat Criminal" and amoutquest.Text == "" then
        game:GetService("ReplicatedStorage").Remotes.Quest.AcceptQuest:FireServer("Injured Man","Quest")
elseif lvlplr.Value <= 49 and amoutquest.Text == "15/15" then
        game:GetService("ReplicatedStorage").Remotes.Quest.CompleteQuest:FireServer("Injured Man","Quest")
elseif lvlplr.Value >= 50 and questname.Text == "Defeat Criminal" then
game:GetService("ReplicatedStorage").Remotes.Quest.CancelQuest:FireServer("CancelQuestScript")

elseif lvlplr.Value <= 199 and lvlplr.Value >= 50 and questname.Text ~= "Defeat UA Student" and amoutquest.Text == "" then
game:GetService("ReplicatedStorage").Remotes.Quest.AcceptQuest:FireServer("Suspicious Character","Quest")
elseif lvlplr.Value <= 199 and lvlplr.Value >= 50 and amoutquest.Text == "15/15" then
    game:GetService("ReplicatedStorage").Remotes.Quest.CompleteQuest:FireServer("Suspicious Character","Quest")
elseif lvlplr.Value >= 200 and questname.Text == "Defeat UA Student" then   
game:GetService("ReplicatedStorage").Remotes.Quest.CancelQuest:FireServer("CancelQuestScript")


                  end
             end
        end 
     end)
   end
end)


spawn(function()
    while wait() do 
        pcall(function() 
             if getgenv().Autolvl and game.PlaceId == 1499872953 then
                 if questname.Text == "" and amoutquest.Text ~= "" then
            game:GetService("ReplicatedStorage").Remotes.Quest.CancelQuest:FireServer("CancelQuestScript")
                 end
             end
        end)
     end
end)


spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().Autolvl and game.PlaceId == 1499872953 then
            if string.find(game:GetService("Players").LocalPlayer.PlayerGui.MainMenus.Inventory.WepName.Text,"Pistols") or game:GetService("Players").LocalPlayer.PlayerGui.MainMenus.Inventory.WepName.Text == "Pistol" then
                
               setfflag("HumanoidParallelRemoveNoPhysics", "false")
                setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "false")
                game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
               v:Disable()
            end
        end)
    end
end)


spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().Autolvl and game.PlaceId == 1499872953 then
            if string.find(game:GetService("Players").LocalPlayer.PlayerGui.MainMenus.Inventory.WepName.Text,"Pistols") or game:GetService("Players").LocalPlayer.PlayerGui.MainMenus.Inventory.WepName.Text == "Pistol" then
        for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
        if lvlplr.Value <= 49 and v.Name == 'Criminal' and v.Humanoid.Health ~= 0  then
   repeat task.wait()
   Label2:Set("Status | Farming : Criminal".." | Health : "..v.Humanoid.Health.." / "..v.Humanoid.MaxHealth)
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,-180,0) * CFrame.Angles(math.rad(90),0,0)
   game:GetService("Players").LocalPlayer.Character.Main.Swing:FireServer(v.HumanoidRootPart.CFrame)
   until v.Humanoid.Health <= 0 or v.Humanoid.Health == 0 or not getgenv().Autolvl or lvlplr.Value >= 50

    elseif lvlplr.Value <= 199 and lvlplr.Value >= 50 and string.find(v.Name,"UA Student") and v.Humanoid.Health ~= 0 then
               repeat task.wait()
   Label2:Set("Status | Farming : UA Student".." | Health : "..v.Humanoid.Health.." / "..v.Humanoid.MaxHealth)
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,-180,0) * CFrame.Angles(math.rad(90),0,0)
   game:GetService("Players").LocalPlayer.Character.Main.Swing:FireServer(v.HumanoidRootPart.CFrame)
   until v.Humanoid.Health <= 0 or v.Humanoid.Health == 0 or not getgenv().Autolvl or lvlplr.Value >= 200

    elseif lvlplr.Value <= 499 and lvlplr.Value >= 200 and game:GetService("Workspace").NPCs:FindFirstChild("Tomura").Humanoid.Health ~= 0 and v.Name == 'Tomura' and v.Humanoid.Health ~= 0 then
               repeat task.wait()
   Label2:Set("Status | Farming : Tomura".." | Health : "..v.Humanoid.Health.." / "..v.Humanoid.MaxHealth)
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,-180,0) * CFrame.Angles(math.rad(90),0,0)
   game:GetService("Players").LocalPlayer.Character.Main.Swing:FireServer(v.HumanoidRootPart.CFrame)
               until v.Humanoid.Health <= 0 or v.Humanoid.Health == 0 or not getgenv().Autolvl or lvlplr.Value >= 500

    elseif lvlplr.Value <= 499 and lvlplr.Value >= 200 and game:GetService("Workspace").NPCs:FindFirstChild("Tomura").Humanoid.Health == 0 and v.Name == 'Dabi' and v.Humanoid.Health ~= 0 then
               repeat task.wait()
   Label2:Set("Status | Farming : Dabi".." | Health : "..v.Humanoid.Health.." / "..v.Humanoid.MaxHealth)
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,-180,0) * CFrame.Angles(math.rad(90),0,0)
   game:GetService("Players").LocalPlayer.Character.Main.Swing:FireServer(v.HumanoidRootPart.CFrame)
               until v.Humanoid.Health <= 0 or v.Humanoid.Health == 0 or not getgenv().Autolvl or lvlplr.Value >= 500 
   
    elseif lvlplr.Value <= 999 and lvlplr.Value >= 500 and game:GetService("Workspace").NPCs:FindFirstChild("Mount Lady").Humanoid.Health == 0 and v.Name == 'Noumu' and v.Humanoid.Health ~= 0  then
               repeat task.wait()
   Label2:Set("Status | Farming : Noumu".." | Health : "..v.Humanoid.Health.." / "..v.Humanoid.MaxHealth)
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,-180,0) * CFrame.Angles(math.rad(90),0,0)
   game:GetService("Players").LocalPlayer.Character.Main.Swing:FireServer(v.HumanoidRootPart.CFrame)
               until v.Humanoid.Health <= 0 or v.Humanoid.Health == 0 or not getgenv().Autolvl or lvlplr.Value >= 1000
               
    elseif lvlplr.Value <= 999 and lvlplr.Value >= 500 and game:GetService("Workspace").NPCs:FindFirstChild("Mount Lady").Humanoid.Health ~= 0 and v.Name == 'Mount Lady' and v.Humanoid.Health ~= 0 then
               repeat task.wait()
   Label2:Set("Status | Farming : Mount Lady".." | Health : "..v.Humanoid.Health.." / "..v.Humanoid.MaxHealth)
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,-180,0) * CFrame.Angles(math.rad(90),0,0)
   game:GetService("Players").LocalPlayer.Character.Main.Swing:FireServer(v.HumanoidRootPart.CFrame)
               until v.Humanoid.Health <= 0 or v.Humanoid.Health == 0 or not getgenv().Autolvl or lvlplr.Value >= 1000
               
    elseif lvlplr.Value <= 1599 and lvlplr.Value >= 1000 and game:GetService("Workspace").NPCs:FindFirstChild("Overhaul").Humanoid.Health ~= 0 and v.Name == 'Overhaul' and v.Humanoid.Health ~= 0 then
               repeat task.wait()
   Label2:Set("Status | Farming : Overhaul".." | Health : "..v.Humanoid.Health.." / "..v.Humanoid.MaxHealth)
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,-180,0) * CFrame.Angles(math.rad(90),0,0)
   game:GetService("Players").LocalPlayer.Character.Main.Swing:FireServer(v.HumanoidRootPart.CFrame)
               until v.Humanoid.Health <= 0 or v.Humanoid.Health == 0 or not getgenv().Autolvl or lvlplr.Value >= 1600
               
    elseif lvlplr.Value <= 1599 and lvlplr.Value >= 1000 and game:GetService("Workspace").NPCs:FindFirstChild("Overhaul").Humanoid.Health == 0 and v.Name == 'Endeavor' and v.Humanoid.Health ~= 0 then
               repeat task.wait()
   Label2:Set("Status | Farming : Endeavor".." | Health : "..v.Humanoid.Health.." / "..v.Humanoid.MaxHealth)
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,-180,0) * CFrame.Angles(math.rad(90),0,0)
   game:GetService("Players").LocalPlayer.Character.Main.Swing:FireServer(v.HumanoidRootPart.CFrame)
               until v.Humanoid.Health <= 0 or v.Humanoid.Health == 0 or not getgenv().Autolvl or lvlplr.Value >= 1600
               
    elseif lvlplr.Value <= 2299 and lvlplr.Value >= 1600 and game:GetService("Workspace").NPCs:FindFirstChild("Hawks").Humanoid.Health ~= 0 and v.Name == 'Hawks' and v.Humanoid.Health ~= 0 then
               repeat task.wait()
   Label2:Set("Status | Farming : Hawks".." | Health : "..v.Humanoid.Health.." / "..v.Humanoid.MaxHealth)
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,-180,0) * CFrame.Angles(math.rad(90),0,0)
   game:GetService("Players").LocalPlayer.Character.Main.Swing:FireServer(v.HumanoidRootPart.CFrame)
               until v.Humanoid.Health <= 0 or v.Humanoid.Health == 0 or not getgenv().Autolvl or lvlplr.Value >= 1200
               
    elseif lvlplr.Value <= 2299 and lvlplr.Value >= 1600 and game:GetService("Workspace").NPCs:FindFirstChild("Hawks").Humanoid.Health == 0 and v.Name == "Gigantomachia" and v.Humanoid.Health ~= 0 then
               repeat task.wait()
   Label2:Set("Status | Farming : Gigantomachia".." | Health : "..v.Humanoid.Health.." / "..v.Humanoid.MaxHealth)
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,-180,0) * CFrame.Angles(math.rad(90),0,0)
   game:GetService("Players").LocalPlayer.Character.Main.Swing:FireServer(v.HumanoidRootPart.CFrame)
               until v.Humanoid.Health <= 0 or v.Humanoid.Health == 0 or not getgenv().Autolvl or lvlplr.Value >= 1200
               
               
                  end
            end
         end
      end
     end)
   end
end)

spawn(function()
    while wait() do pcall(function() if getgenv().AutoStrenght then game:GetService("ReplicatedStorage").Remotes.Strength:FireServer(1)
end end) end end)

spawn(function()
    while wait() do pcall(function() if getgenv().AutoAgility then game:GetService("ReplicatedStorage").Remotes.Agility:FireServer(1)
end end) end end)

spawn(function()
    while wait() do pcall(function() if getgenv().AutoDurability then game:GetService("ReplicatedStorage").Remotes.Durability:FireServer(1)
end end) end end)

Rayfield:LoadConfiguration()

end
