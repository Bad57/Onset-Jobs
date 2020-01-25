JobList = {}

function InitPlayerData()
    if PlayerData == nil then
        PlayerData = {}
    end
end

function SetPlayerJob(player,jobName)
    if jobName == nil or PlayerData[player] == nil then return end
    if PlayerData[player].job ~= 0 then
        table.remove(JobList[jobName],player)
    end
    for _, v in pairs(JobList[jobName]) do
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
    PlayerClothingPreset(player)
    EquipPlayer(player)
end

function FiredPlayer(player)
    if PlayerData[player].job == Citizen.name then return end
    SetPlayerJob(player,Citizen)
    AddPlayerChat(player, "You've been fired ! Go find a new job")
end

function PlayerClothingPreset(player)
    if PlayerData[player] == nil or PlayerData[player].job == nil then return end
    local playerJob = PlayerData[player].job
    local playerModel = Random(1, getLength(playerJob.models))
    SetPlayerPropertyValue(player, "_modelPreset", playerModel)
    
    CallRemoteEvent(player,"setClothPreset",tonumber(playerJob.models[playerModel]))
end

function EquipPlayer(player)
    if PlayerData[player] == nil or PlayerData[player].job == nil then return end
    local playerJob = PlayerData[player].job
    for i = 1, 3, 1 do
        SetPlayerWeapon(player, 1, 0, false, i)
    end
    for i, v in ipairs(playerJob.weapons) do
        if i > 3 then break end
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
    PlayerClothingPreset(player);
end)

AddEvent("OnPlayerInitialized", function(player)
    if PlayerData[player].job ~= 0 then return end
    SetPlayerJob(player,Citizen)
end)

function OnPlayerStreamIn(player)
	local _modelPreset = GetPlayerPropertyValue(player, "_modelPreset")
	if (_modelPreset ~= nil and _modelPreset > 0) then
		SetPlayerClothingPreset(player, _modelPreset)
	end
end
AddEvent("OnPlayerStreamIn", OnPlayerStreamIn)

AddEvent("OnPlayerQuit", function(player)
    for k, v in pairs(JobList) do
        table.remove(JobList[k],player)
    end
end)

function OnPlayerStreamIn(player)
	local _modelPreset = GetPlayerPropertyValue(player, "_modelPreset")
	if (_modelPreset ~= nil and _modelPreset > 0) then
		SetPlayerClothingPreset(player, _modelPreset)
	end
end
AddEvent("OnPlayerStreamIn", OnPlayerStreamIn)

AddEvent("OnPackageStart", function()
    InitPlayerData()
end)












