AddRemoteEvent("setClothPreset", function (modelId)
    AddPlayerChat(modelId)
    SetPlayerClothingPreset(GetPlayerId(),tonumber(modelId))
end)
