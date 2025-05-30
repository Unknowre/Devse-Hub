local scripts = {
    [9224601490] = "FRG.lua",
    [1234567890] = "AnotherScript.lua",
    [9876543210] = "Something.lua",
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
