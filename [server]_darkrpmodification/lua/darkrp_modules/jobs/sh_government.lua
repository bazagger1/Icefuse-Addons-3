--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_darkrpmodification/lua/darkrp_modules/jobs/sh_government.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

TEAM_PRESIDENT = AddExtraTeam("President", {
	color = Color(236, 112, 99, 255),
	model = "models/icefuse_networks/players/trump/trump.mdl",
	description = [[As the president you have to govern the people to the best of your ability, this means you need to be hosting campaigns and political debates along with getting to know the great people of your community, remember, you are the leader of this town, this means you can and will make big decisions that may effect how people view you as a leader. Be aware that in your campaign to become the president, you may have attracted enemies, or the eye of injustice, those that would see you dead. Be mindful that at any given time someone could make an attempt on your life. You must be ready to survive that situation, which means having the best security.
  
Note: Mind your roleplay with this job very carefully. Do not FailRP as president. Do not kill any players unless you must defend yourself, however in general your secret service offers this protection for you, and it advised that you stay away from any gunfire to avoid fatal injuries. You are the president after all! You didn't work this hard for all these years just to get gunned down by a criminal! The warrants you can issue are reserved for players who have been shown as definitively breaking the law. False warrants are punishable as abuse, so always have sound reasons to place or accept them. Abuse of the laws or the lockdown features will be punished with a jail stay or a ban. No exceptions. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
	Commands:
  
	- /mcon (president menu)
	- /mcon (president menu)
	- /pcon (police menu)
	- /lockdown
	- /unlockdown
	- /warrant {playername} "reason"
	- /unwarrant {playername}
	- /broadcast (message)
	- /lottery (100 - 1000)
	- /givelicense
	- /addlaw
	- /removelaw (number)
	- /placelaws
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Accept issued warrants within roleplay rules.
	2. Charge money for the release of prisoners.
	3. Manage city-wide lockdowns within roleplay rules.
	4. Make and manage laws for the city within roleplay expectations.
	5. Make the nation great again.
  
Required Level: 10
------------------
]],
	weapons = {"unarrest_stick", "ifn_fradio", "weapon_vape_american"},
	command = "president",
	max = 1,
	level = 10,
	salary = 100,
	admin = 0,
	vote = true,
	hasLicense = true,
	mayor = true,
    category = "Government",
    sortOrder = 10,
    tier = 'M',
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
	
	PlayerDeath = function(ply, weapon, killer)
		ply:teamBan()
		ply:changeTeam(GAMEMODE.DefaultTeam, true)
		if killer:IsPlayer() then
			DarkRP.notifyAll(0, 4, "The President has been killed and we need a new president!")
		else
			DarkRP.notifyAll(0, 4, "The President has been killed and we need a new president!")
		end
	end
})
--=========================================================================================================
TEAM_SECRET_SERVICE = AddExtraTeam("Secret Service", {
	color = Color(93, 109, 126, 255),
	model = {
	"models/icefuse_networks/players/cops/highsec01smm.mdl", 
	"models/icefuse_networks/players/cops/highsec02smm.mdl",
	"models/icefuse_networks/players/cops/jewelsec.mdl"
	},
	description = [[As the secret service, you're to protect the president with your life at all costs. This is not a police officer role. Do not use this job as if you are a patrolling officer, or you will be demoted. If there is no president online, then there is no reason for Secret Service and demotion will occur.
  
Note: Mind your roleplay with this job very carefully. Do not FailRP as Secret Service. Weapons are reserved for players who have been shown as definitively making an attempt on the president's life. Your primary goal is his safety, wherever he goes. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
	Commands:
  
	- /pcon (police menu)
	- /warrant {playername} "reason"
	- /unwarrant {playername}
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Protect the president at all costs.
	2. Issue/revoke warrants within roleplay rules.
	3. Arrest or defend against any individuals who attempt to harm the president.
	4. Do whatever is neccessary to secure the president and ensure his lasting safety.
  
  
Required Level: 15
------------------
]],
	weapons = {"icefuse_stungun", "weapon_r_handcuffs", "arrest_stick", "unarrest_stick", "door_ram", "icefuse_police_baton", "m9k_m92beretta", "m9k_mp7", "weaponchecker", "m9k_m3", "ifn_fradio"},
	command = "secret_service",
	max = 10,
	level = 15,
	salary = 80,
	admin = 0,
	vote = true, --vote = true,
	hasLicense = true,
	chief = false,

	PlayerSpawn = function(ply) ply:SetHealth("200") ply:SetMaxHealth("100") ply:SetArmor("30") return CLIENT end,
    category = "Government",
    sortOrder = 20,
    tier = 'M'
})
--=========================================================================================================
TEAM_FIB = AddExtraTeam("FIB [T6]", {
	color = Color(210, 180, 222, 255),
	model = {
	"models/icefuse_networks/players/cops/fiboffice1.mdl", 
	"models/icefuse_networks/players/cops/fiboffice2.mdl",
	"models/icefuse_networks/players/cops/fibsec.mdl"
	},
	description = [[As a FIB agent you're to protect the president if requested and cut down the crime in our great city through coordinated law enforcement efforts and investigations. Through your investigative services you will help reduce criminal activity and protect the residents of the city from large scale threats like terrorism and cult/extremist activities. 
  
Note: Mind your roleplay with this job very carefully. Do not FailRP as Secret Service. This is not a police officer role! Do not use this job as if you are a patrolling officer, or you will be demoted. If there is no president or extremist groups online, then there is no reason for FIB agents and demotion will occur. Weapons are reserved for players who have been shown as definitively making an attempt on the president's life. Your primary goal is his safety, wherever he goes. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
	Commands:
  
	- /pcon (police menu)
	- /warrant {playername} "reason"
	- /unwarrant {playername}
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Protect the president and city at all costs.
	2. Issue/revoke warrants within roleplay rules.
	3. Arrest or defend against any individuals who attempt to harm the president or public.
	4. Do whatever is neccessary to secure the president and ensure his lasting safety.
  
  
Required Level: 15
------------------
]],
	weapons = {"icefuse_stungun", "weapon_r_handcuffs", "arrest_stick", "unarrest_stick", "door_ram", "icefuse_police_baton", "m9k_m92beretta", "m9k_ithacam37", "weaponchecker", "m9k_m416", "ifn_fradio"},
	command = "fib_government",
	max = 10,
	level = 15,
	salary = 80,
	admin = 0,
	vote = true, --vote = true,
	hasLicense = true,
	chief = false,

	PlayerSpawn = function(ply) ply:SetHealth("200") ply:SetMaxHealth("100") ply:SetArmor("30") return CLIENT end,
    category = "Government",
    sortOrder = 25,
    tier = '6'
})
--=========================================================================================================
TEAM_SWAT_CHIEF = AddExtraTeam("SWAT Chief [T5]", {
	color = Color(93, 173, 226, 255),
	model = {"models/icefuse_networks/players/cops/swat01smy.mdl"},
	description = [[As the SWAT chief you are the commanding officer of all SWAT units, making you responsible for all the units dealing with any high-risk tactical situations such as bomb defusing, hostage situations, terrorist activity or outbreaks of great violence. You are to coordinate these units and direct them as they execute your orders and keep the community safe from violence. As chief you have the ability to whitelist other players for SWAT roles who have been thoroughly trained for the positions. Abuse of this position or its features will result in a demotion and a jail session, or a ban.
  
Note: Mind your roleplay with this job very carefully. Do not FailRP as SWAT chief. Lethal weapons are strictly reserved for players who have been shown as definitively hostile or attempting to harm authorities. Your primary goal is public safety. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
	Commands:
  
	- /pcon (police menu)
	- /warrant {playername} "reason"
	- /unwarrant {playername}
	- /whitelist
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Issue/revoke warrants within roleplay rules.
	2. Arrest individuals who break the law or promote violence.
	3. Deal with hostage negotiations.
	4. Only use lethal force where absolutely necessary.
	5. Whitelist trained police officers for the SWAT forces.
  
  
Required Level: 10
------------------
]],
	weapons = {"icefuse_stungun", "weapon_r_handcuffs", "arrest_stick", "unarrest_stick",  "door_ram", "icefuse_police_baton", "m9k_hk45", "m9k_m16a4_acog", "weaponchecker", "icefuse_police_shield", "m9k_mossberg590", "m9k_mp5", "ifn_fradio"},
	command = "swat_chief",
	max = 1,
	level = 10,
	salary = 150,
	admin = 0,
	vote = true, --vote = true,
	hasLicense = true,
	chief = true,
	PlayerSpawn = function(ply) ply:SetRunSpeed("330") ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("25") return CLIENT end,
    category = "Government",
    sortOrder = 30,
    tier = '5'
})
--=========================================================================================================
TEAM_SWAT_HEAVY = AddExtraTeam("SWAT Heavy [T4]", {
	color = Color(93, 173, 226, 255),
	model = {"models/icefuse_networks/players/cops/swat01smy.mdl"},
	description = [[As a SWAT Heavy officer you work as a defensive (or offensive) force during high-risk tactical situations such as bomb defusing, hostage situations, terrorist activity or outbreaks of great violence. You are to coordinate with your active chief where appropriate and complete any assignments given to you, as well as protect the community from violence at all times.
  
Note: Mind your roleplay with this job very carefully. Do not FailRP as SWAT. Lethal weapons are strictly reserved for players who have been shown as definitively hostile or attempting to harm authorities or other players. Your primary goal is public safety. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
	Commands:
  
	- /pcon (police menu)
	- /warrant {playername} "reason"
	- /unwarrant {playername}
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Issue/revoke warrants within roleplay rules.
	2. Arrest individuals who break the law using non-lethal force.
	3. Eliminate threats to public or officer safety only where lethal force is required.
  
  
Required Level: 9
------------------
]],
	weapons = {"icefuse_stungun", "weapon_r_handcuffs", "arrest_stick", "unarrest_stick",  "door_ram", "icefuse_police_baton", "m9k_hk45", "m9k_minigun", "weaponchecker", "icefuse_police_shield", "m9k_remington870", "ifn_fradio"},
	command = "swat_heavy",
	max = 2,
	level = 9,
	salary = 110,
	admin = 0,
	vote = true,
	hasLicense = true,
	PlayerSpawn = function(ply) ply:SetRunSpeed("250") ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("25") return CLIENT end,
    category = "Government",
    sortOrder = 40,
    tier = '4'
})
--=========================================================================================================
TEAM_SWAT_SNIPER = AddExtraTeam("SWAT Sniper [T3]", {
	color = Color(93, 173, 226, 255),
	model = {"models/icefuse_networks/players/cops/swat01smy.mdl"},
	description = [[A SWAT Sniper is a ranged SWAT unit, effective in the termination of high-priority targets during situations such as bomb defusing, hostage situations, terrorist activity or outbreaks of great violence. You are to coordinate with your active chief where appropriate and complete any assignments given to you, as well as protect the community from violence at all times.
  
Note: Mind your roleplay with this job very carefully. Do not FailRP as SWAT. Lethal weapons are strictly reserved for players who have been shown as definitively hostile or attempting to harm authorities or other players. Your primary goal is public safety. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
	Commands:
  
	- /pcon (police menu)
	- /warrant {playername} "reason"
	- /unwarrant {playername}
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Issue/revoke warrants within roleplay rules.
	2. Arrest individuals who break the law using non-lethal force.
	3. Eliminate threats to public or officer safety only where lethal force is required.
  
  
Required Level: 9
------------------
]],
	weapons = {"icefuse_stungun", "weapon_r_handcuffs", "arrest_stick", "unarrest_stick",  "door_ram", "icefuse_police_baton", "m9k_hk45", "m9k_barret_m82", "weaponchecker", "icefuse_police_shield", "m9k_remington870", "ifn_fradio"},
	command = "swat_sniper",
	max = 3,
	level = 9,
	salary = 100,
	admin = 0,
	vote = true,
	hasLicense = true,
	PlayerSpawn = function(ply) ply:SetRunSpeed("300") ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("25") return CLIENT end,
    category = "Government",
    sortOrder = 50,
    tier = '3'
})
--=========================================================================================================
TEAM_SWAT_MEDIC = AddExtraTeam("SWAT Medic [T1]", {
	color = Color(93, 173, 226, 255),
	model = {"models/icefuse_networks/players/cops/swat01smy.mdl"},
	description = [[A SWAT Medic is a trained combat medic trained to assist officers in the field during high-risk tactical situations such as bomb defusing, hostage situations, terrorist activity or outbreaks of great violence. You are to coordinate with your active chief where appropriate and complete any assignments given to you, as well as protect the community from violence at all times.
  
Note: Mind your roleplay with this job very carefully. Do not FailRP as SWAT. Lethal weapons are strictly reserved for players who have been shown as definitively hostile or attempting to harm authorities or other players. Your primary goal is public safety. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
	Commands:
  
	- /pcon (police menu)
	- /warrant {playername} "reason"
	- /unwarrant {playername}
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Issue/revoke warrants within roleplay rules.
	2. Arrest individuals who break the law using non-lethal force.
	3. Eliminate threats to public or officer safety only where lethal force is required.
  
  
Required Level: 9
------------------
]],
	weapons = {"icefuse_stungun", "weapon_r_handcuffs", "arrest_stick", "unarrest_stick",  "door_ram", "icefuse_police_baton", "m9k_m92beretta", "icefuse_medkit", "weaponchecker", "icefuse_police_shield", "m9k_mp5", "ifn_fradio"},
	command = "swat_medic",
	max = 5,
	level = 9,
	salary = 70,
	admin = 0,
	vote = true,
	hasLicense = true,
	PlayerSpawn = function(ply) ply:SetRunSpeed("300") ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("25") return CLIENT end,
    category = "Government",
    sortOrder = 60,
    tier = '1'
})
--=========================================================================================================
TEAM_SWAT = AddExtraTeam("SWAT", {
	color = Color(93, 173, 226, 255),
	model = {"models/icefuse_networks/players/cops/swat01smy.mdl"},
	description = [[A SWAT unit is a highly trained, specialized unit of the government force dispatched during high-risk tactical situations such as bomb defusing, hostage situations, terrorist activity or outbreaks of great violence. You are to coordinate with your active chief where appropriate and complete any assignments given to you, as well as protect the community from violence at all times.
  
Note: Mind your roleplay with this job very carefully. Do not FailRP as SWAT. Lethal weapons are strictly reserved for players who have been shown as definitively hostile or attempting to harm authorities or other players. Your primary goal is public safety. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
	Commands:
  
	- /pcon (police menu)
	- /warrant {playername} "reason"
	- /unwarrant {playername}
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Issue/revoke warrants within roleplay rules.
	2. Arrest individuals who break the law using non-lethal force.
	3. Eliminate threats to public or officer safety only where lethal force is required.
  
  
Required Level: 9 
------------------
]],
	weapons = {"icefuse_stungun", "weapon_r_handcuffs", "arrest_stick", "unarrest_stick", "door_ram", "icefuse_police_baton", "m9k_m92beretta", "m9k_m249lmg", "weaponchecker", "icefuse_police_shield", "m9k_mp5", "ifn_fradio"},
	command = "swat",
	max = 5,
	level = 9,
	salary = 70,
	admin = 0,
	vote = true,
	hasLicense = true,
	PlayerSpawn = function(ply) ply:SetRunSpeed("300") ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("25") return CLIENT end,
    category = "Government",
    sortOrder = 70,
    tier = 'M'
})
--=========================================================================================================
TEAM_POLICE_CHIEF = AddExtraTeam("Sheriff", {
	color = Color(133, 193, 233, 255),
	model = {
	"models/icefuse_networks/players/cops/sheriff01sfy.mdl", 
	"models/icefuse_networks/players/cops/sheriff01smy.mdl"
	},
	description = [[As the sheriff you are to coordinate your fellow officers in their effort to protect and serve. You are in direct control of your force and it is your job to mind their actions at all times. Do not FailRP as sheriff. As the sheriff you have the ability to whitelist other players for police roles who have been thoroughly trained for the positions. Abuse of this position or its features will result in a demotion and a jail session, or a ban.
  
Note: Mind your roleplay with this job very carefully. Arrest other players only when there is a realistic, legal reason. The same policy stands for warrants. False arrests or warrants are punishable as abuse, so always have sound reasons to initiate. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
	Commands:
  
	- /pcon (police menu)
	- /givelicense
	- /warrant {playername} "reason"
	- /unwarrant {playername}
	- /whitelist
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Issue/revoke warrants within roleplay rules.
	2. Arrest individuals who break the law using non-lethal force.
	3. Eliminate threats to public or officer safety only where lethal force is required.
	4. Arrange and execute police raids.
	5. Charge money for the release of prisoners.
	6. Whitelist trained officers for police forces.
  
  
Required Level: 10
------------------
]],
	weapons = {"icefuse_stungun", "weapon_r_handcuffs", "door_ram", "icefuse_police_baton", "arrest_stick", "unarrest_stick", "m9k_m92beretta", "weaponchecker", "icefuse_police_shield", "m9k_smgp90", "ifn_fradio"},
	command = "sheriff_government",
	max = 1,
	level = 10,
	salary = 60,
	admin = 0,
	vote = true,
	hasLicense = true,
	chief = true,
	PlayerSpawn = function(ply) ply:SetRunSpeed("300") ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("15") return CLIENT end,
    category = "Government",
    sortOrder = 80,
    tier = 'M'
})
--=========================================================================================================
TEAM_POLICE_OFFICER = AddExtraTeam("Police Officer", {
	color = Color(133, 193, 233, 255),
	model = {
	"models/icefuse_networks/players/cops/cop01sfy.mdl", 
	"models/icefuse_networks/players/cops/cop01smy.mdl"
	},
	description = [[As a police officer your default job is to patrol the streets and protect the great citizens of the city. You will also assist in the training of new cadets on the force if required by your superiors. This is a position of authority, and as such you are to follow all protocols at all times. Never discharge your firearm without good cause, and adhere to all laws of the city. You are to set an example for the rest of the city while you take orders from the sheriff and follow their instructions.
  
Note: Mind your roleplay with this job very carefully. Do not FailRP as an officer. This is a fun job, though it requires a serious player or you will get yourself in trouble. Do not use lethal force unless it is your last resort. You have nonlethal tools which you are trained to use. Arrest other players only when there is a realistic, legal reason. The same policy stands for warrants. False arrests or warrants are punishable as abuse, so always have sound reasons to initiate. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
	Commands:
  
	- /pcon (police menu)
	- /warrant {playername} "reason"
	- /unwarrant {playername}
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Issue/revoke warrants within roleplay rules. Do not ever issue false warrants.
	2. Arrest individuals who break the law using non-lethal force.
	3. Eliminate threats to public or officer safety only where lethal force is required.
	4. Complete any authorized orders assigned to you by the sheriff.
  
  
Required Level: 5
------------------
]],
	weapons = {"icefuse_stungun", "m9k_remington870", "weapon_r_handcuffs", "door_ram", "icefuse_police_baton", "arrest_stick", "unarrest_stick", "m9k_usp", "weaponchecker", "ifn_fradio"},
	command = "police_officer",
	max = 15,
	level = 5,
	salary = 50,
	admin = 0,
	vote = true,
	hasLicense = true,
	PlayerSpawn = function(ply) ply:SetRunSpeed("300") ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Government",
    sortOrder = 90,
    tier = 'M'
})
--=========================================================================================================
TEAM_HIGHWAY_PATROL = AddExtraTeam("Highway Patrol", {
	color = Color(171, 235, 198, 255),
	model = {"models/icefuse_networks/players/cops/hwaycop01smy.mdl"},
	description = [[As a highway patrolman your default job is to patrol the streets and protect the great citizens of the city, especially on the roadways and city streets. You will also assist in the training of new cadets on the force if required by your superiors. This is a position of authority, and as such you are to follow all protocols at all times. Never discharge your firearm without good cause, and adhere to all laws of the city. You are to set an example for the rest of the city while you take orders from the sheriff and follow their instructions.
  
Note: Mind your roleplay with this job very carefully. Do not FailRP as an officer. This is a fun job, though it requires a serious player or you will get yourself in trouble. Do not use lethal force unless it is your last resort. You have nonlethal tools which you are trained to use. Arrest other players only when there is a realistic, legal reason. The same policy stands for warrants. False arrests or warrants are punishable as abuse, so always have sound reasons to initiate. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
	Commands:
  
	- /pcon (police menu)
	- /warrant {playername} "reason"
	- /unwarrant {playername}
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Issue/revoke warrants within roleplay rules. Do not ever issue false warrants.
	2. Arrest individuals who break the law using non-lethal force.
	3. Eliminate threats to public or officer safety only where lethal force is required.
	4. Complete any authorized orders assigned to you by the sheriff.
  
  
Required Level: 5
------------------
]],
	weapons = {"icefuse_stungun", "m9k_remington870", "weapon_r_handcuffs", "door_ram", "icefuse_police_baton", "arrest_stick", "unarrest_stick", "m9k_usp", "weaponchecker", "ifn_fradio"},
	command = "highway_patrol",
	max = 10,
	level = 5,
	salary = 50,
	admin = 0,
	vote = true,
	hasLicense = true,
	PlayerSpawn = function(ply) ply:SetRunSpeed("300") ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Government",
    sortOrder = 100,
    tier = 'M'
})
--=========================================================================================================
TEAM_PRISON_GUARD = AddExtraTeam("Prison Guard", {
	color = Color(213, 219, 219, 255),
	model = {"models/icefuse_networks/players/cops/prisguard01smm.mdl"},
	description = [[As a prison guard your default job is to secure and protect all of the inmates within the PD. Their lives may be in danger due to other inmates, or they may try to escape! It is up to you to make sure that does not happen, and that no harm comes to any individual within your department. The streets are only clean if the criminals stay locked up tight. By doing this important job you are protecting all the other great citizens of the city. You will also assist in the training of new cadets on the force if required by your superiors. This is a position of authority, and as such you are to follow all protocols at all times. Never discharge your firearm or tools without good cause, and adhere to all laws of the city. You are to set an example for the rest of the city while you take orders from the sheriff and follow their instructions.
  
Note: Mind your roleplay with this job very carefully. Do not FailRP as an officer. This is a fun job, though it requires a serious player or you will get yourself in trouble. Do not use lethal force unless it is your last resort. You have nonlethal tools which you are trained to use. Arrest other players only when there is a realistic, legal reason. The same policy stands for warrants. False arrests or warrants are punishable as abuse, so always have sound reasons to initiate. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Protect the jail and the inmates within from themselves and others.
	2. Prevent the escape or other damaging actions of inmates.
	3. Reasonably discipline inmates that act out excessively.
	4. Eliminate threats to public or officer safety only where lethal force is required.
	5. Complete any authorized orders assigned to you by the sheriff.
  
  
Required Level: 5
------------------
]],
	weapons = {"icefuse_stungun", "weapon_r_handcuffs", "icefuse_police_baton", "arrest_stick", "unarrest_stick", "m9k_usp", "weaponchecker", "ifn_fradio"},
	command = "prison_guard",
	max = 10,
	level = 5,
	salary = 50,
	admin = 0,
	vote = true,
	hasLicense = true,
	PlayerSpawn = function(ply) ply:SetRunSpeed("300") ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Government",
    sortOrder = 110,
    tier = 'M'
})
--=========================================================================================================
TEAM_FIRE_FIGHTER = AddExtraTeam("Fire Fighter", {
	color = Color(250, 215, 160, 255),
	model = {"models/icefuse_networks/players/cops/fireman.mdl"},
	description = [[Put out the fires around the community and save lives (you get paid for extinguishing fires as well)! As a fire fighter you will combat fires in the area caused by various weapons or accidents.
  
Note: Mind your roleplay with this job very carefully. Do not FailRP a firefighter. Your only concern is putting out fires where you can find them for cash. Do not use lethal force unless it is your last resort. Follow your training. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Put out fires like a boss for cash payments.
	2. Drive a pretty cool truck.
------------------
]],
	weapons = {"swep_extinguisher", "door_ram", "ifn_fradio"},
	command = "fire_fighter",
	max = 6,
	salary = 50,
	admin = 0,
	vote = false,
	hasLicense = false,
	PlayerSpawn = function(ply) ply:SetRunSpeed("300") ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Government",
    sortOrder = 130,
    tier = 'M'
})



















































