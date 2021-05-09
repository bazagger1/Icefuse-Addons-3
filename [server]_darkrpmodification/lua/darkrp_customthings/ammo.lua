--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_darkrpmodification/lua/darkrp_customthings/ammo.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

DarkRP.createAmmoType("ar2", {
	name = "Rifle Ammo",
	model = "models/Items/BoxMRounds.mdl",
	price = 80,
    MISC_Ammunition = true,
    max = 3,
	amountGiven = 60
})

DarkRP.createAmmoType("smg1", {
	name = "SMG Rifle Ammo",
	model = "models/Items/BoxMRounds.mdl",
	price = 80,
    max = 3,
	amountGiven = 30
})

DarkRP.createAmmoType("buckshot", {
	name = "Shotgun Ammo",
	model = "models/Items/BoxBuckshot.mdl",
	price = 120,
    MISC_Ammunition = true,
    max = 3,
	amountGiven = 10
})

DarkRP.createAmmoType("pistol", {
	name = "Pistol Ammo",
	model = "models/Items/BoxSRounds.mdl",
	price = 60,
    MISC_Ammunition = true,
    max = 3,
	amountGiven = 24
})

DarkRP.createAmmoType("357", {
	name = "357 Ammo",
	model = "models/Items/357ammobox.mdl",
	price = 60,
    MISC_Ammunition = true,
    max = 3,
	amountGiven = 24
})

DarkRP.createAmmoType("SniperPenetratedRound", {
	name = "Sniper Ammo",
	model = "models/Items/BoxMRounds.mdl",
	price = 120,
    MISC_Ammunition = true,
    max = 3,
	amountGiven = 10
})