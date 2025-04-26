local HttpService = game:GetService("HttpService")
local hwid
if isfile("devse_hub_id.txt") then
    hwid = readfile("devse_hub_id.txt")
else
    hwid = HttpService:GenerateGUID(false)
    writefile("devse_hub_id.txt", hwid)
end

local key = getgenv().key
if not key then error("[Loader] No key!") end

local url = "http://your.api.server:5000/validate"
local payload = HttpService:JSONEncode({
    key     = key,
    hwid    = hwid,
    placeId = game.PlaceId
})
local ok, resp = pcall(function()
    return HttpService:JSONDecode(
        HttpService:PostAsync(url, payload, Enum.HttpContentType.ApplicationJson)
    )
end)

if not ok or not resp.success then
    local reason = resp and resp.reason or "network_error"
    error("[Loader] Validation failed: "..reason)
end

local LOCAL_VER = "1.0.0"
if resp.version and resp.version ~= LOCAL_VER then
    return loadstring(game:HttpGet('https://raw.githubusercontent.com/Unknowre/Devse-Hub/main/Loader.lua', true))()
end

local placeScripts = {
    [258258996]   = "MinerH.luau",
    [17474746614] = "7DTL.luau",
    [18680867089] = "UMT.luau",
}
local scriptName = placeScripts[game.PlaceId]
if scriptName then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Unknowre/Devse-Hub/main/"..scriptName, true))()
else
    warn("[Loader] No script for PlaceId", game.PlaceId)
end
