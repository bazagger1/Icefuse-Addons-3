--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_darkrpmodification/lua/darkrp_modules/jobs/sh_general.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

--=========================================================================================================
TEAM_SECURITY_GUARD = AddExtraTeam("Security Guard", {
	color = Color(213, 219, 219, 255),
	model = {"models/player/odessa.mdl"},
	description = [[As a security guard your job is simple, you take payment for the protection of your clients interests, namely their assets and their life. You are not to be wandering around as this job because you must be actively protecting the property and well-being of your employer at all times. You must communicate with them to coordinate and set up the best defensive measures for the area you are protecting. When someone has paid you for professional protection services you must do all in your power to provide that, which may mean doing so with your very life. It is not uncommon for raids or other violence to occur around here, so be ready for anything. Stay diligent and aware of approaching players at all times.
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as this job. Your only mission is to ensure the survival and success of your employer. You take care of them and you get paid - simple as that. Provide them with what they need and make sure your base doesn't get robbed. Do not tie up this job slot by going afk or not seeking employment. Only kill another player if they are attacking you or trying to raid. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base (charge your employer money for your protection services).
	2. Access money printers (F4 > Purchasables).
	3. Do whatever you can to improve the defensive ability of your employer's base (with their consent).
------------------
]],
	weapons = {"stunstick"},
	command = "security_guard",
	max = 4,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = true,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "General",
    sortOrder = 10,
    tier = 'M'
})
--=========================================================================================================
TEAM_SECURITY_BOUNCER = AddExtraTeam("Bouncer [T3]", {
	color = Color(133, 146, 158, 255),
	model = {
	"models/icefuse_networks/players/cops/bouncer.mdl", 
	"models/icefuse_networks/players/cops/doorman01smy.mdl"
	},
	description = [[As a bouncer your job is simple, you take payment for the protection of an establishment and its interests, namely their assets and the people within. You are not to be wandering around as this job because you must be actively protecting the property and well-being of your employer at all times. You must communicate with them to coordinate and set up the best defensive measures for the area you are protecting. When someone has paid you for professional protection services you must do all in your power to provide that, which may mean doing so with your very life. It is not uncommon for raids or other violence to occur around here, so be ready for anything. Stay diligent and aware of approaching players at all times.
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as this job. Your only mission is to ensure the survival and success of your employer. You take care of them and you get paid - simple as that. Provide them with what they need and make sure your base doesn't get robbed. Do not tie up this job slot by going afk or not seeking employment. Only kill another player if they are attacking you or trying to raid. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base on site (charge your employer money for your protection services).
	2. Access money printers (F4 > Purchasables).
	3. Do whatever you can to improve the defensive ability of your employer's base (with their consent).
------------------
]],
	weapons = {"stunstick", "rp_pepper_spray"},
	command = "security_bouncer",
	max = 4,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = true,
	candemote = false,
	mayorCanSetSalary = false,

	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "General",
    sortOrder = 20,
    tier = '3'
})
--=========================================================================================================
TEAM_BANKER = AddExtraTeam("Banker", {
	color = Color(162, 217, 206, 255),
	model = {"models/player/hostage/hostage_03.mdl"},
	description = [[As a banker, you are legally authorized to store printers for others. This means that regardless of the current laws, government officials can not raid your bank due to suspicion of illegal activity. Customers are entrusting you to protect their assets at the cost of a service fee that you determine. You will still have to watch out for robbers though, so if you're going to open a bank in this city it is recommended that you have a security detail and as much protection as possible. Not only will this behavior protect you, but it will provide additional security and peace of mind to all your loyal customers.
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as this job. You are not allowed to base with anyone other than bankers. Your only mission is to ensure the safety of goods stored within your bank and making sure your security is strong enough to withstand any disturbances. Provide clients with what they need and make sure your bank doesn't get robbed. Do not tie up this job slot by going afk or not seeking clients. Only kill another player if they are attacking you or trying to raid. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Setup a legally authorized bank trusted to store other people's printers or valuables.
	2. Access money printers (F4 > Purchasables).
	3. Avoid any government searches/raids by default.
	4. Get paid for your storage management services.
------------------
]],
	weapons = {},
	command = "banker",
	max = 3,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	medic = true,
	mayorCanSetSalary = true,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "General",
    sortOrder = 30,
    tier = 'M'
})
--=========================================================================================================
TEAM_BANK_SECURITY = AddExtraTeam("Bank Security [T2]", {
	color = Color(82, 190, 128, 255),
	model = {
	"models/icefuse_networks/players/cops/armoured01smm.mdl", 
	"models/icefuse_networks/players/cops/armoured02smm.mdl"
	},
	description = [[As the bank's security you are to defend the bank and its contents. The bank is legally authorized to store printers for others, and so these and other valuables must be protected. Customers are entrusting you to protect their assets and you must do so at all times. You will have to watch out for robbers, so if you're going to work at a bank in this city it is recommended that you have coworkers to offer you as much protection as possible. Not only will this behavior protect you, but it will also provide additional security and peace of mind to all the customers. You should advise your bank manager to hire as much security as required for the size and structure of the bank.
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as this job. You are not allowed to base with anyone other than bankers. Your only mission is to ensure the safety of goods stored within the bank and making sure your security is strong enough to withstand any disturbances. Provide your bank manager with what they need and make sure your bank doesn't get robbed. Do not tie up this job slot by going afk or not seeking clients. Only kill another player if they are attacking you or trying to raid. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Protect and defend a legally authorized bank.
	2. Access money printers (F4 > Purchasables).
	3. Follow the directions of your bank manager.
	4. Get paid for your protection services.
------------------
]],
	weapons = {"m9k_usp"},
	command = "bank_security",
	max = 3,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	medic = true,
	mayorCanSetSalary = true,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "General",
    sortOrder = 40,
    tier = '2'
})
--=========================================================================================================
TEAM_HOBO = AddExtraTeam("Hobo", {
	color = Color(202, 145, 89, 255),
	model = "models/player/ifn/hobo.mdl",
	description = [[As a hobo, you are to be the lowest member of society. Everyone laughs at you. You bug people for money because you either want to buy weed or you are trying to get your shit together for once, but it's most likely the former. At this point it's a matter of survival and you have to work your way out of the gutter. You rifle through dumpsters in the hopes of finding supplies to help you, or discarded items that might fetch you some potential money. Your life sucks right now, admittedly, but you are still breathing and if anyone messes with your personal shack or what little material things you still have - then you will mess them up bad!
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as this job. Your only mission is to find useful items to sell or keep for profit. The dumpsters help a lot with this. Careless players make it even easier to get something good. Do not tie up this job slot by going afk or not seeking cars to work on. Only kill another player if they are attacking you. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
	------------------
	You are allowed to do the following..
  
	1. You are allowed to build in secluded areas, such as alleyways or behind buildings. You may also build in the forest or within an abandoned building.
	2. Access a donation box to (hopefully) collect enough to get by (F4 > Purchasables).
	3. Micspam (use your microphone a looot) to help you with your begging (you must be holding still).
	4. Take any unsecured property that you can for yourself.
	5. Beg people for money or items of value.
------------------
]],
	weapons = {"icefuse_throwable_boot"},
	command = "hobo",
	max = 15,
	salary = 0,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	hobo = true,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "General",
    sortOrder = 90,
    tier = 'M'
})
--=========================================================================================================
TEAM_BODY_BUILDER = AddExtraTeam("Body Builder [T3]", {
	color = Color(133, 146, 158, 255), 
	model = "models/icefuse_networks/players/citizens/musclbeac01amy.mdl",
	description = [[You have worked very hard for your body. Countless hours of grueling training has given you a pretty good figure! You feel confident in your large arms and defined physical appearance, but the relentless members of the Meat Heads are always trying to call you and your friends out for anything they can think of, including 'cheating' or 'juicing'. Lately their attitudes have shifted from insulting to openly hostile, and fights have been breaking out between the two groups for months now. There have been a few casualties on both sides. We have already seen a couple of our close friends beaten to death right in front of us. But we don't back down to anyone! To send the Meat Heads a clear message, we are encouraging each and every one of our members to destroy any Meat Heads they see on sight! Bash their fucking heads in with your personal dumb bells to show them who is really the strongest in this city!
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as this job. Your only mission is to find useful items to sell or keep for profit. The dumpsters help a lot with this. Careless players make it even easier to get something good. Do not tie up this job slot by going afk or not seeking cars to work on. Only kill another player if they are attacking you. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
	------------------
	You are allowed to do the following..
  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Micspam (use your microphone a looot) to play soundboards (lifting/body building soundboards only).
	4. Kill any Meat Heads you encounter (you may only use dumbbells against Meat Heads).
	5. Gain.
	6. Ask people if they even lift.

-When fighting Meat Heads you may only use the dumbbells (weapon).
-Against other players, during self defense situations, or during defense against a raid (not Meat Heads) you may use other weapons (if you have any).
------------------
]],
	weapons = {"icefuse_dumbbell"},
	command = "body_builder",
	max = 15,
	salary = 0,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "General",
    sortOrder = 100,
    tier = '3'
})
--=========================================================================================================
TEAM_MEAT_HEAD = AddExtraTeam("Meat Head [T3]", {
	color = Color(133, 146, 158, 255),
	model = "models/icefuse_networks/players/citizens/babyd.mdl",
	description = [[You are the strongest of your siblings, however you are not the brightest. This is because through excessive laziness or a lack of interest you have never cared much about school or educatee- educaceon- educ- er.. shit, you know what - you just like weights. The heavier the better. It keeps all the blood in your arms and away from your head so then it's way easier to get fucking gains.. or something. As long as you eat enough protien power and creatine, duh. You don't need to explain these things to anyone because they probably wouldn't understand all the science anyway. Also, you and your friends have had major problems lately. Some new jokers have moved into town and they think they are bigger than life. They call themselves the Body Builders. This is our territory, your group hates everything the Body Builders stand for! Lately their group has been extremely hostile. Fights have been heating up at an alarming rate and people are beginning to die. Adding insult to injury, the Body Builders have started to use work out equipment to push back, and they have used dumbbells to bludgeon a few of our members to death already. To send the Body Builders a clear message, we want each of our members to make it their personal mission to kill a Body Builder today! Cave in their fucking heads with your dumbbells to show them once and for all who is the most powerful!
	
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as this job. Your only mission is to find useful items to sell or keep for profit. The dumpsters help a lot with this. Careless players make it even easier to get something good. Do not tie up this job slot by going afk or not seeking cars to work on. Only kill another player if they are attacking you. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
	------------------
	You are allowed to do the following..
  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Micspam (use your microphone a looot) to play soundboards (lifting/body building soundboards only).
	4. Kill any Body Builders you encounter (you may only use dumbbells against Body Builders).
	5. Gain.
	6. Ask people if they even lift.

-When fighting Body Builders you may only use the dumbbells (weapon).
-Against other players, during self defense situations, or during defense against a raid (not Body Builders) you may use other weapons (if you have any).
------------------
]],
	weapons = {"icefuse_dumbbell"},
	command = "meat_head",
	max = 15,
	salary = 0,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "General",
    sortOrder = 101,
    tier = '3'
})
--=========================================================================================================
TEAM_PRIEST = AddExtraTeam("Father John [T4]", {
	color = Color(133, 146, 158, 255),
	model = "models/icefuse_networks/players/criminals/priest.mdl",
	description = [[Father John is the community preacher. He was taken onto the local church's staff after he moved into town from his previous city, where he also worked as a preacher for a number of years. A while ago, for reasons that no else seems to know about, Father John thought it was time to retire from his position there and relocate to this city. He was accepted by the church soon after his arrival and application, and currently serves as a shepherd, using his influence for the well-being of others.. of course, there is also certain benefits to being in a position of trust and religious influence.. As a preacher you seek to enlighten your listeners. So that is what you are going to do! You preach the word of God to all who will listen. Praise the Lord, amen!
	
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as this job. Your only mission is to entrance the world with your nakedness. You are here to talk Jesus. Give the message to the people! Do not tie up this job slot by going afk or not seeking employment. Only kill another player if they are attacking you or trying to raid. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base (set up a church and/or stage for your sermons).
	2. Access money printers (F4 > Purchasables).
	3. Micspam (heavy use of the mic to spread the word of God).
	4. Spread the great word of God. Bring God to the people.
	5. Teach Billy about God if no one is watching. Avoid being arrested by law enforcement.
	
-If you are not preaching, spending time with Billy, or doing something holy you must allow someone else to use the job slot.
------------------
]],
	weapons = {},
	command = "priest",
	max = 3,
	salary = 0,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	hobo = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "General",
    sortOrder = 102,
    tier = '4'
})
--=========================================================================================================
TEAM_STREAKER = AddExtraTeam("Streaker", {
	color = Color(234, 236, 238, 255),
	model = {
	"models/icefuse_networks/players/rust/malerust.mdl", 
	"models/icefuse_networks/players/rust/malerustbla.mdl", 
	"models/icefuse_networks/players/rust/malerustmex.mdl"
	},
	description = [[You only live once, right? As a streaker, you are to run around naked in order to promote your cause, or to simply cause a disturbance. Police will most likely try to arrest you for indecent exposure, but you don't care! This is the most fun you've had in a long time! Run fast and avoid capture while you allow the world to bask in your naked splendor.
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as this job. Your only mission is to entrance the world with your nakedness. You are here to make a statement. Give the message to the people! Do not tie up this job slot by going afk or not seeking employment. Only kill another player if they are attacking you or trying to raid. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Run around without clothes on. 
	2. Make a scene.
	3. Avoid being arrested by law enforcement as long as you can.
	4. You are permitted to build in public (within reason).
	5. Micspam (heavy use of the mic, must be standing still to do this).
------------------
]],
	weapons = {},
	command = "streaker",
	max = 15,
	salary = 0,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	hobo = true,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "General",
    sortOrder = 103,
    tier = 'M'
})
--=========================================================================================================
TEAM_MOTHER = AddExtraTeam("Martha the Mother [T6]", {
	color = Color(245, 183, 177, 255),
	model = "models/icefuse_networks/players/citizens/maude.mdl",
	description = [[As a good mother, you should always understand the responsibilities of nurturing and protecting your children from the dangers of the world.. well, that gracious virtue doesn't necessarily apply to everyone who is given the job.. Martha here doesn't give a shit about kids. They are about as useful to her as the welfare check that she collects for her personal use on cigarettes. Besides, Billy is almost a man now. He will be turning 13 next year! And when that happens maybe he can start to think about finally moving out.. Martha dreams about the stronger prescriptions from the doctor's office that will open up to her new budget once Billy has moved out. The state won't cover all her expenses, so Martha grows marijuana plants to support her bad habits, which can get quite expensive! When she isn't tending to her pot, eating out, purchasing drugs, or tweaking the fuck out in some corner of the world she is instead at her Catholic church with Father John. Sometimes Martha will leave Billy with Father John for a few hours to babysit while she goes into town. She likes to hit up the local fast food joints for alone time. Martha hates it when the fancy fucking cooks mess up her order, so she prefers McDonalds and KFC, the quick places. Sometimes strange men from the local bars that she frequents buy her drinks, and it has only ended badly a couple times.. that's how Billy was created! Dammit! Old habits are hard to break. Martha just wants a strong man to take care of her, but she's not sure anyone can handle this much woman..
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as this job. Your only mission is to be a terrible parent and potentially cause the rape of your child through careless neglect. Do not tie up this job slot by going afk or not seeking employment. Only kill another player if they are attacking you or trying to raid. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base.
	2. Grow marijuana for money to support your bad habits (F4 > Purchasables).
	3. Let Father John babysit Billy.
	4. Micspam to make a scene if your food isn't up to standards (flip the fuck out in public).
	5. Drugs (any that you can find).

-Give your kid, Billy, to Father John to watch over. Then forget about Billy. Don't worry, he will be okay. Father John is a preacher, a man of God.. that said, leave to hit up the local food joints for some grub, or find some more drugs! If the cooks dare fuck up your perfect order, spray them with the pepper spray you purchased from Macy's..
------------------
]],	
	weapons = {"rp_pepper_spray"},
	command = "martha_the_mother",
	max = 1,
	salary = 0,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	hobo = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "General",
    sortOrder = 110,
    tier = '6'
})
--=========================================================================================================
TEAM_KIDS = AddExtraTeam("Martha's Kid Billy [T6]", {
	color = Color(169, 204, 227, 255),
	model = "models/icefuse_networks/players/citizens/tourist01amm.mdl",
	description = [[Billy is Martha's accidental son, although he doesn't see much of his mother lately. She is always so busy. That's what she tells him.. "I am busy Billy, dammit, now hand me my bag of tobacco over there on the floor." Billy has gotten used to that much though. It doesn't bother him. He finds pleasure in the simple things instead, like food, and happy songs, and long rides in the car.. Billy really loves riding in the car. It's his favorite thing to do, looking out the window at the world going by.. Billy has never been the fastest boy.. He just wants to make new friends and eat cake. Sometimes he thinks life would be a lot better if he had more friends, like the older kids, because they all seem so cool and everyone likes them.. to top it all off, his mother Martha has been increasingly erratic as of late. She has started to grow marijuana in an attempt to support her drug habits that she tries to conceal from Billy (unsuccessfully). Billy has in turn started to take some of the marijuana for himself when his mother is not paying attention. She doesn't even notice, and it makes Billy feel goood and funny inside. Which he likes a lot :) Lately Martha has been taking Billy to church more frequently so that she can go into town without bringing him. Father John is always so happy to see them..
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as this job. Your only role is to be Billy. You are a carefree 13 year old kid. Mind who you interract with carefully.. Do not tie up this job slot by going afk or not seeking employment. Only kill another player if they are attacking you or trying to raid. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base.
	2. Use your mother's marijuana (F4 > Shipments).
	10. Try to stay away from Father John. You are not smart but you know something is not right..
	3. Micspam to make a scene when you are distressed (flip the fuck out in public).
	7. Enjoy every minute you get with your mother. Momma isn't around much. <3
------------------
]],	
	weapons = {},
	command = "marthas_kid_billy",
	max = 1,
	salary = 0,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	hobo = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "General",
    sortOrder = 110,
    tier = '6'
})
--=========================================================================================================
TEAM_MERCENARY = AddExtraTeam("Mercenary [T4]", {
	color = Color(232, 218, 239, 255),
	model = "models/icefuse_networks/players/cops/blackops01smy.mdl",
	description = [[As a mercenary, you are a neutral soldier. This is because you only side with one team - the team that offers you the most cash. Working in this field gives you a unique ability to be hired on for offensive and defensive job positions. You could potentially be hired to work as security for your employer's base, a bodyguard for them, or even recruited to help advance a raid. You can be hired by the government, private citizens, shopkeepers, and just about anyone else for protection or assault services..
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as this job. Your only mission is to find useful items to sell or keep for profit. The dumpsters help a lot with this. Careless players make it even easier to get something good. Do not tie up this job slot by going afk or not seeking cars to work on. Only kill another player if they are attacking you. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive  harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
	------------------
	You are allowed to do the following..

	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Work for anyone willing to pay you enough money.
	4. Raid (if hired by someone who has raiding permissions).
	5. Apply yourself to any task assigned by your employer as long as it follows the roleplay rules.
------------------
]],
	weapons = {"m9k_ak74", "m9k_usp"},
	command = "mercenary",
	max = 3,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "General",
    sortOrder = 110,
    tier = '4'
})











