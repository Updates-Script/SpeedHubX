-- Show notification about the key
game.StarterGui:SetCore("SendNotification", {
    Title = "Speed Hub X";
    Text = "Please wait... You will need a key to proceed.";
    Duration = 5; -- seconds
})

-- Wait before loading the main script
task.wait(2)

-- Load the actual Speed Hub X script
loadstring(game:HttpGet("https://rawscripts.net/raw/a-literal-baseplate.-Speedhub-X-30971"))()
