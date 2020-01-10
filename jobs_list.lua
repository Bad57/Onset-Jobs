
Mayor = {
    name = "Maire",
    description = "Vous etes le prince de la ville",
    salary = 5000,
    max = 1,
    groups = {},
    weapons = {},
    model = {},
    command = "mayor"
}

Citizen = {
    name = "Citoyen",
    description = "Vous etes le rabouin de la ville",
    salary = 100,
    max = 0,
    groups = {},
    weapons = {},
    model = {},
    command = "citizen"
}

Cops = {
    name = "Policier",
    description = "ACAB",
    salary = 1500,
    max = 12,
    groups = {},
    weapons = {},
    model = {},
    command = "acab"
}



--# Functions

Jobs = {Mayor,Citizen,Cops}

AddEvent("OnPackageStart", function()
    for key, value in pairs(Jobs) do
        AddCommand(value.command, function (player)
            SetPlayerJob(player,Jobs[key])
        end)
    end
    print("Jobs initialized...")
end)

