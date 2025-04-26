local HttpService = game:GetService("HttpService")
-- ทำ persistent HWID
local hwid_file = "devse_hub_id.txt"
local hwid = isfile(hwid_file) and readfile(hwid_file)
    or (writefile(hwid_file, HttpService:GenerateGUID(false)) or readfile(hwid_file))

-- อ่าน key ที่ Bot inject
local key = getgenv().key
if not key then error("[Loader] No key!") end

-- Validate + HWID-Lock
local payload = HttpService:JSONEncode({ key=key, hwid=hwid, placeId=game.PlaceId })
local ok, resp = pcall(function()
    return HttpService:JSONDecode(
        HttpService:PostAsync("http://YOUR_API_HOST:5000/validate", payload, Enum.HttpContentType.ApplicationJson)
    )
end)
if not ok or not resp.success then
    error("[Loader] Validation failed: "..(resp and resp.reason or "network"))
end

-- Auto-update
local LOCAL_VER = "1.0.0"
if resp.version ~= LOCAL_VER then
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/Unknowre/Devse-Hub/main/Loader.lua", true))()
end

-- โหลดสคริปต์แมพตาม PlaceId
local placeScripts = {
    [258258996]   = "MinerH.luau",
    [17474746614] = "7DTL.luau",
    [18680867089] = "UMT.luau",
}
local scriptName = placeScripts[game.PlaceId]
if scriptName then
    loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/Unknowre/Devse-Hub/main/"..scriptName, true
    ))()
else
    warn("[Loader] No script for PlaceId", game.PlaceId)
end
