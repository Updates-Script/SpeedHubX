-- Show notification
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Speed Hub X";
        Text = "Initializing... Retrieving key, please wait.";
        Duration = 15 -- seconds
    })
end)

-- Run the loader script immediately
loadstring(game:HttpGet("https://raw.githubusercontent.com/Updates-Script/SpeedHubX/refs/heads/main/loader.lua"))()
