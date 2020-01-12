JobList = {}

function SetPlayerJob(player,jobName)
    if jobName == nil or PlayerData[player] == nil then return end
    for _, v in pairs(JobList[jobName]) do
        if v == player then return end
    end
    if PlayerData[player].job ~= 0 then 
        table.remove(JobList[jobName],player)
    end
    if getLength(JobList[jobName]) >= jobName.max and jobName.max ~= 0 then
        AddPlayerChat(player,"Aucun poste à pourvoir !")
        return
    end
    PlayerData[player].job = jobName
    if JobList[jobName] == nil then
        JobList[jobName] = {}
    end    
    table.insert(JobList[jobName],player)
end

function FiredPlayer(player)
    if PlayerData[player].job == Citizen.name then return end
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


AddEvent("OnPlayerInitialized", function(player)
    if PlayerData[player].job ~= 0 then return end
    SetPlayerJob(player,Citizen)
end)

AddEvent("OnPlayerQuit", function(player)
    for k, v in pairs(JobList) do
        table.remove(JobList[k],player)
    end
    
end)











