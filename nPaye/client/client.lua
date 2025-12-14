RegisterNetEvent("universalPayment:open")
AddEventHandler("universalPayment:open", function(amount)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "openPaymentUI",
        amount = amount
    })
end)

RegisterNUICallback("closeUI", function(_, cb)
    SetNuiFocus(false, false)
    cb({})
end)

RegisterNUICallback("payCash", function(data, cb)
    TriggerServerEvent("universalPayment:payCash", data.amount)
    SetNuiFocus(false, false)
    cb({})
end)

RegisterNUICallback("payCard", function(data, cb)
    TriggerServerEvent("universalPayment:payCard", data.amount)
    SetNuiFocus(false, false)
    cb({})
end)



---Command pour test dev
RegisterCommand("testpay", function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "openPaymentUI",
        amount = 123
    })
end)

RegisterCommand("testprice", function(source, args)
    local amount = tonumber(args[1]) or 50
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "openPaymentUI",
        amount = amount
    })
end)