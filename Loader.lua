local scripts = {
    [9224601490] = "Rk5HlnVhLnB5",
    [17493355683] = "Rk5HlnVhLnB5",
    [17493357698] = "Rk5HlnVhLnB5",
    [12413901502] = "Rk5HlnVhLnB5",
    [16190471004] = "Rk5HlnVhLnB5",
    [76381016848158] = "RlIubG",
    [75794995434025] = "R0FCLnB5",
    [75663528075786] = "RFJBR09OLnB5",
    [73727760725654] = "U1RDLnB5",
    [126884695634066] = "R0FHLnB5",
}

local placeId = game.PlaceId
local base64ScriptName = scripts[placeId]

if base64ScriptName then
    local scriptName = game:GetService("HttpService"):Base64Decode(base64ScriptName)
    
    local url = "https://raw.githubusercontent.com/Unknowre/Devse-Hub/main/" .. scriptName
    loadstring(game:HttpGet(url))()
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Devse Hub",
        Text = "❌ This game is not supported.",
        Duration = 5
    })
end
