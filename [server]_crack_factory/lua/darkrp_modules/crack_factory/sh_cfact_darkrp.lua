--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_crack_factory/lua/darkrp_modules/crack_factory/sh_cfact_darkrp.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- TEAM_CRACK_COOK = DarkRP.createJob("Crack Cook [T5]", {
	-- color = Color(237, 187, 153, 255),
	-- model = {"models/icefuse_networks/players/citizens/trucker01smm.mdl"},
	-- description = [[You manufacture crack.. yehaaw]],
	-- weapons = {},
	-- command = "crack_cook",
	-- max = 4,
	-- salary = 0,
	-- admin = 0,
	-- vote = false,
	-- category = "Pro Criminals",
	-- hasLicense = false,
    -- tier = '5'
-- })
---------------------------------------------------------------------------
TEAM_CRACK_COOK = DarkRP.createJob("Crack Cook [T5]", {
	color = Color(237, 187, 153, 255),
	model = {"models/icefuse_networks/players/citizens/trucker01smm.mdl"},
	description = [[Crack cocaine, also known simply as crack, is a base form of cocaine that can be smoked. Crack offers a short but intense high to smokers. The Manual of Adolescent Substance Abuse Treatment calls it the most "addictive" (effective) form of cocaine. Crack cocaine is commonly used as a recreational drug. Crack first saw widespread use in primarily impoverished inner city neighborhoods in New York, Philadelphia, Baltimore, Washington DC, Los Angeles, and Miami in late 1984 and 1985; its rapid increase in use and availability is sometimes termed as the "crack epidemic". You are living life on the fucking edge! And due to your poor life choices and constant need to go go go, you need lots and lots of product to get through your daily routine, which consists of hustling to find the next paying customers and getting lit on the extra supply!
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. To be successful it requires a serious player or you will get yourself in trouble. Do not mug or kidnap as this job. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Cook crack like a boss (F4 > Purchasables).
------------------
]],	
	weapons = {},
	command = "crack_cook",
	max = 4,
	salary = 0,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
	category = "Pro Criminals",
    sortOrder = 101,
    tier = '5'
})
--=========================================================================================================
--
--
--
--
DarkRP.createEntity("Crack Heater", {
	ent = "the_crack_heater",
	model = "models/crackfactory/stove.mdl",
	price = 2000,
	max = 3,
	cmd = "buy_crack_heater",
	allowed = TEAM_CRACK_COOK,
    sortOrder = 10,
	category = "Contraband"
})
---------------------------------------------------------------------------
DarkRP.createEntity("Crack Barrel", {
	ent = "the_crack_barrel",
	model = "models/crackfactory/barrel.mdl",
	price = 1500,
	max = 3,
	cmd = "buy_crack_barrel",
	allowed = TEAM_CRACK_COOK,
    sortOrder = 20,
	category = "Contraband"
})
---------------------------------------------------------------------------
DarkRP.createEntity("Crack Pipe Kit", {
	ent = "the_crack_pipekit",
	model = "models/crackfactory/pipekit.mdl",
	price = 300,
	max = 3,
	cmd = "buy_crack_pipe_kit",
	allowed = TEAM_CRACK_COOK,
    sortOrder = 30,
	category = "Contraband"
})
---------------------------------------------------------------------------
DarkRP.createEntity("Crack Ferment Bottle", {
	ent = "the_crack_ferment",
	model = "models/crackfactory/milk_bottle.mdl",
	price = 100,
	max = 3,
	cmd = "buy_crack_ferment_bottle",
	allowed = TEAM_CRACK_COOK,
    sortOrder = 40,
	category = "Contraband"
})
---------------------------------------------------------------------------
DarkRP.createEntity("Crack Microwave", {
	ent = "the_crack_mircowave",
	model = "models/crackfactory/microwave.mdl",
	price = 500,
	max = 3,
	cmd = "buy_crack_microwave",
	allowed = TEAM_CRACK_COOK,
    sortOrder = 50,
	category = "Contraband"
})
---------------------------------------------------------------------------
DarkRP.createEntity("Crack Bowl", {
	ent = "the_crack_bowl",
	model = "models/crackfactory/bowl.mdl",
	price = 100,
	max = 3,
	cmd = "buy_crack_bowl",
	allowed = TEAM_CRACK_COOK,
    sortOrder = 60,
	category = "Contraband"
})
---------------------------------------------------------------------------
DarkRP.createEntity("Crack Compression Canister", {
	ent = "the_crack_compcan",
	model = "models/crackfactory/milkcan.mdl",
	price = 2000,
	max = 3,
	cmd = "buy_crack_compression_canister",
	allowed = TEAM_CRACK_COOK,
    sortOrder = 70,
	category = "Contraband"
})
---------------------------------------------------------------------------
DarkRP.createEntity("Crack Bucket", {
	ent = "the_crack_bucket",
	model = "models/crackfactory/bucket.mdl",
	price = 100,
	max = 3,
	cmd = "buy_crack_bucket",
	allowed = TEAM_CRACK_COOK,
    sortOrder = 80,
	category = "Contraband"
})
