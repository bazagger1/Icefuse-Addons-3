--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_darkrpmodification/lua/darkrp_modules/jobs/sh_pro_criminals.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

--=========================================================================================================
TEAM_KU_KLUX_KLAN_LEADER = AddExtraTeam("Ku Klux Klan Leader [T6]", {
	color = Color(225, 225, 225, 255),
	model = "models/icefuse_networks/players/kkk/kkkblack.mdl",
	description = [[As a KKK Leader, you must lead the Klan by setting a bold example and fighting for the cause against all opposing forces. The first Klan flourished in the Southern United States in the late 1860s, then died out by the early 1870s. The second group was founded in the South in 1915 and it flourished nationwide in the early and mid-1920s, including urban areas of the Midwest and West. The third and current manifestation of the KKK emerged after World War II, in the form of localized and isolated groups that use the KKK name. They have focused on opposition to the civil rights movement, often using violence and murder to suppress activists.
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. To be successful it requires a serious player or you will get yourself in trouble. Do not mug or kidnap as this job. This job is not to be taken as a meme, you are to roleplay seriously like any other job. If you are caught trolling and abusing the context of this job you will be banned. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Kidnap:
  
-You must type '/advert Kidnap' to initiate the kidnap on a desired player.
-The player must be in a secluded area away from others to initiate.
-You will give the victim no less than 10 seconds to respond before becoming hostile.
-If the player fights or resists you may engage and kill them.
-You are not permitted to kidnap the same person repeatedly.
-You should use your restraints (weapon) on the victim to help keep the situation under control!
  
Required Level: 5
------------------
]],	
	weapons = {"handcuffs", "m9k_remington1858"}, --'handcuffs' are restraints, 'weapon_r_handcuffs' are police handcuffs.
	command = "ku_klux_klan_leader",
	max = 1,
	level = 5,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Pro Criminals",
    sortOrder = 10,
    tier = '6'
})
--=========================================================================================================
TEAM_KU_KLUX_KLAN_MEMBER = AddExtraTeam("Ku Klux Klan Member [T5]", {
	color = Color(225, 225, 225, 255),
	model = "models/icefuse_networks/players/kkk/kkkwhite.mdl",
	description = [[As a KKK member, you must follow the directives of the Klan leader and further the cause any way you can. The Klan has a long history. The first Klan flourished in the Southern United States in the late 1860s, then died out by the early 1870s. The second group was founded in the South in 1915 and it flourished nationwide in the early and mid-1920s, including urban areas of the Midwest and West. The third and current manifestation of the KKK emerged after World War II, in the form of localized and isolated groups that use the KKK name. They have focused on opposition to the civil rights movement, often using violence and murder to suppress activists.
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. To be successful it requires a serious player or you will get yourself in trouble. Do not mug or kidnap as this job. This job is not to be taken as a meme, you are to roleplay seriously like any other job. If you are caught trolling and abusing the context of this job you will be banned. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Kidnap:
  
-You must type '/advert Kidnap' to initiate the kidnap on a desired player.
-The player must be in a secluded area away from others to initiate.
-You will give the victim no less than 10 seconds to respond before becoming hostile.
-If the player fights or resists you may engage and kill them.
-You are not permitted to kidnap the same person repeatedly.
-You should use your restraints (weapon) on the victim to help keep the situation under control!
  
Required Level: 5
------------------
]],	
	weapons = {"handcuffs"}, --'handcuffs' are restraints, 'weapon_r_handcuffs' are police handcuffs.
	command = "ku_klux_klan_member",
	max = 10,
	level = 5,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Pro Criminals",
    sortOrder = 20,
    tier = '5'
})
--=========================================================================================================
TEAM_BALLAS = AddExtraTeam("The Ballas [T6]", {
	color = Color(175, 122, 197, 255),
	model = {
		"models/icefuse_networks/players/criminals/ballaeast01gmy.mdl",
		"models/icefuse_networks/players/criminals/ballaorig01gmy.mdl",
		"models/icefuse_networks/players/criminals/ballas01gfy.mdl",
		"models/icefuse_networks/players/criminals/ballasout01gmy.mdl"
	},
	description = [[You are part of The Ballas, a large group of street gang members. The Ballas are often seen around the city wearing distinctive purple clothing. They enjoy drinking, driving cars, bikes, and holdin' shit down. Most Ballas stand on the sidewalks in groups of 3-5, for backup if they need it. Their weapons include pistols, knives, and whatever else they manage to obtain. Members are also known for thier notorious habits of smoking marijuana, and drinking Pißwasser. Your gang is mainly operated out of Los Santos, however expansion as of late has brought your growing numbers to this territory as well. Predictibally, the main threat to our organization and our primary competitors, the Families, have also set up shop just down the block! There's a lot of potential money to be made in this area. We aren't about to let that slip. We take care of our own, no matter what! The Ballas are the only ones who get to lay claim to these streets! Any members of the Families are KOS (kill on sight). If you help to fight off the Families and secure this territory, the Ballas are going to have your back no matter what, feel me?! My man..
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. To be successful it requires a serious player or you will get yourself in trouble. Do not mug or kidnap as this job. This job is not to be taken as a meme, you are to roleplay seriously like any other job. If you are caught trolling and abusing the context of this job you will be banned. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Raid the bases of any members of the Families with/without advert (it's up to you).
	4. Assist in any raids that are being made upon members of the Families.
	5. Engage and kill any members of the Families that you encounter.
	6. Fuck up the Families.
  
-You do not have to advert assaults on the enemy gang's base unless you choose to.
-You may engage members of the Families on your own or with a group of fellow gang members (recommended).
-You must give the enemy gang members no fucking mercy.
-You may return fire and/or attempt escape if law enforcement attempts to intervene in gang war activity.
  
  
Required Level: 5
------------------
]],	
	weapons = {"m9k_usp", "m9k_knife"},
	command = "team_ballas",
	max = 20,
	level = 5,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Pro Criminals",
    sortOrder = 30,
    tier = '6'
})
--=========================================================================================================
TEAM_THE_FAMILIES = AddExtraTeam("The Families [T6]", {
	color = Color(125, 206, 160, 255),
	model = {
		"models/icefuse_networks/players/criminals/famca01gmy.mdl",
		"models/icefuse_networks/players/criminals/famdnf01gmy.mdl",
		"models/icefuse_networks/players/criminals/families01gfy.mdl"
	},
	description = [[You are part of The Families, a large group of street gang members. The majority of the gang's activities are operated out of Los Santos. The Families control the entire neighborhoods of Chamberlain Hills and Strawberry, and also the northwest side of Davis. New lucritive business has brought a portion of your gang to this area. Members of the Families wear distinctive green-styled clothing and are often seen driving vehicles, engaging in illegal street races or raids, and most importantly - guarding the streets from other gangs if they happen to wander onto their turf. They usually stand in groups of 2-10, for protection on the streets. Their weapons of choice commonly include concealed pistols and knives. They are often seen drinking Pißwasser lager and smoking marijuana, while reminiscing about their gang lives and such. The Families have been in a perpetual state of conflict with the Ballas, the notorious enemy gang members that threaten your territory and profits. The rivalry with the neighboring Ballas gang has reached an all-time high and more blood must be spilled before it is over. The Ballas will not interfere with our expansion in this area any further! Profits in this city are too good to stop now. With your help, we can force them out of this area for good!
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. To be successful it requires a serious player or you will get yourself in trouble. Do not mug or kidnap as this job. This job is not to be taken as a meme, you are to roleplay seriously like any other job. If you are caught trolling and abusing the context of this job you will be banned. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Raid the bases of any members of the Ballas with/without advert (it's up to you).
	4. Assist in any raids that are being made upon members of the Ballas.
	5. Engage and kill any members of the Ballas that you encounter.
	6. Fuck up the Ballas.
  
-You do not have to advert assaults on the enemy gang's base unless you choose to.
-You may engage members of the Ballas on your own or with a group of fellow gang members (recommended).
-You must give the enemy gang members no fucking mercy.
-You may return fire and/or attempt escape if law enforcement attempts to intervene in gang war activity.
  
  
Required Level: 5
------------------
]],
	weapons = {"m9k_usp", "m9k_knife"},
	command = "team_the_families",
	max = 20,
	level = 5,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Pro Criminals",
    sortOrder = 40,
    tier = '6'
})
--=========================================================================================================
TEAM_TERRORIST_LEADER = AddExtraTeam("Terrorist Leader [T6]", {
	color = Color(245, 176, 65, 255),
	model = {"models/icefuse_networks/players/criminals/party.mdl"},
	description = [[You are the leader of the most powerful terrorist organization. Your job is to orchestrate attacks on those that would oppose your rule and the vast knowledge of Allah, namely the police department. 
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as the terrorist leader. Your only goal is to lead your followers and further the great plan of Allah. To be successful it requires a serious player or you will get yourself in trouble. Only kill another player if self defense is explicitly required or advancing a raid. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base.
	2. Command and direct your followers in your missions against enemy infidels.
	3. Access money printers (F4 > Purchasables).
	4. Purchase C4 for terrorist activities (F4 > Shipments).
	5. Perform armed takeovers on the PD (police department).
	6. Plant bombs anywhere you want (except within spawn):
  
-You must type "/advert Terror" or "/advert Allahu Akbar!" when planting a bomb.
-You are not allowed to kill any players who attempt to disarm the bomb unless they fire upon you first.
-You are permitted to counter law enforcement or enemy players who attempt to arrest or kill you during an act of terrorism.
------------------
]],
	weapons = {"unarrest_stick", "m9k_ak47", "swep_c4"},
	command = "terrorist_leader",
	max = 1,
	salary = 40,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Pro Criminals",
    sortOrder = 50,
    tier = '6'
})
--=========================================================================================================
TEAM_TERRORIST = AddExtraTeam("Terrorist [T5]", {
	color = Color(245, 176, 65, 255),
	model = "models/player/phoenix.mdl",
	description = [[Although your job is to cause chaos and incite fear, your overall goal is simple - you want to destroy the infidels! You are to follow the command of your leader and carry out his plans. You will please the great god Allah and bring honor to his name.
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as a terrorist. Your only goal is to support your leader and further the great plan of Allah. To be successful it requires a serious player or you will get yourself in trouble. Only kill another player if self defense is explicitly required or advancing a raid. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base.
	2. Follow the terrorist leader in your missions against enemy infidels.
	3. Access money printers (F4 > Purchasables).
	4. Perform armed takeovers on the PD (police department).
	5. Plant bombs anywhere you want (except within spawn):
  
-You must type "/advert Terror" or "/advert Allahu Akbar!" when planting a bomb.
-You are not allowed to kill any players who attempt to disarm the bomb unless they fire upon you first.
-You are permitted to counter law enforcement or enemy players who attempt to arrest or kill you during an act of terrorism.
------------------
]],
	weapons = {"unarrest_stick", "m9k_ak47"},
	command = "terrorist",
	max = 10,
	salary = 40,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Pro Criminals",
    sortOrder = 60,
    tier = '5'
})
--=========================================================================================================
TEAM_PRO_HITMAN = AddExtraTeam("Pro Hitman [T5]", {
	color = Color(205, 97, 85, 255),
	model = "models/icefuse_networks/players/citizens/salton01amo.mdl",
	description = [[As a hitman, you are to accept contracts on people for blood money. Your attention is always focused on the next check.. and that means someone has to die.
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as a hitman. Your only goal is contracts. To be successful it requires a serious player or you will get yourself in trouble. Only kill another player if they are your target, or self defense is explicitly required. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
	Commands:
  
	- /hits, /contracts, /hitlist,
    /targets (hitlist)
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Place down hit phones for use by your clients (in a roleplay friendly spot, F4 > Purchasables).
	4. Use /advert (message) or /ooc (message) to advertise your services.
	5. Accept and complete contracts on people for blood money.
	6. Use whatever means neccessary to escape after a hit. If you take fire or it is plainly obvious an officer is going to arrest you, you are permitted to fight the player.
------------------
]],	
	weapons = {"m9k_svu", "m9k_deagle"},
	command = "pro_hitman",
	max = 2,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Pro Criminals",
    sortOrder = 70,
    tier = '5'
})
--=========================================================================================================
TEAM_SERIAL_KILLER = AddExtraTeam("Serial Killer [T6]", {
	color = Color(205, 97, 85, 255),
	model = {
		"models/icefuse_networks/players/citizens/bevhills01amy.mdl",
		"models/icefuse_networks/players/citizens/bevhills02amm.mdl"
	},
	description = [[As a serial killer, you are truly unique. You are part of the scarce 1% of the population in the world that psychologists and readers alike are fascinated by - a true psychopath. You are amoral yet intelligent, have a total lack of empathy, and you are an expert manipulator. Loving or establishing any meaningful personal relationships has never seemed important to you, though you fake it anyway. Still, you don't keep any close friends or feel the need to. Sometimes you wonder what that's like. Everyone swears that you are the nicest guy though. That must be because you are actually going out of your way to pretend. Most people don't have to think about it. They have no idea about your other side.. honestly, you just want people to leave you alone. But you have learned over time what people expect - a big happy smile! So you smile and play the part of the friendly, outgoing neighbor! :) That's probably for the best.. otherwise, not only would society reject you for the things you've done, it would also condemn you for them. You keep this all locked away inside, and you don't let anyone know about it. You remember every person you've made disappear.. but that doesn't matter to you at this point. What matters is all the intimate details. The thought of the hunt itself is enough to excite you.. meticulously planning out each moment and variable before taking the victim.. you have completely avoided detection for this long. Authorities are chasing their tails, clueless. You absolutely know what you are doing is very wrong, but you just can't stop yourself anymore. It seems to be the only thing that makes you feel truly alive, like you're in total control. Maybe you will go out again tonight - for old times sake..
  
	Note: Mind your roleplay with this job very carefully. Do not FailRP. Your main motivation is to find lone victims and kill them as violently as possible. To be successful it requires a serious player or you will get yourself in trouble. This job is not an excuse to randomly kill (RDM) or break the rules. Only attack a victim under certain circumstances: if they are completely alone, not in public, and no one is around to see it. Never attack a victim when there is any witnesses. If you are attacked you may still fight back. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable, so make sure you follow the rules when choosing victims. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
	-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
	-If you need to reference the rules yo	u can use /rules at any time. :)
  
	------------------
	You are allowed to do the following..
  
	1. Base (alone, you may not base with others).
	2. Access money printers (F4 > Purchasables).
	3. Abduct victims using '/advert Abduction!'.
	4. Murder victims using '/advert Kill!', '/advert Die!', or '/advert Murder!'.
	5. You can kill your victims or extort money from them in exchange for their lives (max of $10,000 extortion).
	6. You are allowed to kill your victims immediately instead of abducting them. Always /advert for the desired action.
	7. Just like the president, when you die you will be forced to switch jobs - as per roleplay. There can only be one active serial killer at any given time.
  
-You must type '/advert Abduction!' so the victim knows it is an official abduction OR
-You must type '/advert Kill!', '/advert Die!', or /advert Murder! before you attack a victim so they know it's an official murder.
-You should use your restraints (weapon) on the victim to help keep the situation under control!
	------------------
]],	
	weapons = {"m9k_knife", "m9k_machete", "handcuffs"}, --'handcuffs' are restraints, 'weapon_r_handcuffs' are police handcuffs.
	command = "serial_killer",
	max = 1,
	salary = 0,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
    category = "Pro Criminals",
    sortOrder = 80,
    tier = '6',
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
	PlayerDeath = function(ply, weapon, killer)
		ply:teamBan()
		ply:changeTeam(GAMEMODE.DefaultTeam, true)
		if killer:IsPlayer() then
			DarkRP.notifyAll(0, 6, "The one responsible for the attacks within the community has just been confirmed dead!")
			DarkRP.notifyAll(0, 6, "PD Warning: Be on the lookout for potential copycat killers!")
		else
			DarkRP.notifyAll(0, 6, "The one responsible for the attacks within the community has just been confirmed dead!")
			DarkRP.notifyAll(0, 6, "PD Warning: Be on the lookout for potential copycat killers!")
		end
	end
})

--=========================================================================================================
TEAM_MARAUDER = AddExtraTeam("Marauder [T4]", {
	color = Color(133, 193, 233, 255),
	model = "models/icefuse_networks/players/cops/chemsec.mdl",
	description = [[As a marauder your primary intentions are centered around making money by any means, usually in the form of theft. Taking from others has never been an issue for a marauder. You are equipped with a special blowtorch tool that can cut through the walls or defenses of most player-built bases. Marauders are known to work most effectively as part of a team in order to gain entry to a base using brute force. Don't be afraid to collaborate and gain entry to well defended properties. If you work hard the spoils are just waiting to be had!
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap players. Your only goal is to steal property. To be successful it requires a serious player or you will get yourself in trouble. Only kill another player if they are attacking you first, or if self defense is explicitly required. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Steal the property of others for personal gain.
	4. Raid the bases of others for personal gain.
------------------
]],
	weapons = {"icefuse_blowtorch"},
	command = "marauder",
	max = 10,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Pro Criminals",
    sortOrder = 90,
    tier = '4'
})
--=========================================================================================================
TEAM_COMBAT_MEDIC = AddExtraTeam("Combat Medic [T3]", {
	color = Color(40, 180, 99, 255),
	model = {
		"models/player/group03m/male_01.mdl",
		"models/player/group03m/male_02.mdl",
		"models/player/group03m/male_03.mdl",
		"models/player/group03m/male_04.mdl",
		"models/player/group03m/male_05.mdl",
		"models/player/group03m/male_06.mdl",
		"models/player/group03m/male_07.mdl",
		"models/player/group03m/male_08.mdl",
		"models/player/group03m/male_09.mdl"
	},
	description = [[As the combat medic your main role is to heal your fellow combatants when they are injured in a fight, and help them advance any raids they may be taking part in. A good medic helps to keep his team alive despite any forces they might go up against. 
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap players. Your focus is to help keep your employer(s) alive by giving them medical attention. To be successful it requires a serious player or you will get yourself in trouble. Only kill another player if they are attacking you first, or if self defense is explicitly required. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Raid.
	4. Sell your extremely useful services to others who may need it.
------------------
]],	
	weapons = {"icefuse_medkit"},
	command = "combat_medic",
	max = 10,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("110") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Pro Criminals",
    sortOrder = 100,
    tier = '3'
})
--=========================================================================================================
TEAM_DEAD_MAN_WALKING = AddExtraTeam("Dead Man Walking [T4]", {
	color = Color(202, 207, 210, 255),
	model = "models/player/skeleton.mdl",
	description = [[You know your destiny. It is time. Today is the day everything you have been working towards comes to glorious fruition. There is only one truth, there is only one path to take. Your very existence centers around this crucial, central idea.. the president must die..
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap players. You may not base as this job. You may not raid any bases other than bases containing the president. Your focus is to murder the president. To be successful it requires a serious player or you will get yourself in trouble. Only kill another player if they are attacking you first, or if they are the president. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Kill the commander-in-chief as brutally as you possibly can.
	4. Attempt to subsequently escape using any means neccessary - excluding RDM:
  
-You may use self defense to escape, do not ever kill innocent bystanders.
-You may only kill the president once every quarter hour (15 minutes).
------------------
]],
	weapons = {"m9k_winchester73"},
	command = "dead_man_walking",
	max = 2,
	salary = 40,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("110") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Pro Criminals",
    sortOrder = 110,
    tier = '4'
})
--=========================================================================================================
TEAM_PRO_THIEF = AddExtraTeam("Pro Thief [T2]", {
	color = Color(133, 146, 158, 255),
	model = "models/icefuse_networks/players/criminals/lost02gmy.mdl",
	description = [[As a thief you are not known for working with others, however you can if you wish for a profit. You have been doing this for a long time. One could say that you are a professional.. you have honed your skills to become very proficient in lockpicking, so you are able to defeat locks faster than most common thieves. You are slick enough to pickpocket, and smart enough to crack through a security system if you need to. Your main goal is to rob people dry and take as much as you can for yourself. You are sneaky, intelligent, resourceful, and you know how to use these qualities on the quick cash opportunities that are just waiting to be capitalized on. Everything is free if you know how and when to take it.
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. To be successful it requires a serious player or you will get yourself in trouble. You may mug, but do not kidnap as this job. Pickpocketing is strictly prohibited within spawn. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Raid.
	4. Pickpocket (must never pickpocket in spawn).
	5. Steal player's parked cars or other unsecured property.
	6. Crack keypads during raids.
	7. Mug - while mugging, you must follow these rules:
  
-Max Mug Amount: $10,000
-You may kill the victim if they try to fight or escape.
-You will give the victim 10 seconds to respond before becoming hostile. Attacking before this is considered RDM.
-You will type '/advert Mug!' or '/advert Hands up!' in chat before mugging someone, so the player knows it's an official mugging.
-Mugging should be done in a private area away from the public view. Never mug in public or risk getting jailed for FailRP.
-You may not mug more than 1 person every 5 minutes.
-You may not mug the same person repeatedly.
  
  
Required Level: 5
------------------
]],
	weapons = {"icefuse_master_lockpick", "icefuse_keypad_cracker", "icefuse_pickpocket"},
	command = "pro_thief",
	max = 4,
	level = 5,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Pro Criminals",
    sortOrder = 120,
    tier = '2'
})
--=========================================================================================================
TEAM_PRO_HACKER = AddExtraTeam("Pro Hacker [T1]", {
	color = Color(166, 172, 175, 255),
	model = "models/icefuse_networks/players/criminals/armgoon01gmm.mdl",
	description = [[As a professional hacker you have trained your skills to become extremely proficient in keypad cracking, and as such you have faster cracking hardware than any others on the market. You frequently have to splice wires so you are equipped with a sharp knife, although it also proves to be useful in self defense. 
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. To be successful it requires a serious player or you will get yourself in trouble. Do not mug or kidnap as this job. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Bitmine (F4 > Purchasables).
	4. Raid.
------------------
]],
	weapons = {"icefuse_master_keypad_cracker", "m9k_knife"},
	command = "pro_hacker",
	max = 4,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Pro Criminals",
    sortOrder = 130,
    tier = '1'
})
--=========================================================================================================