JobList = {}

function SetPlayerJob(player,jobName)
    if jobName == nil or PlayerData[player] == nil then return end
    PlayerData[player].job = jobName.name
    PlayerData[player].salaire = jobName.salary
    PlayerData[player].groups = jobName.groups
    PlayerData[player].models = jobName.models
    PlayerData[player].weapons = jobName.weapons
    if JobList[jobName] == nil then
        JobList[jobName] = {}
    end
    
end

AddEvent("OnPlayerInitialized", function(player)
    if PlayerData[player].job ~= 0 then return end
    SetPlayerJob(player,Citizen)
end)

function FiredPlayer(player)
    if PlayerData[player].job == DefaultJob.name then return end
    SetPlayerJob(player,Citizen)
    AddPlayerChat(player, "Vous vous êtes fait virer !")
end









