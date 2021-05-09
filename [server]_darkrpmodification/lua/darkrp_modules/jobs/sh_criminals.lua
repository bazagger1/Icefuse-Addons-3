--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_darkrpmodification/lua/darkrp_modules/jobs/sh_criminals.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

--=========================================================================================================
TEAM_GANGSTER_MOB_BOSS = AddExtraTeam("Mob Boss", {
	color = Color(191, 201, 202, 255),
	model = "models/icefuse_networks/players/criminals/korboss01gmy.mdl",
	description = [[You are the Don of the most powerful Italian mob family; it is your job to organize your men for various tasks such as gambling, bootlegging, drug trafficking, weapons dealing, heists, and other organized crime. Anthing you can get your hands on is fair game, really. You are not allowed to mug as this job because you are not a thug. You know a lot of guys willing do things to move up. Why dirty your own hands? You are the most significant leader of the crime family in this city. Most importantly, you have to make your name known - to your friends and your enemies, especially. Keep everyone close. You never know if you might need a favor.
	
Note: Mind your roleplay with this job very carefully. Do not FailRP as the Mob Boss. To be successful it requires a serious player or you will get yourself in trouble. Do not mug or kidnap as this job. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
    ------------------
	You are allowed to do the following..  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Raid.
	4. Organize and execute criminal activities.------------------
]],	
	weapons = {"m9k_thompson"},
	command = "mob_boss",
	max = 1,
	salary = 60,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Criminals",
    sortOrder = 10,
    tier = 'M'
})
--=========================================================================================================
TEAM_GANGSTER = AddExtraTeam("Gangster", {
	color = Color(191, 201, 202, 255),
	model = "models/icefuse_networks/players/criminals/korean01gmy.mdl",
	description = [[You are a dedicated and respected member of a prestigious mob family, and your job is to uphold the rule of your Don and help carry out any tasks he has planned. Your Don is your authority, the leader of your family. You are committed to him and only to him. You are not allowed to mug as this job. A gangster doesn't need to deviate from the family's plans because the family takes care of each other. We want for nothing.  
Note: Mind your roleplay with this job very carefully. Do not FailRP. To be successful it requires a serious player or you will get yourself in trouble. Do not mug or kidnap as this job. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  ------------------
	You are allowed to do the following..  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Raid.------------------
]],	
	weapons = {},
	command = "gangster",
	max = 10,
	salary = 40,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Criminals",
    sortOrder = 20,
    tier = 'M'
})
--=========================================================================================================
TEAM_HITMAN = AddExtraTeam("Hitman", {
	color = Color(210, 180, 222, 255),
	model = "models/icefuse_networks/players/criminals/clay.mdl",
	description = [[As a hitman you are to accept offered contracts on people for blood money. When you complete a hit (eliminate a target) you receive credit for that contract and payment for your work.  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as a hitman. Your only goal is contracts. To be successful it requires a serious player or you will get yourself in trouble. Only kill another player if they are your target, or self defense is explicitly required. Your hits (and all kills) are logged for admins upon acceptance and upon completion. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
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
	5. Accept and complete assassination contracts on people for blood money.
	6. Use whatever means neccessary to escape after a hit. If you take fire or it is plainly obvious an officer is going to arrest you, you are permitted to fight/escape the player.
------------------
]],		
	weapons = {"m9k_sig_p229r"},
	command = "hitman",
	max = 3,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Criminals",
    sortOrder = 30,
    tier = 'M'
})
--=========================================================================================================
TEAM_THUG = AddExtraTeam("Thug", {
	color = Color(240, 178, 122, 255),
	model = "models/player/slow/jamis/cage/slow.mdl",
	description = [[As a thug your main goal is to make money by taking it from others, right or wrong - the money needs made. You look to single out potential victims, kill, scam or rob them when no one else is the wiser. Where others suffer, you turn a potential profit. You will steal and connive your way to the top of the game, because you finna get yours.  
Note: Mind your roleplay with this job very carefully. Do not FailRP. To be successful it requires a serious player or you will get yourself in trouble. Mug other players only in correct areas at correct times (when they are alone). Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  ------------------
	You are allowed to do the following..  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Steal other's property if left unattended.
	4. When mugging, you must follow these rules:
  
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
	weapons = {"m9k_knife"},
	command = "thug",
	max = 10,
	level = 5,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Criminals",
    sortOrder = 40,
    tier = 'M'
})
--=========================================================================================================
TEAM_KIDNAPPER = AddExtraTeam("Kidnapper [T1]", {
	color = Color(237, 187, 153, 255),
	model = {
	"models/icefuse_networks/players/criminals/slavaboss.mdl", 
	"models/icefuse_networks/players/criminals/slavagoon01gmy.mdl"
	},
	description = [[As a kidnapper, your main focus is to kidnap people and hold them for ransom. Through a series of personal issues you have decided that you should just extort money from the unsuspecting population, by grabbing them when no one is looking. You will pressure their friends or family, in exchange for their safe and well release.. or not so well. That's totally up to the individual kidnapper. You are not permitted to mug as a kidnapper. You are not a thug, you are a manipulative, resourceful villain. It's a dark job, admittedly, but someone has to do it. You are the man (or woman) for the job. Why? Because you are insane. So get to work.
	
Note: Mind your roleplay with this job very carefully. Do not FailRP. To be successful it requires a serious player or you will get yourself in trouble. Kidnap other players only in correct areas at correct times (when they are alone). Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Extort funds from victims and associated players.
	4. Kidnap others. When kidnapping, you must follow these rules:
  
-Max ransom Amount: $10,000
-You must type '/advert Kidnap' to initiate the kidnap on a desired player.
-The player must be in a secluded area away from others to initiate.
-You will give the victim no less than 10 seconds to respond before becoming hostile.
-If the player fights or resists you may engage and kill them.
-You should use your restraints (weapon) on the victim to help keep the situation under control!
-You may only hold someone for a max of 10 minutes.
-If it reaches the 10 minute marker and no one has paid the ransom, you must let them go.
-You are not permitted to kidnap the same person repeatedly.
  
  
Required Level: 5
------------------
]],	
	weapons = {"handcuffs", "m9k_model627"}, --'handcuffs' are restraints, 'weapon_r_handcuffs' are police handcuffs.
	command = "kidnapper",
	max = 5,
	level = 5,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Criminals",
    sortOrder = 50,
    tier = '1'
})
--=========================================================================================================
TEAM_THIEF = AddExtraTeam("Thief", {
	color = Color(237, 187, 153, 255),
	model = {
		"models/icefuse_networks/players/criminals/mexgoon01gmy.mdl",
		"models/icefuse_networks/players/criminals/stretch.mdl"
	},
	description = [[As a thief you are not known for working with others, however you can if you wish for a profit. You are pretty light on your feet and your hands are fast, so you are a good pickpocket. You also have a lockpick handy to get trough locked doors. Your main goal is to rob people dry and take as much as you can for yourself. You are sneaky, intelligent, resourceful, and you know how to use these qualities on the quick cash opportunities that are just waiting to be capitalized on. Everything is free if you know how and when to take it.  
Note: Mind your roleplay with this job very carefully. Do not FailRP. To be successful it requires a serious player or you will get yourself in trouble. Mug other players only in correct areas at correct times (when they are alone). Never pickpocket other players in the spawn area as it is considered abuse of the role. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  ------------------
	You are allowed to do the following..  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Raid.
	4. Pickpocket (must never pickpocket in spawn).
	5. Steal player's parked cars or other unsecured property.
	6. Mug - while mugging, you must follow these rules:
  
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
	weapons = {"icefuse_lockpick", "icefuse_pickpocket"},
	command = "thief",
	max = 10,
	level = 5,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Criminals",
    sortOrder = 60,
    tier = 'M'
})
--=========================================================================================================
TEAM_CULTIST_LEADER = AddExtraTeam("Cultist Leader [T3]", {
	color = Color(128, 139, 150, 255),
	model = {"models/icefuse_networks/players/criminals/acult02amo.mdl"},
	description = [[As cultist leader, you are to lead your fellow cultists and persuade them to do your bidding. You are able to kidnap people alongside your followers and bring them back to your camp for sacrifice. Your main focus is to garner as much support for your ideas and divine goals as possible (no matter what they may be). You take advantage of substances available to you, and use various psychoactive drugs to alter the mindset and behavior of your followers. By doing so you can continue to further your own goals and ambitions. You are attempting to get everyone to join your ultimate cause and offer their resources to fuel the tasks you want to see met. You are charismatic and convincing, capable of manipulating people to commit violent acts for your cult, as well as swaying many minds to carry out your master plan.
	
Note: Mind your roleplay with this job very carefully. Do not FailRP. To be successful it requires a serious player or you will get yourself in trouble. Kidnap other players only in correct areas at correct times (when they are alone). Do not mug as this job. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Access psychoactive drugs to help enlist or control your cult members (F4 > Shipments).
	4. Raid.
	5. Garner support, recruit, and lead rituals for your cult.
	6. Kidnap people for your cult's sacrifices:
  
-There is no ransom. You are kidnapping victims for sacrifice.
-You must type '/advert Kidnap' to initiate the kidnap on a desired player.
-The player must be in a secluded area away from others to initiate.
-You will give the victim no less than 10 seconds to respond before becoming hostile.
-You should use your restraints (weapon) on the victim to help keep the situation under control!
-If the player fights or resists you may engage and kill them.
-You are not permitted to kidnap the same person repeatedly.
  
  
Required Level: 5------------------
]],
	weapons = {"handcuffs", "m9k_knife"}, --'handcuffs' are restraints, 'weapon_r_handcuffs' are police handcuffs.
	command = "cultist_leader",
	max = 1,
	level = 5,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Criminals",
    sortOrder = 70,
    tier = '3'
})
--=========================================================================================================
TEAM_CULTIST_MEMBER = AddExtraTeam("Cultist Member [T1]", {
	color = Color(128, 139, 150, 255),
	model = {"models/icefuse_networks/players/criminals/acult01amy.mdl"},
	description = [[As cultist member, you are to work with your fellow cultists and follow the directives of the Cultist Leader to the best of your ability. Work alongside them to kidnap people and bring them to your camp for sacrifices, using rituals to honor the cult's desires and goals. The blood of a select few within the city will help to fuel the divine and destined future of the cult.  
Note: Mind your roleplay with this job very carefully. Do not FailRP. To be successful it requires a serious player or you will get yourself in trouble. Kidnap other players only in correct areas at correct times (when they are alone). Do not mug as this job. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  ------------------
	You are allowed to do the following..  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Raid.
	4. Kidnap people for your sacrifices:
  
-There is no ransom. You are kidnapping victims for sacrifice.
-You must type '/advert Kidnap' to initiate the kidnap on a desired player.
-The player must be in a secluded area away from others to initiate.
-You will give the victim no less than 10 seconds to respond before becoming hostile.
-You should use your restraints (weapon) on the victim to help keep the situation under control!
-If the player fights or resists you may engage and kill them.
-You are not permitted to kidnap the same person repeatedly.
  
  
Required Level: 5------------------
]],	
	weapons = {"handcuffs"}, --'handcuffs' are restraints, 'weapon_r_handcuffs' are police handcuffs.
	command = "cultist_member",
	max = 10,
	level = 5,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Criminals",
    sortOrder = 80,
    tier = '1'
})
--=========================================================================================================
TEAM_BLACKHAT_HACKER = AddExtraTeam("Blackhat Hacker", {
	color = Color(133, 146, 158, 255),
	model = "models/icefuse_networks/players/criminals/soucent03amy.mdl",
	description = [[As a notorious blackhat hacker, you are known for causing disruptions throughout town, raiding bases and bitmining to earn your living. As a bitminer you must use your intelligence to garner income. You can work along with other players to come up with the most secure base, use your keypad cracking skills to raid other players, or you can work from within the comfort of your own design and hack into the digital currency economy for profits.   
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
	weapons = {"icefuse_keypad_cracker"},
	command = "blackhat_hacker",
	max = 5,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,

	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Criminals",
    sortOrder = 90,
    tier = 'M'
})
--=========================================================================================================
TEAM_METH_COOK = AddExtraTeam("Meth Cook", {
	color = Color(169, 204, 227, 255),
	model = "models/icefuse_networks/players/criminals/factory01smm.mdl",
	description = [[Cooking meth hasn't always been the most glamorous, but the money distracts you from whatever moral implications there may be. The dope fiends of this city are always buying, always itching for their next fix. The dealers here always need a fresh supply. Sudafed is everywhere right now. Being close with various industrial supply chains has given you a unique ability to procure all the needed ingredients for use in certain 'extra' recreational markets. The money is hot and it just keeps coming in.  
Note: Mind your roleplay with this job very carefully. Do not FailRP. To be successful it requires a serious player or you will get yourself in trouble. Do not mug or kidnap as this job. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  ------------------
	You are allowed to do the following..  
	1. Base.
	2. Cook that goood crystal. (F4 > Purchasables).
	3. Let it be known that you are the one who knocks.
	4. Tell other people to say your name.
	5. You may also go by the alias of "Heisenberg".------------------
]],	
	weapons = {},
	command = "meth_cook",
	max = 6,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,

	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Criminals",
    sortOrder = 100,
    tier = 'M'
})
--=========================================================================================================
TEAM_COCA_PLANT_FARMER = AddExtraTeam("Coca Plant Farmer", {
	color = Color(125, 206, 160, 255),
	model = "models/icefuse_networks/players/criminals/pestcont01smy.mdl",
	description = [[Times are tough and money is hard to earn, but you've always had a fond grasp on gardening and recreational activities. Maybe it's time that you go all in and make a name for yourself by growing the finest damn coca plants around. You've done your research, and the dealers you know are looking for some quality product right now. Assuming the demand holds within the city, then with the right amount of nutrients, lighting and proper irrigation, you could potentially be banking some serious cash in the current market..  
Note: Mind your roleplay with this job very carefully. Do not FailRP. To be successful it requires a serious player or you will get yourself in trouble. Do not mug or kidnap as this job. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  ------------------
	You are allowed to do the following..  
	1. Base.
	2. Grow coca plants and make cash money (F4 > Purchasables).------------------
]],	
	weapons = {},
	command = "coca_plant_farmer",
	max = 6,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,

	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Criminals",
    sortOrder = 120,
    tier = 'M'
})
--=========================================================================================================
TEAM_OPIUM_COOK = AddExtraTeam("Opium Cook", {
	color = Color(237, 187, 153, 255),
	model = {"models/icefuse_networks/players/criminals/chemwork01gmm.mdl"},
	description = [[Morphine, codeine, thebaine, sulfate, papaverine, hydrocodone, hydromorphone. Ahhh, there they are - some of your favorite words in the medical industry. Such a ring to them, don't you think? Music to your ears.. as one of the best cooks around, some would brand you a decrement to society. However, the people need you in this city. The customers need you. Without you, who would they go to? The next guy, who might skimp on the purity and soak up your profits. The dope fiends still buy the shit no matter what, so why not help them (and profit) by doing what you do best. Besides, you love the smell of a good cookup in the morning.  
Note: Mind your roleplay with this job very carefully. Do not FailRP. To be successful it requires a serious player or you will get yourself in trouble. Do not mug or kidnap as this job. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  ------------------
	You are allowed to do the following..  
	1. Base.
	2. Cook opium like a boss (F4 > Purchasables).
------------------
]],	
	weapons = {},
	command = "opium_cook",
	max = 6,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,

	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Criminals",
    sortOrder = 130,
    tier = 'M'
})
--=========================================================================================================
TEAM_MOONSHINER = AddExtraTeam("Moonshiner", {
	color = Color(213, 219, 219, 255),
	model = {"models/icefuse_networks/players/criminals/hillbilly01amm.mdl"},
	description = [[Upon reflection you have decided that them city folk don't know a thing about drinkin', and what's more - ain't no city slicker cookin' up the kinda of snake venom that we have right here in these bad boys! *pats the distillation tank* The alcohol you produce here (sometimes illicitly) is the finest, wildest, most outlandish distilled spirit, unavailable anywhere else! Bein' that it's the best quality and all that, I guarantee lots of dealers around here would love to get their hands on a barrel or two of this liquid dynamite..  
Note: Mind your roleplay with this job very carefully. Do not FailRP. To be successful it requires a serious player or you will get yourself in trouble. Do not mug or kidnap as this job. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  ------------------
	You are allowed to do the following..  
	1. Base.
	2. Make the best high-proof distilled spirits available (F4 > Purchasables).------------------
]],	
	weapons = {},
	command = "moonshiner",
	max = 6,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,

	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Criminals",
    sortOrder = 140,
    tier = 'M'
})
--=========================================================================================================
TEAM_THANOS = AddExtraTeam("Thanos", {
	color = Color(187, 143, 206, 255),
	model = "models/kryptonite/inf_thanos/inf_thanos.mdl",
	description = [[Note: Mind your roleplay with this job very carefully. Do not FailRP. To be successful it requires a serious player or you will get yourself in trouble. Do not mug or kidnap as this job. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Raid.
------------------]],
	weapons = {"weapon_nomad"},
	command = "thanos",
	max = 1,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "Criminals",
    sortOrder = 150,
    tier = 'M'
})
--=========================================================================================================
TEAM_JOKER = AddExtraTeam("Joker", {
	color = Color(125, 206, 160, 255),
	model = "models/kryptonite/lord_joker/lord_joker.mdl",
	description = [[Note: Mind your roleplay with this job very carefully. Do not FailRP. To be successful it requires a serious player or you will get yourself in trouble. Do not mug or kidnap as this job. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Raid.
------------------]],
	weapons = {},
	command = "joker",
	max = 1,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "Criminals",
    sortOrder = 160,
    tier = 'M'
})
--=========================================================================================================
TEAM_CHUCKY = AddExtraTeam("Chucky", {
	color = Color(213, 219, 219, 255),
	model = "models/vinrax/player/doll_player.mdl",
	description = [[As Chucky, you are truly unique. You are part of the scarce 1% of the population in the world that psychologists and readers alike are fascinated by - a true psychopath. You are amoral yet intelligent, have a total lack of empathy, and you are an expert manipulator. Loving or establishing any meaningful personal relationships has never seemed important to you, though you fake it anyway. Still, you don't keep any close friends or feel the need to. Sometimes you wonder what that's like. Everyone swears that you are the nicest guy though. That must be because you are actually going out of your way to pretend. Most people don't have to think about it. They have no idea about your other side.. honestly, you just want people to leave you alone. But you have learned over time what people expect - a big happy smile! So you smile and play the part of the friendly, outgoing neighbor! :) That's probably for the best.. otherwise, not only would society reject you for the things you've done, it would also condemn you for them. You keep this all locked away inside, and you don't let anyone know about it. You remember every person you've made disappear.. but that doesn't matter to you at this point. What matters is all the intimate details. The thought of the hunt itself is enough to excite you.. meticulously planning out each moment and variable before taking the victim.. you have completely avoided detection for this long. Authorities are chasing their tails, clueless. You absolutely know what you are doing is very wrong, but you just can't stop yourself anymore. It seems to be the only thing that makes you feel truly alive, like you're in total control. Maybe you will go out again tonight - for old times sake..
  
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
	weapons = {"m9k_knife"},
	command = "chucky",
	max = 5,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "Criminals",
    sortOrder = 170,
    tier = 'M'
})
--=========================================================================================================
TEAM_SCREAM = AddExtraTeam("Scream", {
	color = Color(213, 219, 219, 255),
	model = "models/player/screamplayermodel/scream/scream.mdl",
	description = [[As Scream, you are truly unique. You are part of the scarce 1% of the population in the world that psychologists and readers alike are fascinated by - a true psychopath. You are amoral yet intelligent, have a total lack of empathy, and you are an expert manipulator. Loving or establishing any meaningful personal relationships has never seemed important to you, though you fake it anyway. Still, you don't keep any close friends or feel the need to. Sometimes you wonder what that's like. Everyone swears that you are the nicest guy though. That must be because you are actually going out of your way to pretend. Most people don't have to think about it. They have no idea about your other side.. honestly, you just want people to leave you alone. But you have learned over time what people expect - a big happy smile! So you smile and play the part of the friendly, outgoing neighbor! :) That's probably for the best.. otherwise, not only would society reject you for the things you've done, it would also condemn you for them. You keep this all locked away inside, and you don't let anyone know about it. You remember every person you've made disappear.. but that doesn't matter to you at this point. What matters is all the intimate details. The thought of the hunt itself is enough to excite you.. meticulously planning out each moment and variable before taking the victim.. you have completely avoided detection for this long. Authorities are chasing their tails, clueless. You absolutely know what you are doing is very wrong, but you just can't stop yourself anymore. It seems to be the only thing that makes you feel truly alive, like you're in total control. Maybe you will go out again tonight - for old times sake..
  
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
	weapons = {"m9k_knife"},
	command = "scream",
	max = 5,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "Criminals",
    sortOrder = 180,
    tier = 'M'
})
--=========================================================================================================
TEAM_HOWARD_THE_ALIEN = AddExtraTeam("Howard The Alien", {
	color = Color(232, 218, 239, 255),
	model = "models/player/howardalien.mdl",
	description = [[You are the one true Howard The Alien.
	
	Note: Mind your roleplay with this job very carefully. Do not FailRP. To be successful it requires a serious player or you will get yourself in trouble. Do not mug or kidnap as this job. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Raid.
------------------]],
	weapons = {"weapon_nomad"},
	command = "howard_the_alien",
	max = 1,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "Criminals",
    sortOrder = 190,
    tier = 'M'
})
--=========================================================================================================
TEAM_DEMENTOR = AddExtraTeam("Dementor", {
	color = Color(33, 47, 61, 255),
	model = "models/player/dementor.mdl",
	description = [[You are a dementor, you must find any annoy harry potter
	
	Note: Mind your roleplay with this job very carefully. Do not FailRP. To be successful it requires a serious player or you will get yourself in trouble. Do not mug or kidnap as this job. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Raid.
------------------]],
	weapons = {},
	command = "dementor",
	max = 3,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "Criminals",
    sortOrder = 210,
    tier = 'M'
})
--=========================================================================================================
TEAM_VENOM = AddExtraTeam("Venom", {
	color = Color(46, 64, 83, 255),
	model = "models/kryptonite/venom/venom.mdl",
	description = [[You are venom, find and kill the spiderman!
	
	Note: Mind your roleplay with this job very carefully. Do not FailRP. To be successful it requires a serious player or you will get yourself in trouble. Do not mug or kidnap as this job. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Raid.
------------------]],
	weapons = {"weapon_spidermanswep"},
	command = "venom",
	max = 1,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "Criminals",
    sortOrder = 220,
    tier = 'M'
})