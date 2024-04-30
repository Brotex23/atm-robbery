lib.locale()

local function atmrob()
    TriggerServerEvent('brotex_atm')
end

RegisterNetEvent('brotex_atm:robStart')
AddEventHandler('brotex_atm:robStart', function()
    isRobbing = true
end)

RegisterNetEvent('brotex_atm:robEnd')
AddEventHandler('brotex_atm:robEnd', function()
    isRobbing = false
end)

local function main()
    local pos = GetEntityCoords(PlayerPedId())
    local _, dist = lib.getClosestObject(pos, 2.0)

local count = ox_inventory:Search('count', Brotex.Robitem)
if count > 0 then
    local result = lib.skillCheck({Brotex.Skillcheck, Brotex.Skillcheck, Brotex.Skillcheck, Brotex.Skillcheck}, Brotex.Inputs)
            
    if Brotex.Notify == "custom" then
        -- Function
    elseif Brotex.Notify == "quasar-dispatch" then
        local playerData = exports['qs-dispatch']:GetPlayerInfo()
        TriggerServerEvent('qs-dispatch:server:CreateDispatchCall', {
            job = Brotex.Jobs,
            callLocation = playerData.coords,
            callCode = { code = 'ATM Robbery' },
            message = "A "..playerData.sex.. "Is robbing a ATM at: ".. playerData.street_1,
            flashes = false,
            image = image or nil,
            blip = {
                sprite = 488,
                scale = 1.5,
                colour = 1,
                flashes = true,
                text = locale('robnotify'),
                time = (20 * 1000),
            }
        })
    elseif Brotex.Notify == "core-dispatch" then
        TriggerEvent("core-dispatch:SendDispatch", "ATM Robbery", "10-26", 500, {"police", "sheriff"})
    elseif Brotex.Notify == "op-dispatch" then
        for k,v in pairs(Brotex.Jobs) do
            local job = v -- Jobs that will recive the alert
            local text = locale('robnotify') -- Main text alert
            local coords = GetEntityCoords(PlayerPedId()) -- Alert coords
            local id = GetPlayerServerId(PlayerId()) -- Player that triggered the alert
            local title = locale('robnotify') -- Main title alert
            local panic = false -- Allow/Disable panic effect
            TriggerServerEvent('Opto_dispatch:Server:SendAlert', job, title, text, coords, panic, id)
         end
        end

        if result then
            if lib.progressCircle({
                duration = Brotex.RobbingTime,
                position = 'bottom',
                useWhileDead = false,
                canCancel = true,
                disable = {
                    car = true,
                    move = true,
                },
                anim = {
                    dict = 'weapons@first_person@aim_idle@p_m_zero@submachine_gun@assault_smg@fidgets@b',
                    clip = 'fidget_low_loop',
                    flag = 1
                },
            }) then
                TriggerServerEvent('brotex_atm:payout')
                atmrob()
            else
                ClearPedTasks(cache.ped) 
            end
        else
            lib.notify({type='error', description=locale('failed'),  position = 'top-center'})
        end
    else
        lib.notify({type='error', description=locale('noItem'), icon="fa-solid fa-power-off", position = 'top-center'})
    end
end

CreateThread(function()
    local options = {
        label = locale('atm'),
        icon = Brotex.RobIcon,
        distance = Brotex.Distance,
        onSelect = function()
            main()
        end

    }
    exports.ox_target:addModel(Brotex.Models, options)
 end)
