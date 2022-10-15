RegisterServerEvent("utility_halloween:kick", function(reason)
    local source = source
    
    Citizen.Wait(1000)
    DropPlayer(source, reason)
end)