
Mayor = {
    name = "Maire",
    description = "Vous êtes le Maire de la ville. Vous devez prendre des décisions capitales pour la ville et ses habitants.",
    salary = 5000,
    max = 1,
    groups = {},
    weapons = {},
    model = {},
    command = "mayor"
}

Citizen = {
    name = "Citoyen",
    description = "Vous êtes un citoyen.",
    salary = 250,
    max = 0,
    groups = {},
    weapons = {},
    model = {},
    command = "citizen"
}

Cops = {
    name = "Policier",
    description = "Votre devoir et de veiller sur votre ville et ses citoyens.",
    salary = 1500,
    max = 12,
    groups = {},
    weapons = {},
    model = {},
    command = "cops"
}



--# Functions

Jobs = {Mayor,Citizen,Cops}

AddEvent("OnPackageStart", function()
    for key, value in pairs(Jobs) do
        JobList[value] = {}
        AddCommand(value.command, function (player)
            SetPlayerJob(player,Jobs[key])
        end)
    end
    print("Jobs initialized...")
end)
