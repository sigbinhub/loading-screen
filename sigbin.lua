-- SigbinHub Quick Loader with Server Found Confirmation

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create screen GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SigbinHubLoader"
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Welcome Text
local welcomeText = Instance.new("TextLabel")
welcomeText.Size = UDim2.new(1, 0, 1, 0)
welcomeText.Position = UDim2.new(0, 0, 0, 0)
welcomeText.BackgroundTransparency = 1
welcomeText.Text = "Welcome to Sigbin Hub"
welcomeText.TextColor3 = Color3.fromRGB(255, 255, 255)
welcomeText.TextStrokeTransparency = 0.7
welcomeText.TextScaled = true
welcomeText.Font = Enum.Font.GothamBlack
welcomeText.Parent = screenGui

-- Fade out welcome after 3 seconds
task.delay(3, function()
	for i = 1, 30 do
		welcomeText.TextTransparency += 1/30
		welcomeText.TextStrokeTransparency += 1/30
		task.wait(0.03)
	end
	welcomeText:Destroy()
end)

-- Wait for welcome fade
task.wait(3.5)

-- Loading UI container
local container = Instance.new("Frame")
container.Size = UDim2.new(0, 500, 0, 300)
container.Position = UDim2.new(0.5, 0, 0.5, 0)
container.AnchorPoint = Vector2.new(0.5, 0.5)
container.BackgroundTransparency = 1
container.Parent = screenGui

-- Spinner Icon
local icon = Instance.new("ImageLabel")
icon.Size = UDim2.new(0, 70, 0, 70)
icon.Position = UDim2.new(0.5, -35, 0, 10)
icon.BackgroundTransparency = 1
icon.Image = "rbxassetid://10957097362"
icon.Parent = container

-- "Hopping an old server..." text
local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(1, 0, 0, 50)
loadingText.Position = UDim2.new(0, 0, 0, 90)
loadingText.BackgroundTransparency = 1
loadingText.Text = "Hopping an old server... Please wait"
loadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingText.TextSize = 28
loadingText.Font = Enum.Font.GothamBold
loadingText.TextWrapped = true
loadingText.Parent = container

-- Loading Bar Background
local loadingBarBG = Instance.new("Frame")
loadingBarBG.Size = UDim2.new(0.8, 0, 0, 20)
loadingBarBG.Position = UDim2.new(0.1, 0, 0, 160)
loadingBarBG.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
loadingBarBG.BorderSizePixel = 0
loadingBarBG.Parent = container

Instance.new("UICorner", loadingBarBG).CornerRadius = UDim.new(0, 8)

-- Loading Bar Fill
local loadingFill = Instance.new("Frame")
loadingFill.Size = UDim2.new(0, 0, 1, 0)
loadingFill.Position = UDim2.new(0, 0, 0, 0)
loadingFill.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
loadingFill.BorderSizePixel = 0
loadingFill.Parent = loadingBarBG

Instance.new("UICorner", loadingFill).CornerRadius = UDim.new(0, 8)

-- Spinner Rotation
task.spawn(function()
	while screenGui and icon and icon.Parent do
		icon.Rotation += 2
		task.wait(0.01)
	end
end)

-- Animate loading bar over 10 seconds
local duration = 10
local startTime = tick()
while tick() - startTime < duration do
	local progress = (tick() - startTime) / duration
	loadingFill.Size = UDim2.new(progress, 0, 1, 0)
	task.wait(0.05)
end

-- Fade out loading screen
for i = 1, 30 do
	container.BackgroundTransparency += 1/30
	icon.ImageTransparency += 1/30
	loadingText.TextTransparency += 1/30
	loadingFill.BackgroundTransparency += 1/30
	loadingBarBG.BackgroundTransparency += 1/30
	task.wait(0.02)
end

container:Destroy()

-- ✅ FOUND SERVER TEXT
local foundText = Instance.new("TextLabel")
foundText.Size = UDim2.new(1, 0, 1, 0)
foundText.Position = UDim2.new(0, 0, 0, 0)
foundText.BackgroundTransparency = 1
foundText.Text = "✅ Found old server successfully!"
foundText.TextColor3 = Color3.fromRGB(0, 255, 0)
foundText.TextScaled = true
foundText.Font = Enum.Font.GothamBold
foundText.Parent = screenGui

-- Fade out server found text after 2 seconds
task.delay(2, function()
	for i = 1, 30 do
		foundText.TextTransparency += 1/30
		task.wait(0.03)
	end
	screenGui:Destroy()
end)
