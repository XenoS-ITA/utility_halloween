CreatedPumpkins = {}
CollectedPumpkins = ConvertKvp("collectedPumpkins")

-- Setup marker
CreateMarker("halloween_pumpkin", vector3(0,0,0), 0.0, 2.0, {
    notify = "Press {E} to collect the Halloween pumpkin"
})

Citizen.CreateThread(function()
    while not HasCollectedAllPumpkins() do
        local coords = GetEntityCoords(PlayerPedId())

        for k,v in pairs(Config.Pumpkins.Coords) do
            local pumpkinCoords = vector3(v.x, v.y, v.z)

            if #(pumpkinCoords - coords) < 50 then -- if near
                if not IsPumpkinAlreadyCollected(k) then
                    SpawnPumpkin(k, pumpkinCoords, v.w)
                end
            else
                if CreatedPumpkins[k] then
                    DespawnPumpkin(k)
                end
            end
        end

        Citizen.Wait(3000)
    end
end)

On("marker", function(id)
    if id == "halloween_pumpkin" then
        local pumpkinId = GetFrom(id, "pumpkinId")

        CollectPumpkin(pumpkinId)
    end
end)


RegisterCommand("clearcollectedpumpkins", function()
    SetResourceKvp("collectedPumpkins", "[]")
    CollectedPumpkins = {}
end)