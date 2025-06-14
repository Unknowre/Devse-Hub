local luarmorLoaders = {
    [9224601490] = "84b14e6e92ce43e095bc7927aec8e989",
    [17493355683] = "84b14e6e92ce43e095bc7927aec8e989",
    [17493357698] = "84b14e6e92ce43e095bc7927aec8e989",
    [76381016848158] = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    [75794995434025] = "yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy",
}

local placeId = game.PlaceId
local loaderId = luarmorLoaders[placeId]

if loaderId then
    local url = "https://api.luarmor.net/files/v3/loaders/" .. loaderId .. ".lua"
    loadstring(game:HttpGet(url))()
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Devse Hub",
        Text = "❌ This game is not supported.",
        Duration = 5
    })
end
