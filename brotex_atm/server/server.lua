lib.locale()

RegisterNetEvent('brotex_atm:payout')
AddEventHandler('brotex_atm:payout', function()
    local amount = math.random(Brotex.MinAmount, Brotex.MaxAmount)
    local src = source
    ox_inventory:AddItem(src, Brotex.Reward, amount)
    TriggerClientEvent('ox_lib:notify', src, {
        type = 'success',
        description = locale('yougot', amount)
    })
end)