Config = {}

Config.TricksAndTreats = {
    Tricks = {
        ["First person locked for 1 minute"] = function()
            Citizen.CreateThread(function()
                local startTimer = GetGameTimer()

                while (GetGameTimer() - startTimer) < 60000 do
                    SetFollowPedCamViewMode(4)
                    SetFollowVehicleCamViewMode(4)
                    Citizen.Wait(0)
                end

                SetFollowPedCamViewMode(0)
                SetFollowVehicleCamViewMode(0)
            end)
        end,
        ["?#!%$&"] = function()
            RequestScriptAudioBank("DLC_MPSUM2/Halloween_Adversary", false, -1)

            local monster = SpawnMonster()
            local fireRing = SpawnFireRing(monster)
            MakeMonsterFlash(monster, 1000)

            PlaySpawnAudio(monster)
            local scaryAudio = PlayScaryLoopAudio(monster, 3000)

            DespawnMonster(monster, scaryAudio, fireRing)
        end,
        --[[["Kick"] = function()
            TriggerServerEvent("utility_halloween:kick", Config.Translations.treat_notify.."Kick :)")
        end,]]
        ["Shock"] = function()
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local offset = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.2, 0.0)

            ShootSingleBulletBetweenCoords(offset.x, offset.y, offset.z, coords.x, coords.y, coords.z, 1, true, `WEAPON_STUNGUN`, 0, true, false, 100.0)
        end,
    },
    Treats = {
        ["3500$"] = function(pumpkinId) -- This function its executed in the client side
            print("Give 3500$, pumpkin id:"..pumpkinId)
        end,
    }
}

Config.Pumpkins = {
    Coords = {
        vector4(-1762.4, -261.63, 48.68, 151.69),
        vector4(1599.69, 3590.93, 38.77, 124.56),
        vector4(3204.07, 4731.68, 193.42, 192.88),
        vector4(960.95, -2127.56, 31.46, 318.69),
        vector4(2338.76, 2571.83, 47.74, 246.3),
        vector4(1941.91, 4659.03, 40.52, 240.32)
    }
}

Config.Translations = {
    ["collected_title"] = "~o~TRICK OR TREAT",
    ["collected_msg"] = "Halloween pumpkins collected: %d/%d",
    ["collect_notify"] = "Press {E} to collect the Halloween pumpkin",
    ["trick_notify"] = "Trick: ",
    ["treat_notify"] = "Treat: ",
}