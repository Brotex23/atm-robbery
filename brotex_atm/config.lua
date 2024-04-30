Brotex = {}
ox_inventory = exports.ox_inventory

-- Jobs that will be alerted
Brotex.Jobs = { 
    'police'
}

-- what dispatch you are using
Brotex.Notify = "custom" -- supports op-dispatch, core-dispatch, quasar-dispatch and cd_dispatch / custom - add your function on client.lua

-- Here you can choose how hard the skillcheck is. difficulty: 'easy' or 'medium' or 'hard' or table
Brotex.Skillcheck = 'medium'
Brotex.Skillcheck = 'medium'
Brotex.Skillcheck = 'medium'
Brotex.Skillcheck = 'medium'

Brotex.Progressbar = 'ox_lib-text'

-- choose what item do you need to start the robbery
Brotex.Robitem = 'WEAPON_CROWBAR'

Brotex.Reward = 'black_money' -- what do you get from the robbery
Brotex.MinAmount = 3000 -- the min amount you get from the robbery
Brotex.MaxAmount = 3500 -- the max amount you get from the robbery

-- the distance you want to the robbery
Brotex.Distance = 1.3

Brotex.RobbingTime = 50000

-- What icon do you want when you look at the ATM with the target?
Brotex.RobIcon = "fa-solid fa-star" -- You can choose the icons here: https://fontawesome.com/search

-- What models you want for the robbery
Brotex.Models = {
    `prop_atm_03`,
    `prop_fleeca_atm`,
    `prop_atm_01`,
    `prop_atm_02`
}

--- Ox lib lockpick keys
Brotex.Inputs = {'e', 'e', 'e', 'e'} 