--=========================================================================================================
TEAM_DOGE = AddExtraTeam("Doge", {
	color = Color(245, 203, 167, 255),
	model = "models/doge_player/doge_player.mdl",
	description = [[You are allowed to do the following..
  
	1. Base (create a home for yourself and/or friends).
	2. Get a car (drive like a boss).
	3. Try to find work or a means to make money.
]],
	weapons = {},
	command = "doge",
	max = 4,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "General",
    sortOrder = 130,
    tier = 'M'
})
--=========================================================================================================
TEAM_GOAT = AddExtraTeam("Goat", {
	color = Color(178, 186, 187, 255),
	model = "models/goatplayer/goat_player.mdl",
	description = [[You are allowed to do the following..
  
	1. Base (create a home for yourself and/or friends).
	2. Get a car (drive like a boss).
	3. Try to find work or a means to make money.
]],
	weapons = {},
	command = "goat",
	max = 10,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "General",
    sortOrder = 140,
    tier = 'M'
})
--=========================================================================================================
TEAM_MORDACAI = AddExtraTeam("Mordacai", {
	color = Color(133, 146, 158, 255),
	model = "models/doggo/regularshow/mordacai.mdl",
	description = [[You are allowed to do the following..
  
	1. Base (create a home for yourself and/or friends).
	2. Get a car (drive like a boss).
	3. Try to find work or a means to make money.
]],
	weapons = {},
	command = "mordacai",
	max = 1,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "General",
    sortOrder = 130,
    tier = 'M'
})
--=========================================================================================================
TEAM_ATST = AddExtraTeam("AT-ST", {
	color = Color(149, 165, 166, 255),
	model = "models/hgn/swrp/vehicles/at-st_01_pm.mdl",
	description = [[You are allowed to do the following..
  
	1. Base (create a home for yourself and/or friends).
	2. Get a car (drive like a boss).
	3. Try to find work or a means to make money.
]],
	weapons = {},
	command = "at_st",
	max = 3,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "General",
    sortOrder = 140,
    tier = 'M'
})
--=========================================================================================================
TEAM_BRAINMAN = AddExtraTeam("Brainman", {
	color = Color(245, 176, 65, 255),
	model = "models/nseven/the_brain.mdl",
	description = [[You are allowed to do the following..
  
	1. Base (create a home for yourself and/or friends).
	2. Get a car (drive like a boss).
	3. Try to find work or a means to make money.
]],
	weapons = {},
	command = "brainman",
	max = 1,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "General",
    sortOrder = 160,
    tier = 'M'
})
--=========================================================================================================
TEAM_DEW_MAN = AddExtraTeam("Dew Man", {
	color = Color(125, 206, 160, 255),
	model = {
	"models/player/big_dew.mdl", 
	"models/player/blue_dew.mdl", 
	"models/player/dew.mdl",
	"models/player/dew_custom.mdl",
	"models/player/orange_dew.mdl",
	"models/player/red_dew.mdl"
	},
	description = [[You are allowed to do the following..
  
	1. Base (create a home for yourself and/or friends).
	2. Get a car (drive like a boss).
	3. Try to find work or a means to make money.
]],
	weapons = {},
	command = "dew_man",
	max = 3,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "General",
    sortOrder = 170,
    tier = 'M'
})
--=========================================================================================================
TEAM_DORITO_MAN = AddExtraTeam("Dorito Man", {
	color = Color(229, 152, 102, 255),
	model = {
	"models/player/coolranch.mdl", 
	"models/player/customritos.mdl",
	"models/player/heatwave.mdl",
	"models/player/nachocheese.mdl"
	},
	description = [[You are allowed to do the following..
  
	1. Base (create a home for yourself and/or friends).
	2. Get a car (drive like a boss).
	3. Try to find work or a means to make money.
]],
	weapons = {},
	command = "dorito_man",
	max = 2,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "General",
    sortOrder = 180,
    tier = 'M'
})
--=========================================================================================================
TEAM_DEWRITO_MAN = AddExtraTeam("Dewrito Man", {
	color = Color(125, 206, 160, 255),
	model = {
	"models/player/dewrito.mdl", 
	"models/player/dewrito_blue.mdl", 
	"models/player/dewrito_custom.mdl"
	},
	description = [[You are allowed to do the following..
  
	1. Base (create a home for yourself and/or friends).
	2. Get a car (drive like a boss).
	3. Try to find work or a means to make money.
]],
	weapons = {},
	command = "dewrito_man",
	max = 2,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "General",
    sortOrder = 190,
    tier = 'M'
})
--=========================================================================================================
TEAM_GOKU = AddExtraTeam("GoKu", {
	color = Color(220, 118, 51, 255),
	model = "models/player/b3gok/b3gok.mdl",
	description = [[You are allowed to do the following..
  
	1. Base (create a home for yourself and/or friends).
	2. Get a car (drive like a boss).
	3. Try to find work or a means to make money.
]],
	weapons = {},
	command = "goku",
	max = 1,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "General",
    sortOrder = 200,
    tier = 'M'
})
--=========================================================================================================
TEAM_ESCAPEMAN = AddExtraTeam("Escapeman", {
	color = Color(133, 146, 158, 255),
	model = {
	"models/player/em/escapeman_col_pm.mdl", 
	"models/player/em/escapeman_pm.mdl", 
	"models/player/em/escapewoman_col_pm.mdl",
	"models/player/em/escapewoman_pm.mdl"
	},
	description = [[You are allowed to do the following..
  
	1. Base (create a home for yourself and/or friends).
	2. Get a car (drive like a boss).
	3. Try to find work or a means to make money.
]],
	weapons = {},
	command = "escapeman",
	max = 2,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "General",
    sortOrder = 210,
    tier = 'M'
})
--=========================================================================================================
TEAM_JOHN_MARSTON = AddExtraTeam("John Marston", {
	color = Color(149, 165, 166, 255),
	model = "models/player/john_marston.mdl",
	description = [[You are allowed to do the following..
  
	1. Base (create a home for yourself and/or friends).
	2. Get a car (drive like a boss).
	3. Try to find work or a means to make money.
]],
	weapons = {"m9k_remington1858"},
	command = "john_marston",
	max = 1,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "General",
    sortOrder = 250,
    tier = 'M'
})
--=========================================================================================================
TEAM_LEFT_SHARK = AddExtraTeam("Left Shark", {
	color = Color(127, 179, 213, 255),
	model = "models/player/left_shark.mdl",
	description = [[You are allowed to do the following..
  
	1. Base (create a home for yourself and/or friends).
	2. Get a car (drive like a boss).
	3. Try to find work or a means to make money.
]],
	weapons = {},
	command = "left_shark",
	max = 5,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "General",
    sortOrder = 270,
    tier = 'M'
})
--=========================================================================================================
TEAM_SPIRO = AddExtraTeam("Spiro", {
	color = Color(210, 180, 222, 255),
	model = "models/spyro_mc_player.mdl",
	description = [[You are allowed to do the following..
  
	1. Base (create a home for yourself and/or friends).
	2. Get a car (drive like a boss).
	3. Try to find work or a means to make money.
]],
	weapons = {},
	command = "spiro",
	max = 1,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "General",
    sortOrder = 280,
    tier = 'M'
})
--=========================================================================================================
TEAM_DUMBLEDORE = AddExtraTeam("Dumbledore", {
	color = Color(191, 201, 202, 255),
	model = "models/player/dumbledore.mdl",
	description = [[You are allowed to do the following..
  
	1. Base (create a home for yourself and/or friends).
	2. Get a car (drive like a boss).
	3. Try to find work or a means to make money.
]],
	weapons = {},
	command = "dumbledore",
	max = 1,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "General",
    sortOrder = 290,
    tier = 'M'
})
--=========================================================================================================
TEAM_HAGRID = AddExtraTeam("Hagrid", {
	color = Color(174, 182, 191, 255),
	model = "models/player/hagrid.mdl",
	description = [[You are allowed to do the following..
  
	1. Base (create a home for yourself and/or friends).
	2. Get a car (drive like a boss).
	3. Try to find work or a means to make money.
]],
	weapons = {},
	command = "hagrid",
	max = 1,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "General",
    sortOrder = 300,
    tier = 'M'
})
--=========================================================================================================
TEAM_HARRY_POTTER = AddExtraTeam("Harry Potter", {
	color = Color(174, 182, 191, 255),
	model = "models/player/harry_potter.mdl",
	description = [[You are allowed to do the following..
  
	1. Base (create a home for yourself and/or friends).
	2. Get a car (drive like a boss).
	3. Try to find work or a means to make money.
]],
	weapons = {},
	command = "harry_potter",
	max = 1,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("50") return CLIENT end,
    category = "General",
    sortOrder = 310,
    tier = 'M'
})
--=========================================================================================================