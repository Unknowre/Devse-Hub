local mainKey = getgenv().key
if not mainKey then
    error("[Loader] No key provided! Please run `getgenv().key = '<YOUR_KEY>'` first.")
end

local placeScripts = {
    [258258996] = "MinerH.luau",
    [17474746614] = "7DTL.luau",
    [18680867089] = "UMT.luau",
}

local GITHUB_BASE = "https://raw.githubusercontent.com/Unknowre/Devse-Hub/main/"
local scriptName  = placeScripts[game.PlaceId]

if scriptName then
    local ok, err = pcall(function()
        loadstring(game:HttpGet(GITHUB_BASE..scriptName, true))()
    end)
    if not ok then warn("[Loader] Failed to load:", err) end
else
    warn("[Loader] No script for PlaceId", game.PlaceId)
end
