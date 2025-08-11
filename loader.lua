-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.Parent = game.CoreGui

-- Background frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(1, 0, 1, 0)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.3
frame.Parent = screenGui

-- Centered message
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "Please wait while getting key..."
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextStrokeTransparency = 0
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextSize = 40
textLabel.Parent = frame

-- Function to detect the key UI
local function waitForKeyUI()
    while true do
        task.wait(0.2)
        if game.CoreGui:FindFirstChild("SpeedHubX") then -- change name if UI has a different name
            break
        end
    end
end

-- Run the loader script in the background
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Updates-Script/SpeedHubX/refs/heads/main/loader.lua"))()
end)

-- Wait until key UI is detected
waitForKeyUI()

-- Remove the big notification
screenGui:Destroy()
