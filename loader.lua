-- Roblox-style sliding notification with sound + smooth loading bar
local StarterGui = game:GetService("StarterGui")

-- Create ScreenGui
local gui = Instance.new("ScreenGui")
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

-- Main frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 60)
frame.Position = UDim2.new(1, 20, 1, -100) -- Start offscreen right
frame.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 0
frame.Parent = gui

-- Rounded corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = frame

-- Text label
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, -20, 0, 30)
label.Position = UDim2.new(0, 10, 0, 5)
label.BackgroundTransparency = 1
label.Text = "Please wait while getting key..."
label.Font = Enum.Font.SourceSansBold
label.TextSize = 18
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextXAlignment = Enum.TextXAlignment.Left
label.Parent = frame

-- Progress bar background
local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(1, -20, 0, 8)
barBg.Position = UDim2.new(0, 10, 1, -16)
barBg.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
barBg.BorderSizePixel = 0
barBg.Parent = frame

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(0, 4)
barCorner.Parent = barBg

-- Progress fill
local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
barFill.BorderSizePixel = 0
barFill.Parent = barBg

local barFillCorner = Instance.new("UICorner")
barFillCorner.CornerRadius = UDim.new(0, 4)
barFillCorner.Parent = barFill

-- Notification sound
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://138087970" -- Roblox notification sound
sound.Volume = 1
sound.Parent = frame
sound:Play()

-- Slide in
local targetPos = UDim2.new(1, -270, 1, -100)
for i = 0, 1, 0.08 do
	frame.Position = frame.Position:Lerp(targetPos, i)
	task.wait(0.02)
end
frame.Position = targetPos

-- Smooth progress (6 seconds)
local duration = 6
local steps = 60
for i = 1, steps do
	barFill.Size = UDim2.new(i/steps, 0, 1, 0)
	task.wait(duration / steps)
end

-- Small pause
task.wait(0.5)

-- Slide out
local offscreenPos = UDim2.new(1, 20, 1, -100)
for i = 0, 1, 0.08 do
	frame.Position = frame.Position:Lerp(offscreenPos, i)
	task.wait(0.02)
end

gui:Destroy()

-- Your main script here
-- loadstring(game:HttpGet("YOUR_SCRIPT_URL"))()
