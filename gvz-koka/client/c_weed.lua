ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local topluyormu = false
local isliyormu = false
local kurutuyormu = false
local paketliyormu = false

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local dst = GetDistanceBetweenCoords(playercoords, Config.KokoCikis.x, Config.KokoCikis.y, Config.KokoCikis.z, true)
        local dst2 = GetDistanceBetweenCoords(playercoords, Config.KokoGiris.x, Config.KokoGiris.y, Config.KokoGiris.z, true)
        local dst3 = GetDistanceBetweenCoords(playercoords, Config.KokoTopla.x, Config.KokoTopla.y, Config.KokoTopla.z, true)
        local dst4 = GetDistanceBetweenCoords(playercoords, Config.KokoAyiklama.x, Config.KokoAyiklama.y, Config.KokoAyiklama.z, true)
        local dst5 = GetDistanceBetweenCoords(playercoords, Config.KokoKurutma.x, Config.KokoKurutma.y, Config.KokoKurutma.z, true)
        local dst6 = GetDistanceBetweenCoords(playercoords, Config.KokoPaketleme.x, Config.KokoPaketleme.y, Config.KokoPaketleme.z, true)
        if dst < 10 then
            sleep = 7
            DrawMarker(2, Config.KokoCikis.x, Config.KokoCikis.y, Config.KokoCikis.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
            if dst < 1 then
                DrawText3D(Config.KokoCikis.x, Config.KokoCikis.y, Config.KokoCikis.z + 0.4, '~g~E~s~ - Pek Girmeni İstemem')
                if IsControlJustReleased(0, 38) then
                    SetEntityCoords(player, Config.KokoGiris.x, Config.KokoGiris.y, Config.KokoGiris.z, false, false, false, true)
                end
            end
        end
        if dst2 < 10 then
            sleep = 7
            DrawMarker(2, Config.KokoGiris.x, Config.KokoGiris.y, Config.KokoGiris.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
            if dst2 < 1 then
                DrawText3D(Config.KokoGiris.x, Config.KokoGiris.y, Config.KokoGiris.z + 0.4, '~g~E~s~ - Dısarı Çık')
                if IsControlJustReleased(0, 38) then
                    SetEntityCoords(player, Config.KokoCikis.x, Config.KokoCikis.y, Config.KokoCikis.z, false, false, false, true)
                end
            end
        end
        if dst3 < 10 then
            sleep = 7
            DrawMarker(2, Config.KokoTopla.x, Config.KokoTopla.y, Config.KokoTopla.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
            if dst3 < 1 then
                DrawText3D(Config.KokoTopla.x, Config.KokoTopla.y, Config.KokoTopla.z + 0.4, '~g~E~s~ - Koko Tanecigi Topla')
                if IsControlJustReleased(0, 38) then
                    KokoTopla()
                end
            end
        end
        if dst4 < 10 then
            sleep = 7
            DrawMarker(2, Config.KokoAyiklama.x, Config.KokoAyiklama.y, Config.KokoAyiklama.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
            if dst4 < 1 then
                DrawText3D(Config.KokoAyiklama.x, Config.KokoAyiklama.y, Config.KokoAyiklama.z + 0.4, '~g~E~s~ - Koko Tanecigi Ayıkla')
                if IsControlJustReleased(0, 38) then
                    KokoIsle()
                end
            end
        end
        if dst5 < 10 then
            sleep = 7
            DrawMarker(2, Config.KokoKurutma.x, Config.KokoKurutma.y, Config.KokoKurutma.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
            if dst5 < 1 then
                DrawText3D(Config.KokoKurutma.x, Config.KokoKurutma.y, Config.KokoKurutma.z + 0.4, '~g~E~s~ - Koko Tanecigi Kurut')
                if IsControlJustReleased(0, 38) then
                    KokoIsle2()
                end
            end
        end
        if dst6 < 10 then
            sleep = 7
            DrawMarker(2, Config.KokoPaketleme.x, Config.KokoPaketleme.y, Config.KokoPaketleme.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
            if dst6 < 1 then
                DrawText3D(Config.KokoPaketleme.x, Config.KokoPaketleme.y, Config.KokoPaketleme.z + 0.4, '~g~E~s~ - Koko Paketle')
                if IsControlJustReleased(0, 38) then
                    KokoPaketle()
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

function KokoTopla()
    if not topluyormu then
        topluyormu = true
        exports['mythic_progbar']:Progress({
            name = "kokover",
            duration = 10000,
            label = 'Koko Taneciği topluyorsun...',
            useWhileDead = false,
            canCancel = false,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {
                animDict = "mp_arresting",
                anim = "a_uncuff",
                flags = 49,
            },
        }, function(cancelled)
            if not cancelled then
                TriggerServerEvent('gvz-koka:giveweed')
                topluyormu = false
                ESX.ShowNotification('Başarıyla Kokain Yaprağı topladın!')
            else
                -- Do Something If Action Was Cancelled
            end
        end)
    end
end

function KokoIsle()
    if not isliyormu then
        ESX.TriggerServerCallback('gvz-koka:malzemekontrol', function(data)
            local player = PlayerPedId()
            isliyormu = true
            local finished = exports["reload-skillbar"]:taskBar(5000,math.random(5,15))
            if finished ~= 100 then
                TriggerServerEvent('gvz-koka:removeitem', 'koko_ham', 1)
                isliyormu = false
                ClearPedTasksImmediately(player)
                ESX.ShowNotification('Kokaini ayıklayamadın!')
            else
                local finished2 = exports["reload-skillbar"]:taskBar(4750,math.random(5,15))
                if finished2 ~= 100 then
                    TriggerServerEvent('gvz-koka:removeitem', 'koko_ham', 1)
                    isliyormu = false
                    ClearPedTasksImmediately(player)
                    ESX.ShowNotification('Kokaini ayıklayamadın!')
                else
                    local finished3 = exports["reload-skillbar"]:taskBar(4500,math.random(5,15))
                    if finished3 ~= 100 then
                        TriggerServerEvent('gvz-koka:removeitem', 'koko_ham', 1)
                        isliyormu = false
                        ClearPedTasksImmediately(player)
                        ESX.ShowNotification('Kokaini ayıklayamadın!')
                    else
                        TriggerServerEvent('gvz-koka:processweed')
                        isliyormu = false
                        ClearPedTasks(player)
                        ESX.ShowNotification('Kokaini başarıyla ayıkladın!')
                    end
                end
            end
        end, "koko_ham", 1)
    end
end

function KokoIsle2()
    if not kurutuyormu then
        ESX.TriggerServerCallback('gvz-koka:malzemekontrol', function(data)
            local player = PlayerPedId()
            kurutuyormu = true
            local finished = exports["reload-skillbar"]:taskBar(4500,math.random(5,15))
            if finished ~= 100 then
                TriggerServerEvent('gvz-koka:removeitem', 'koko_islenmis', 1)
                kurutuyormu = false
                ClearPedTasksImmediately(player)
                ESX.ShowNotification('Kokaini kurutamadın!')
            else
                local finished2 = exports["reload-skillbar"]:taskBar(4250,math.random(5,15))
                if finished2 ~= 100 then
                    TriggerServerEvent('gvz-koka:removeitem', 'koko_islenmis', 1)
                    kurutuyormu = false
                    ClearPedTasksImmediately(player)
                    ESX.ShowNotification('Kokaini kurutamadın!')
                else
                    local finished3 = exports["reload-skillbar"]:taskBar(4000,math.random(5,15))
                    if finished3 ~= 100 then
                        TriggerServerEvent('gvz-koka:removeitem', 'koko_islenmis', 1)
                        kurutuyormu = false
                        ClearPedTasksImmediately(player)
                        ESX.ShowNotification('Kokaini kurutamadın!')
                    else
                        TriggerServerEvent('gvz-koka:processweed2')
                        kurutuyormu = false
                        ClearPedTasks(player)
                        ESX.ShowNotification('Kokaini Başarıyla kuruttun!')
                    end
                end
            end
        end, "koko_islenmis", 1)
    end
end

function KokoPaketle()
    if not paketliyormu then
        ESX.TriggerServerCallback('gvz-koka:malzemekontrol', function(data)
            ESX.TriggerServerCallback('gvz-koka:malzemekontrol', function(data)
                local player = PlayerPedId()
                paketliyormu = true
                local finished = exports["reload-skillbar"]:taskBar(4000,math.random(5,15))
                if finished ~= 100 then
                    TriggerServerEvent('gvz-koka:removeitem', 'koko_islenmis2', 1)
                    paketliyormu = false
                    ClearPedTasksImmediately(player)
                    ESX.ShowNotification('Kokaini Paketleyemedin !')
                else
                    local finished2 = exports["reload-skillbar"]:taskBar(3750,math.random(5,15))
                    if finished2 ~= 100 then
                        TriggerServerEvent('gvz-koka:removeitem', 'koko_islenmis2', 1)
                        paketliyormu = false
                        ClearPedTasksImmediately(player)
                        ESX.ShowNotification('Kokaini Paketleyemedin !')
                    else
                        local finished3 = exports["reload-skillbar"]:taskBar(3500,math.random(5,15))
                        if finished3 ~= 100 then
                            TriggerServerEvent('gvz-koka:removeitem', 'koko_islenmis2', 1)
                            paketliyormu = false
                            ClearPedTasksImmediately(player)
                            ESX.ShowNotification('Kokaini Paketleyemedin !')
                        else
                            TriggerServerEvent('gvz-koka:packweed')
                            paketliyormu = false
                            ClearPedTasks(player)
                            ESX.ShowNotification('Kokaini başarıyla paketledin!')
                        end
                    end
                end
            end, "kagit", 1)
        end, "koko_islenmis2", 1)
    end
end

if Config.KokoBlip then
    local coords = vector3(Config.KokoGiris.x, Config.KokoGiris.y, Config.KokoGiris.z)
    local blip = AddBlipForCoord(coords)

	SetBlipSprite(blip, 557)
	SetBlipScale(blip, 0.7)
	SetBlipColour(blip, 2)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName('Kokain Üssü')
    EndTextCommandSetBlipName(blip)
end
