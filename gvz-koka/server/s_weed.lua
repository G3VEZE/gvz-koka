ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('gvz-koka:giveweed')
AddEventHandler('gvz-koka:giveweed', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.canCarryItem('koko_ham', 1) then
        xPlayer.addInventoryItem('koko_ham', 1)
    else
        TriggerClientEvent('esx:showNotification', src, 'Üzerinde bunu taşıyacak yer yok!')
    end
end)

RegisterServerEvent('gvz-koka:processweed')
AddEventHandler('gvz-koka:processweed', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getInventoryItem('koko_ham').count >= 1 then
        if xPlayer.canCarryItem('koko_islenmis', 1) then
            xPlayer.removeInventoryItem('koko_ham', 1)
            Citizen.Wait(500)
            xPlayer.addInventoryItem('koko_islenmis', 1)
        else
            TriggerClientEvent('esx:showNotification', src, 'Üzerinde bunu taşıyacak yer yok!')
        end
    else
        TriggerClientEvent('esx:showNotification', src, 'Üzerinde koko yaprağı yok!')
    end
end)

RegisterServerEvent('gvz-koka:processweed2')
AddEventHandler('gvz-koka:processweed2', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getInventoryItem('koko_islenmis').count >= 1 then
        if xPlayer.canCarryItem('koko_islenmis2', 1) then
            xPlayer.removeInventoryItem('koko_islenmis', 1)
            Citizen.Wait(500)
            xPlayer.addInventoryItem('koko_islenmis2', 1)
        else
            TriggerClientEvent('esx:showNotification', src, 'Üzerinde bunu taşıyacak yer yok!')
        end
    else
        TriggerClientEvent('esx:showNotification', src, 'Üzerinde ayıklanmış koko yok!')
    end
end)

RegisterServerEvent('gvz-koka:packweed')
AddEventHandler('gvz-koka:packweed', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getInventoryItem('koko_islenmis2').count >= 1 then
        if xPlayer.getInventoryItem('kagit').count >= 1 then
            if xPlayer.canCarryItem('koko_paketlenmis', 1) then
                xPlayer.removeInventoryItem('kagit', 1)
                Citizen.Wait(250)
                xPlayer.removeInventoryItem('koko_islenmis2', 1)
                Citizen.Wait(500)
                xPlayer.addInventoryItem('koko_paketlenmis', 1)
            else
                TriggerClientEvent('esx:showNotification', src, 'Üzerinde bunu taşıyacak yer yok!')
            end
        else
            TriggerClientEvent('esx:showNotification', src, 'Üzerinde yeterli poşet yok!')
        end
    else
        TriggerClientEvent('esx:showNotification', src, 'Üzerinde kurutulmuş koko yok!')
    end
end)

RegisterServerEvent('gvz-koka:sellweed')
AddEventHandler('gvz-koka:sellweed', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local money = math.random(Config.MinKokoPara, Config.MaxKokoPara)
    if xPlayer.getInventoryItem('koko_paketlenmis').count >= 1 then
        xPlayer.removeInventoryItem('koko_paketlenmis', 1)
        Citizen.Wait(500)
        if Config.BlackMoney then
            xPlayer.addAccountMoney('black_money', money)
        else
            xPlayer.addMoney(money)
        end
    else
        TriggerClientEvent('esx:showNotification', src, 'Üzerinde paketlenmiş koko yok!')
    end
end)
