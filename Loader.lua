local scripts = {
    [9224601490] = "FRG.lua",
    [17493355683] = "FRG.lua",
    [17493357698] = "FRG.lua",
    [76381016848158] = "FR.lua",
    [75794995434025] = "GAB.lua",
}

local placeId = game.PlaceId
local scriptName = scripts[placeId]

if scriptName then
    local url = "https://raw.githubusercontent.com/Unknowre/Devse-Hub/main/" .. scriptName
    loadstring(game:HttpGet(url))()
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Devse Hub",
        Text = "❌ This game is not supported.",
        Duration = 5
    })
end
