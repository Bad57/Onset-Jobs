JobList = {}

function SetPlayerJob(player,jobName)
    if jobName == nil or PlayerData[player] == nil then return end
    for _, v in pairs(JobList[jobName]) do
        if v == player then return end
    end
    if getLength(JobList[jobName]) >= jobName.max and jobName.max ~= 0 then
        AddPlayerChat(player,"Aucun poste à pourvoir !")
        return
    end
    PlayerData[player].job = jobName.name
    PlayerData[player].salaire = jobName.salary
    PlayerData[player].groups = jobName.groups
    PlayerData[player].models = jobName.models
    PlayerData[player].weapons = jobName.weapons
    if JobList[jobName] == nil then
        JobList[jobName] = {}
    end
    table.insert(JobList[jobName],player)
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

function getLength(list)
    local c = 0
    if list == nil then return 0 end
    for _,_ in pairs(list) do
        c = c+1
    end
    return c
end

AddCommand("job", function (player)
    AddPlayerChat(player,PlayerData[player].job)
end)










