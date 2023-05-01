local Utilities = {}

local games = {
    ["286090429"] = "Arsenal",
    ["6516141723"] = "Doors",
    ["2753915549"] = "Blox Fruits"
}

Utilities.getCurrentGame = function()
    if games[tostring(game.PlaceId)] then
        return games[tostring(game.PlaceId)]
    end
end

Utilities.getPlayerInfo = function()
    local player = game:GetService("Players").LocalPlayer
    local name = player.Name
    local uid = player.UserId
    local underage = player.AccountAge < 13

    return {name, uid, underage}
end

Utilities.getDetailGame = function()
    local game = game
    local placeId = game.PlaceId
    local jobId = game.JobId
    local serverId = game.JobId:gsub("rbxassetid://", "")

    return {placeId, jobId, serverId}
end

Utilities.achievements = function()
    local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()
    return Achievements
end

Utilities.isPrivateServer = function()
    return game.PrivateServerId == nil or game.PrivateServerOwnerId == nil
end

return Utilities