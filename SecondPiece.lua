repeat wait() until game:IsLoaded()
repeat task.wait() until game.Workspace.Lives:FindFirstChild(game.Players.LocalPlayer.Name)
game.Workspace.Lives:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid")
game.ReplicatedStorage:WaitForChild("ToolsHandle")
repeat wait() until game.ReplicatedStorage:FindFirstChild("ToolsHandle")
local CrazyDay = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
CrazyDay.Name = "CrazyDay"
CrazyDay.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
CrazyDay.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
TextLabel.Parent = CrazyDay
TextLabel.BackgroundColor3 = Color3.fromRGB(152, 152, 114)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.274865657, 0, 0.185579196, 0)
TextLabel.Size = UDim2.new(0.472983956, 0, 0.472340554, 0)
TextLabel.Font = Enum.Font.Unknown
TextLabel.Text = "Wait For Update"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 100.000
TextLabel.TextWrapped = true
wait(3.5)
CrazyDay:Destroy()
