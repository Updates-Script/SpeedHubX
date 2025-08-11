-- Roblox-Style Notification with Progress Bar
-- Duration: 6 seconds

-- Create ScreenGui
local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui

-- Main notification frame
local notif = Instance.new("Frame")
notif.AnchorPoint = Vector2.new(1, 1)
notif.Position = UDim2.new(1, -20, 1, -20) -- bottom right
notif.Size = UDim2.new(0, 300, 0, 60)
notif.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
notif.BackgroundTransparency = 0.05
notif.BorderSizePixel = 0
notif.Visible = false
notif.Parent = gui

-- Rounded corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = notif

-- Text label
local text = Instance.new("TextLabel")
text.Size = UDim2.new(1, -20, 1, -20)
text.Position = UDim2.new(0, 10, 0, 0)
text.BackgroundTransparency = 1
text.Text = "Please wait while getting key..."
text.Font = Enum.Font.Gotham
text.TextSize = 16
text.TextColor3 = Color3.fromRGB(255, 255, 255)
text.TextXAlignment = Enum.TextXAlignment.Left
text.Parent = notif

-- Progress bar background
local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(1, -20, 0, 4)
barBg.Position = UDim2.new(0, 10, 1, -8)
barBg.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
barBg.BorderSizePixel = 0
barBg.Parent = notif

-- Progress bar fill
local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
barFill.BorderSizePixel = 0
barFill.Parent = barBg

-- Smooth corner for progress bar
local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(0, 2)
barCorner.Parent = barBg

-- TweenService for animations
local TweenService = game:GetService("TweenService")

-- Show notification
notif.Visible = true
notif.BackgroundTransparency = 1
text.TextTransparency = 1
barBg.BackgroundTransparency = 1
barFill.BackgroundTransparency = 1

-- Play Roblox sound
local sound = Instance.new("Sound", gui)
sound.SoundId = "rbxassetid://563463342" -- Roblox notification sound
sound:Play()

-- Fade in
TweenService:Create(notif, TweenInfo.new(0.4), {BackgroundTransparency = 0.05}):Play()
TweenService:Create(text, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
TweenService:Create(barBg, TweenInfo.new(0.4), {BackgroundTransparency = 0}):Play()
TweenService:Create(barFill, TweenInfo.new(0.4), {BackgroundTransparency = 0}):Play()

-- Progress bar animation
TweenService:Create(barFill, TweenInfo.new(6, Enum.EasingStyle.Linear), {Size = UDim2.new(1, 0, 1, 0)}):Play()

-- After 6 seconds, fade out
task.delay(6, function()
    TweenService:Create(notif, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
    TweenService:Create(text, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
    TweenService:Create(barBg, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
    TweenService:Create(barFill, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
    
    task.wait(0.5)
    notif:Destroy()
    
    -- PLACEHOLDER: Your script goes here
    -- loadstring(game:HttpGet("YOUR_SCRIPT_URL_HERE"))()
end)
