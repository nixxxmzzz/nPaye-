ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("universalPayment:payCash")
AddEventHandler("universalPayment:payCash", function(amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    amount = tonumber(amount)

    if xPlayer.getMoney() >= amount then
        xPlayer.removeMoney(amount)

        TriggerClientEvent("universalPayment:result", source, true)
        TriggerClientEvent("esx:showNotification", source, "Vous avez payé ~g~"..amount.."$~s~ en liquide.")
    else
        TriggerClientEvent("universalPayment:result", source, false)
        TriggerClientEvent("esx:showNotification", source, "~r~Vous n'avez pas assez de liquide.")
    end
end)

RegisterNetEvent("universalPayment:payCard")
AddEventHandler("universalPayment:payCard", function(amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    amount = tonumber(amount)

    if xPlayer.getAccount("bank").money >= amount then
        xPlayer.removeAccountMoney("bank", amount)

        TriggerClientEvent("universalPayment:result", source, true)
        TriggerClientEvent("esx:showNotification", source, "Paiement par carte : ~g~"..amount.."$~s~")
    else
        TriggerClientEvent("universalPayment:result", source, false)
        TriggerClientEvent("esx:showNotification", source, "~r~Fonds insuffisants sur le compte bancaire.")
    end
end)