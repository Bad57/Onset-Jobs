-- To create a custom job just copy and paste an existing one and modify it to your conveniances
-- Dont forget to add your freshly created job in the Jobs variable at the end of the jobs declaration block


--# JOBS DECLARATION 


Mayor = {
    name = "Maire",
    description = "Vous êtes le Maire de la ville. Vous devez prendre des décisions capitales pour la ville et ses habitants.",
    salary = 5000,
    max = 1,
    groups = {},
    weapons = {},
    models = {14},
    command = "mayor"
}

Citizen = {
    name = "Citoyen",
    description = "Vous êtes un citoyen.",
    salary = 250,
    max = 0,
    groups = {},
    weapons = {},
    models = {1,2,4,6,7,8},
    command = "citizen"
}

Cops = {
    name = "Policier",
    description = "Votre devoir et de veiller sur votre ville et ses citoyens.",
    salary = 1500,
    max = 12,
    groups = {},
    weapons = {"MP5SD","Glock 17"},
    models = {13},
    command = "cops"
}


Jobs = {Mayor,Citizen,Cops} -- Add your new jobs at the end of the list

--# FUCNTIONS

--Adding the custom command for each jobs
AddEvent("OnPackageStart", function()
    for key, value in pairs(Jobs) do
        JobList[value] = {}
        if value.command ~= "" then
            AddCommand(value.command, function (player)
                SetPlayerJob(player,Jobs[key])
            end)
        end
    end
    print("Jobs initialized...")
end)