--=========================================================================================================
TEAM_IRON_MAN = AddExtraTeam("Iron Man", {
	color = Color(205, 97, 85, 255),
	model = "models/kryptonite/inf_ironman/inf_ironman.mdl",
	description = [[You are a superhero bro...
	
	Note: Mind your roleplay with this job very carefully. Do not FailRP as president. Do not kill any players unless you must defend yourself, however in general your secret service offers this protection for you, and it advised that you stay away from any gunfire to avoid fatal injuries. You are the president after all! You didn't work this hard for all these years just to get gunned down by a criminal! The warrants you can issue are reserved for players who have been shown as definitively breaking the law. False warrants are punishable as abuse, so always have sound reasons to place or accept them. Abuse of the laws or the lockdown features will be punished with a jail stay or a ban. No exceptions. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
	Commands:
  
	- /mcon (president menu)
	- /mcon (president menu)
	- /pcon (police menu)
	- /lockdown
	- /unlockdown
	- /warrant {playername} "reason"
	- /unwarrant {playername}
	- /broadcast (message)
	- /lottery (100 - 1000)
	- /givelicense
	- /addlaw
	- /removelaw (number)
	- /placelaws
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Accept issued warrants within roleplay rules.
	2. Charge money for the release of prisoners.
	3. Manage city-wide lockdowns within roleplay rules.
	4. Make and manage laws for the city within roleplay expectations.
	5. Make the nation great again.
  
------------------]],
	weapons = {"icefuse_stungun", "weapon_r_handcuffs", "icefuse_police_baton", "arrest_stick", "unarrest_stick", "weaponchecker", "ifn_fradio"},
	command = "iron_man",
	max = 1,
	salary = 30,
	admin = 0,
	vote = true,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "Government",
    sortOrder = 140,
    tier = 'M'
})
--=========================================================================================================
TEAM_WAR_MACHINE = AddExtraTeam("War Machine", {
	color = Color(93, 109, 126, 255),
	model = "models/kryptonite/inf_war_machine/inf_war_machine.mdl",
	description = [[You are a superhero bro...
	
	Note: Mind your roleplay with this job very carefully. Do not FailRP as president. Do not kill any players unless you must defend yourself, however in general your secret service offers this protection for you, and it advised that you stay away from any gunfire to avoid fatal injuries. You are the president after all! You didn't work this hard for all these years just to get gunned down by a criminal! The warrants you can issue are reserved for players who have been shown as definitively breaking the law. False warrants are punishable as abuse, so always have sound reasons to place or accept them. Abuse of the laws or the lockdown features will be punished with a jail stay or a ban. No exceptions. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
	Commands:
  
	- /mcon (president menu)
	- /mcon (president menu)
	- /pcon (police menu)
	- /lockdown
	- /unlockdown
	- /warrant {playername} "reason"
	- /unwarrant {playername}
	- /broadcast (message)
	- /lottery (100 - 1000)
	- /givelicense
	- /addlaw
	- /removelaw (number)
	- /placelaws
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Accept issued warrants within roleplay rules.
	2. Charge money for the release of prisoners.
	3. Manage city-wide lockdowns within roleplay rules.
	4. Make and manage laws for the city within roleplay expectations.
	5. Make the nation great again.
  
------------------]],
	weapons = {"icefuse_stungun", "weapon_r_handcuffs", "icefuse_police_baton", "arrest_stick", "unarrest_stick", "weaponchecker", "ifn_fradio"},
	command = "war_machine",
	max = 1,
	salary = 30,
	admin = 0,
	vote = true,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "Government",
    sortOrder = 150,
    tier = 'M'
})
--=========================================================================================================
TEAM_SPIDERMAN = AddExtraTeam("Spiderman", {
	color = Color(203, 67, 53, 255),
	model = "models/player/nogitsu/civilwarspiderman/civilwarspider_pm.mdl",
	description = [[You are a superhero bro...
	
	Note: Mind your roleplay with this job very carefully. Do not FailRP as president. Do not kill any players unless you must defend yourself, however in general your secret service offers this protection for you, and it advised that you stay away from any gunfire to avoid fatal injuries. You are the president after all! You didn't work this hard for all these years just to get gunned down by a criminal! The warrants you can issue are reserved for players who have been shown as definitively breaking the law. False warrants are punishable as abuse, so always have sound reasons to place or accept them. Abuse of the laws or the lockdown features will be punished with a jail stay or a ban. No exceptions. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
	Commands:
  
	- /mcon (president menu)
	- /mcon (president menu)
	- /pcon (police menu)
	- /lockdown
	- /unlockdown
	- /warrant {playername} "reason"
	- /unwarrant {playername}
	- /broadcast (message)
	- /lottery (100 - 1000)
	- /givelicense
	- /addlaw
	- /removelaw (number)
	- /placelaws
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Accept issued warrants within roleplay rules.
	2. Charge money for the release of prisoners.
	3. Manage city-wide lockdowns within roleplay rules.
	4. Make and manage laws for the city within roleplay expectations.
	5. Make the nation great again.
  
------------------]],
	weapons = {"weapon_spidermanswep", "icefuse_stungun", "weapon_r_handcuffs", "icefuse_police_baton", "arrest_stick", "unarrest_stick", "weaponchecker", "ifn_fradio"},
	command = "spiderman",
	max = 1,
	salary = 30,
	admin = 0,
	vote = true,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "Government",
    sortOrder = 160,
    tier = 'M'
})
--=========================================================================================================
TEAM_YODA_HULK = AddExtraTeam("Yoda Hulk", {
	color = Color(82, 190, 128, 255),
	model = "models/helios/yodahulk35.mdl",
	description = [[You are a superhero bro...
	
	Note: Mind your roleplay with this job very carefully. Do not FailRP as president. Do not kill any players unless you must defend yourself, however in general your secret service offers this protection for you, and it advised that you stay away from any gunfire to avoid fatal injuries. You are the president after all! You didn't work this hard for all these years just to get gunned down by a criminal! The warrants you can issue are reserved for players who have been shown as definitively breaking the law. False warrants are punishable as abuse, so always have sound reasons to place or accept them. Abuse of the laws or the lockdown features will be punished with a jail stay or a ban. No exceptions. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
	Commands:
  
	- /mcon (president menu)
	- /mcon (president menu)
	- /pcon (police menu)
	- /lockdown
	- /unlockdown
	- /warrant {playername} "reason"
	- /unwarrant {playername}
	- /broadcast (message)
	- /lottery (100 - 1000)
	- /givelicense
	- /addlaw
	- /removelaw (number)
	- /placelaws
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Accept issued warrants within roleplay rules.
	2. Charge money for the release of prisoners.
	3. Manage city-wide lockdowns within roleplay rules.
	4. Make and manage laws for the city within roleplay expectations.
	5. Make the nation great again.
  
------------------]],
	weapons = {"weapon_crowbar", "icefuse_stungun", "weapon_r_handcuffs", "icefuse_police_baton", "arrest_stick", "unarrest_stick", "weaponchecker", "ifn_fradio"},
	command = "yoda_hulk",
	max = 1,
	salary = 30,
	admin = 0,
	vote = true,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "Government",
    sortOrder = 170,
    tier = 'M'
})
--=========================================================================================================
TEAM_AQUAMAN = AddExtraTeam("Aquaman", {
	color = Color(133, 193, 233, 255),
	model = "models/kryptonite/inj2_aquaman_jl/inj2_aquaman_jl.mdl",
	description = [[You are Aquaman... Find the leftsharks and attempt to command them into battle!
	
	Note: Mind your roleplay with this job very carefully. Do not FailRP as president. Do not kill any players unless you must defend yourself, however in general your secret service offers this protection for you, and it advised that you stay away from any gunfire to avoid fatal injuries. You are the president after all! You didn't work this hard for all these years just to get gunned down by a criminal! The warrants you can issue are reserved for players who have been shown as definitively breaking the law. False warrants are punishable as abuse, so always have sound reasons to place or accept them. Abuse of the laws or the lockdown features will be punished with a jail stay or a ban. No exceptions. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
	Commands:
  
	- /mcon (president menu)
	- /mcon (president menu)
	- /pcon (police menu)
	- /lockdown
	- /unlockdown
	- /warrant {playername} "reason"
	- /unwarrant {playername}
	- /broadcast (message)
	- /lottery (100 - 1000)
	- /givelicense
	- /addlaw
	- /removelaw (number)
	- /placelaws
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Accept issued warrants within roleplay rules.
	2. Charge money for the release of prisoners.
	3. Manage city-wide lockdowns within roleplay rules.
	4. Make and manage laws for the city within roleplay expectations.
	5. Make the nation great again.
  
------------------]],
	weapons = {"icefuse_stungun", "weapon_r_handcuffs", "icefuse_police_baton", "arrest_stick", "unarrest_stick", "weaponchecker", "ifn_fradio"},
	command = "aquaman",
	max = 1,
	salary = 30,
	admin = 0,
	vote = true,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "Government",
    sortOrder = 180,
    tier = 'M'
})
--=========================================================================================================
TEAM_BATMAN = AddExtraTeam("Batman", {
	color = Color(33, 47, 61, 255),
	model = {"models/player/superheroes/batman.mdl"},
	description = [[You are a superhero bro...
	
	Note: Mind your roleplay with this job very carefully. Do not FailRP as president. Do not kill any players unless you must defend yourself, however in general your secret service offers this protection for you, and it advised that you stay away from any gunfire to avoid fatal injuries. You are the president after all! You didn't work this hard for all these years just to get gunned down by a criminal! The warrants you can issue are reserved for players who have been shown as definitively breaking the law. False warrants are punishable as abuse, so always have sound reasons to place or accept them. Abuse of the laws or the lockdown features will be punished with a jail stay or a ban. No exceptions. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
	Commands:
  
	- /mcon (president menu)
	- /mcon (president menu)
	- /pcon (police menu)
	- /lockdown
	- /unlockdown
	- /warrant {playername} "reason"
	- /unwarrant {playername}
	- /broadcast (message)
	- /lottery (100 - 1000)
	- /givelicense
	- /addlaw
	- /removelaw (number)
	- /placelaws
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Accept issued warrants within roleplay rules.
	2. Charge money for the release of prisoners.
	3. Manage city-wide lockdowns within roleplay rules.
	4. Make and manage laws for the city within roleplay expectations.
	5. Make the nation great again.
  
------------------]],
	weapons = {"icefuse_stungun", "weapon_r_handcuffs", "icefuse_police_baton", "arrest_stick", "unarrest_stick", "weaponchecker", "ifn_fradio"},
	command = "batman",
	max = 1,
	salary = 30,
	admin = 0,
	vote = true,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "Government",
    sortOrder = 190,
    tier = 'M'
})
--=========================================================================================================
TEAM_SUPERMAN = AddExtraTeam("Superman", {
	color = Color(236, 112, 99, 255),
	model = "models/player/superheroes/superman.mdl",
	description = [[You are a superhero bro...
	
	Note: Mind your roleplay with this job very carefully. Do not FailRP as president. Do not kill any players unless you must defend yourself, however in general your secret service offers this protection for you, and it advised that you stay away from any gunfire to avoid fatal injuries. You are the president after all! You didn't work this hard for all these years just to get gunned down by a criminal! The warrants you can issue are reserved for players who have been shown as definitively breaking the law. False warrants are punishable as abuse, so always have sound reasons to place or accept them. Abuse of the laws or the lockdown features will be punished with a jail stay or a ban. No exceptions. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
	Commands:
  
	- /mcon (president menu)
	- /mcon (president menu)
	- /pcon (police menu)
	- /lockdown
	- /unlockdown
	- /warrant {playername} "reason"
	- /unwarrant {playername}
	- /broadcast (message)
	- /lottery (100 - 1000)
	- /givelicense
	- /addlaw
	- /removelaw (number)
	- /placelaws
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Accept issued warrants within roleplay rules.
	2. Charge money for the release of prisoners.
	3. Manage city-wide lockdowns within roleplay rules.
	4. Make and manage laws for the city within roleplay expectations.
	5. Make the nation great again.
  
------------------]],
	weapons = {"icefuse_stungun", "weapon_r_handcuffs", "icefuse_police_baton", "arrest_stick", "unarrest_stick", "weaponchecker", "ifn_fradio"},
	command = "superman",
	max = 1,
	salary = 30,
	admin = 0,
	vote = true,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "Government",
    sortOrder = 200,
    tier = 'M'
})
--=========================================================================================================
TEAM_BLACK_LIGHTNING = AddExtraTeam("Black Lightning", {
	color = Color(178, 186, 187, 255),
	model = "models/kryptonite/inj2_ios_blacklightning/inj2_ios_blacklightning.mdl",
	description = [[You are a superhero bro...
	
	Note: Mind your roleplay with this job very carefully. Do not FailRP as president. Do not kill any players unless you must defend yourself, however in general your secret service offers this protection for you, and it advised that you stay away from any gunfire to avoid fatal injuries. You are the president after all! You didn't work this hard for all these years just to get gunned down by a criminal! The warrants you can issue are reserved for players who have been shown as definitively breaking the law. False warrants are punishable as abuse, so always have sound reasons to place or accept them. Abuse of the laws or the lockdown features will be punished with a jail stay or a ban. No exceptions. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
	Commands:
  
	- /mcon (president menu)
	- /mcon (president menu)
	- /pcon (police menu)
	- /lockdown
	- /unlockdown
	- /warrant {playername} "reason"
	- /unwarrant {playername}
	- /broadcast (message)
	- /lottery (100 - 1000)
	- /givelicense
	- /addlaw
	- /removelaw (number)
	- /placelaws
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Accept issued warrants within roleplay rules.
	2. Charge money for the release of prisoners.
	3. Manage city-wide lockdowns within roleplay rules.
	4. Make and manage laws for the city within roleplay expectations.
	5. Make the nation great again.
  
------------------]],
	weapons = {"icefuse_stungun", "weapon_r_handcuffs", "icefuse_police_baton", "arrest_stick", "unarrest_stick", "weaponchecker", "ifn_fradio"},
	command = "black_lightning",
	max = 1,
	salary = 30,
	admin = 0,
	vote = true,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "Government",
    sortOrder = 210,
    tier = 'M'
})
--=========================================================================================================
TEAM_FIRESTORM = AddExtraTeam("Firestorm", {
	color = Color(176, 58, 46, 255),
	model = "models/player/tfa_dcu_firestorm.mdl",
	description = [[You are a superhero bro...
	
	Note: Mind your roleplay with this job very carefully. Do not FailRP as president. Do not kill any players unless you must defend yourself, however in general your secret service offers this protection for you, and it advised that you stay away from any gunfire to avoid fatal injuries. You are the president after all! You didn't work this hard for all these years just to get gunned down by a criminal! The warrants you can issue are reserved for players who have been shown as definitively breaking the law. False warrants are punishable as abuse, so always have sound reasons to place or accept them. Abuse of the laws or the lockdown features will be punished with a jail stay or a ban. No exceptions. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
	Commands:
  
	- /mcon (president menu)
	- /mcon (president menu)
	- /pcon (police menu)
	- /lockdown
	- /unlockdown
	- /warrant {playername} "reason"
	- /unwarrant {playername}
	- /broadcast (message)
	- /lottery (100 - 1000)
	- /givelicense
	- /addlaw
	- /removelaw (number)
	- /placelaws
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Accept issued warrants within roleplay rules.
	2. Charge money for the release of prisoners.
	3. Manage city-wide lockdowns within roleplay rules.
	4. Make and manage laws for the city within roleplay expectations.
	5. Make the nation great again.
  
------------------]],
	weapons = {"icefuse_stungun", "weapon_r_handcuffs", "icefuse_police_baton", "arrest_stick", "unarrest_stick", "weaponchecker", "ifn_fradio"},
	command = "firestorm",
	max = 1,
	salary = 30,
	admin = 0,
	vote = true,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "Government",
    sortOrder = 220,
    tier = 'M'
})
--=========================================================================================================
TEAM_POWER_RANGER = AddExtraTeam("Power Ranger", {
	color = Color(212, 172, 13, 255),
	model = {
	"models/kryptonite/ranger_black/ranger_black.mdl", 
	"models/kryptonite/ranger_blue/ranger_blue.mdl", 
	"models/kryptonite/ranger_green/ranger_green.mdl",
	"models/kryptonite/ranger_pink/ranger_pink.mdl", 
	"models/kryptonite/ranger_red/ranger_red.mdl", 
	"models/kryptonite/ranger_yellow/ranger_yellow.mdl"
	},
	description = [[You are a superhero bro...
	
	Note: Mind your roleplay with this job very carefully. Do not FailRP as president. Do not kill any players unless you must defend yourself, however in general your secret service offers this protection for you, and it advised that you stay away from any gunfire to avoid fatal injuries. You are the president after all! You didn't work this hard for all these years just to get gunned down by a criminal! The warrants you can issue are reserved for players who have been shown as definitively breaking the law. False warrants are punishable as abuse, so always have sound reasons to place or accept them. Abuse of the laws or the lockdown features will be punished with a jail stay or a ban. No exceptions. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
	Commands:
  
	- /mcon (president menu)
	- /mcon (president menu)
	- /pcon (police menu)
	- /lockdown
	- /unlockdown
	- /warrant {playername} "reason"
	- /unwarrant {playername}
	- /broadcast (message)
	- /lottery (100 - 1000)
	- /givelicense
	- /addlaw
	- /removelaw (number)
	- /placelaws
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Accept issued warrants within roleplay rules.
	2. Charge money for the release of prisoners.
	3. Manage city-wide lockdowns within roleplay rules.
	4. Make and manage laws for the city within roleplay expectations.
	5. Make the nation great again.
  
------------------]],
	weapons = {"icefuse_stungun", "weapon_r_handcuffs", "icefuse_police_baton", "arrest_stick", "unarrest_stick", "weaponchecker", "ifn_fradio"},
	command = "power_ranger",
	max = 1,
	salary = 30,
	admin = 0,
	vote = true,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "Government",
    sortOrder = 230,
    tier = 'M'
})
--=========================================================================================================
TEAM_NINJA_TURTLE = AddExtraTeam("Ninja Turtle", {
	color = Color(82, 190, 128, 255),
	model = "models/kryptonite/mutant_turtle/mutant_turtle.mdl",
	description = [[You are a superhero bro...
	
	Note: Mind your roleplay with this job very carefully. Do not FailRP as president. Do not kill any players unless you must defend yourself, however in general your secret service offers this protection for you, and it advised that you stay away from any gunfire to avoid fatal injuries. You are the president after all! You didn't work this hard for all these years just to get gunned down by a criminal! The warrants you can issue are reserved for players who have been shown as definitively breaking the law. False warrants are punishable as abuse, so always have sound reasons to place or accept them. Abuse of the laws or the lockdown features will be punished with a jail stay or a ban. No exceptions. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
	Commands:
  
	- /mcon (president menu)
	- /mcon (president menu)
	- /pcon (police menu)
	- /lockdown
	- /unlockdown
	- /warrant {playername} "reason"
	- /unwarrant {playername}
	- /broadcast (message)
	- /lottery (100 - 1000)
	- /givelicense
	- /addlaw
	- /removelaw (number)
	- /placelaws
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Accept issued warrants within roleplay rules.
	2. Charge money for the release of prisoners.
	3. Manage city-wide lockdowns within roleplay rules.
	4. Make and manage laws for the city within roleplay expectations.
	5. Make the nation great again.
  
------------------]],
	weapons = {"m9k_damascus", "icefuse_stungun", "weapon_r_handcuffs", "icefuse_police_baton", "arrest_stick", "unarrest_stick", "weaponchecker", "ifn_fradio"},
	command = "ninja_turtle",
	max = 5,
	salary = 30,
	admin = 0,
	vote = true,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "Government",
    sortOrder = 240,
    tier = 'M'
})
--=========================================================================================================
TEAM_STAR_LORD = AddExtraTeam("Star Lord", {
	color = Color(236, 112, 99, 255),
	model = "models/kryptonite/star_lord/star_lord.mdl",
	description = [[You are a superhero bro...
	
	Note: Mind your roleplay with this job very carefully. Do not FailRP as president. Do not kill any players unless you must defend yourself, however in general your secret service offers this protection for you, and it advised that you stay away from any gunfire to avoid fatal injuries. You are the president after all! You didn't work this hard for all these years just to get gunned down by a criminal! The warrants you can issue are reserved for players who have been shown as definitively breaking the law. False warrants are punishable as abuse, so always have sound reasons to place or accept them. Abuse of the laws or the lockdown features will be punished with a jail stay or a ban. No exceptions. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
	Commands:
  
	- /mcon (president menu)
	- /mcon (president menu)
	- /pcon (police menu)
	- /lockdown
	- /unlockdown
	- /warrant {playername} "reason"
	- /unwarrant {playername}
	- /broadcast (message)
	- /lottery (100 - 1000)
	- /givelicense
	- /addlaw
	- /removelaw (number)
	- /placelaws
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Accept issued warrants within roleplay rules.
	2. Charge money for the release of prisoners.
	3. Manage city-wide lockdowns within roleplay rules.
	4. Make and manage laws for the city within roleplay expectations.
	5. Make the nation great again.
  
------------------]],
	weapons = {"weapon_nomad", "icefuse_stungun", "weapon_r_handcuffs", "icefuse_police_baton", "arrest_stick", "unarrest_stick", "weaponchecker", "ifn_fradio"},
	command = "star_lord",
	max = 1,
	salary = 30,
	admin = 0,
	vote = true,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "Government",
    sortOrder = 250,
    tier = 'M'
})