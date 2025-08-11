-- Create a custom loading UI
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Main frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 320, 0, 90)
frame.Position = UDim2.new(0.5, -160, 0.8, -45)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BackgroundTransparency = 1 -- start invisible
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Parent = gui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 10)
frameCorner.Parent = frame

-- Text label
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, -20, 0, 40)
textLabel.Position = UDim2.new(0, 10, 0, 0)
textLabel.BackgroundTransparency = 1
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.Font = Enum.Font.GothamBold
textLabel.TextSize = 20
textLabel.Text = "Initializing..."
textLabel.Parent = frame

-- Progress bar background
local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(1, -20, 0, 25)
barBg.Position = UDim2.new(0, 10, 0, 55)
barBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
barBg.BackgroundTransparency = 1 -- start invisible
barBg.BorderSizePixel = 0
barBg.Parent = frame

local barBgCorner = Instance.new("UICorner")
barBgCorner.CornerRadius = UDim.new(0, 8)
barBgCorner.Parent = barBg

-- Progress bar fill
local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
barFill.BackgroundTransparency = 1 -- start invisible
barFill.BorderSizePixel = 0
barFill.Parent = barBg

local barFillCorner = Instance.new("UICorner")
barFillCorner.CornerRadius = UDim.new(0, 8)
barFillCorner.Parent = barFill

-- Fade-in animation
local function fadeIn(object)
	for i = 1, 10 do
		if object:IsA("Frame") then
			object.BackgroundTransparency = 1 - (i / 10)
		end
		task.wait(0.02)
	end
end

-- Fade-out animation
local function fadeOut(object)
	for i = 1, 10 do
		if object:IsA("Frame") then
			object.BackgroundTransparency = i / 10
		end
		task.wait(0.02)
	end
end

-- Animate loader
task.spawn(function()
    -- Fade in elements
    fadeIn(frame)
    fadeIn(barBg)
    fadeIn(barFill)

    local dots = ""
    local progress = 0
    while progress < 1 do
        for i = 1, 3 do
            dots = string.rep(".", i)
            textLabel.Text = "Initializing" .. dots
            task.wait(0.3)
        end
        
        progress = math.min(progress + 0.04, 1)
        barFill.Size = UDim2.new(progress, 0, 1, 0)
    end

    textLabel.Text = "Initialization Complete!"
    barFill.BackgroundColor3 = Color3.fromRGB(0, 255, 100)

    task.wait(1)

    -- Fade out elements
    fadeOut(barFill)
    fadeOut(barBg)
    fadeOut(frame)
    gui:Destroy()
end)
