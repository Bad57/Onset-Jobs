JobList = {}

function SetPlayerJob(player,jobName)
    if jobName == nil or PlayerData[player] == nil then return end
    print(jobName.name)
    if PlayerData[player].job ~= 0 then
        table.remove(JobList[jobName],player)
    end
    for _, v in pairs(JobList[jobName]) do
        print(v)
        if v == player then return end
    end
    if getLength(JobList[jobName]) >= jobName.max and jobName.max ~= 0 then
        AddPlayerChat(player,"No vacancies to be filled !")
        return
    end
    PlayerData[player].job = jobName
    if JobList[jobName] == nil then
        JobList[jobName] = {}
    end
    table.insert(JobList[jobName],player)
    EquipPlayer(player)
end

function FiredPlayer(player)
    if PlayerData[player].job == Citizen.name then return end
    SetPlayerJob(player,Citizen)
    AddPlayerChat(player, "You've been fired ! Go find a new job")
end

function EquipPlayer(player)
    if PlayerData[player] == nil or PlayerData[player].job == nil then return end
    local playerJob = PlayerData[player].job
    for i = 1, 3, 1 do
        SetPlayerWeapon(player, 1, 0, false, i)
    end
    for i, v in ipairs(playerJob.weapons) do
        local weaponId = getWeaponByName(v)
        SetPlayerWeapon(player, weaponId, 30, false, i, false)
    end
end

function getLength(list)
    local c = 0
    if list == nil then return 0 end
    for _,_ in pairs(list) do
        c = c+1
    end
    return c
end

function getWeaponByName(weaponName)
    local file = io.open("weapons.json",r)
    local weapons = file:read("a")
    local weapons = json_decode(weapons)
    for k, v in pairs(weapons) do
        for key, value in pairs(v) do
            if (value.Name==weaponName) then
                return key
            end
        end
    end
end

AddEvent("OnPlayerSpawn", function(playerid)
    EquipPlayer(player)
end)

AddEvent("OnPlayerInitialized", function(player)
    if PlayerData[player].job ~= 0 then return end
    SetPlayerJob(player,Citizen)
end)

AddEvent("OnPlayerQuit", function(player)
    for k, v in pairs(JobList) do
        table.remove(JobList[k],player)
    end
end)

AddCommand("job", function (player)
    print(PlayerData[player].job.name)
end)

AddCommand("equip", function (player)
    EquipPlayer(player)
end)













