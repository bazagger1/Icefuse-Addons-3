--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_darkrpmodification/lua/darkrp_modules/jobs/sh_entertainment.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

--=========================================================================================================
TEAM_DJ = AddExtraTeam("DJ", {
	color = Color(246, 221, 204, 255),
	model = "models/icefuse_networks/players/criminals/ramphic.mdl",
	description = [[As a DJ, you are only allowed to set up "clubs" at the local nightclub building or local parks. You must have a stage setup within your club somewhere. This will allow you to entertain more effectively. Music is something that everyone can relate to on some level. Each of us may have our own personal favorite genre, sure, but everyone in town knows that you have the baddest speakers around. This is the party place, it's what we do! We keep the party going into the late hours of the night! That's usually followed by a hangover from Hell or worse, someone spiking your drink with date rape drugs. Keep in mind, you are running a nightclub, not a church. So weird things are going to happen sometimes. But as the owner of the club you are not liable for any unforeseeable loss of property, health, or life that occurs. The entry waiver includes these unfortunate circumstances, so you're covered.
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as this job. Your only goal is banging out music. As a professional media artist you are not allowed to be wandering around. You must have a club set up or let another player take your place. Do not tie up job slots by going afk or not having an operational store. To be successful it requires a serious player or you will get yourself in trouble. Only kill another player if they are raiding your store or attacking you. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base (only at a nightclub building or self-constructed studio).
	2. Access money printers (F4 > Purchasables).
	3. Synthesize LSD for a profit (F4 > Purchasables).
	4. Collect donations for your music with a donation box (F4 > Purchasables).
	5. Charge clients money for your media and entertainment services.
------------------
]],	
	weapons = {},
	command = "dj",
	max = 2,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Entertainment",
    sortOrder = 10,
    tier = 'M'
})
--=========================================================================================================
TEAM_PROSTITUTE = AddExtraTeam("Prostitute", {
	color = Color(245, 183, 177, 255),
	model = {
		"models/icefuse_networks/players/rust/femalerust.mdl",
		"models/icefuse_networks/players/rust/femalerustbla.mdl",
		"models/icefuse_networks/players/rust/femalerustmex.mdl"
	},
	description = [[Sell that sweet ass for cash baby! As a prostitute, that's basically all you're skilled in doing, but it's a start. You're paying the bills right now so it's justified in your mind. You do what you gotta do. Keeping up with the STI checkups is a real hassle, honestly. Sometimes you wish you never got into this 'career'.. it's a job right? I mean.. sure, there's a high probability that someone with violent tendencies will trick you into getting in their car, proceed to drive you to an isolated area, then methodically kill you for practice, and you'll never be seen alive again.. but all that comes with the territory. Other than the risk factor it's not too bad. All the sex you could possibly want! Once in a while you even get to score some free dope using your honed skills. Hell yeah, you've got life all figured out..
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as this job. Your only goal is banging customers and really trying your absolute best not to get pregnant. You must actively seek out customers that are DTF. Do not tie up job slots by going afk or not having dedicated genitalia. Work for that money! To be successful it requires a serious player or you will get yourself in trouble. Only kill another player if they are attacking you. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Pimp yourself out and perform sexual favors for easy cash.
------------------
	]],	
	weapons = {"rp_pepper_spray"},
	command = "prostitute",
	max = 4,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Entertainment",
    sortOrder = 20,
    tier = 'M'
})
--=========================================================================================================
TEAM_SNOOP = AddExtraTeam("Snoop Dogg [T4]", {
	color = Color(210, 180, 222, 255),
	model = "models/player/voikanaa/snoop_dogg.mdl",
	description = [[Born October 20, 1971 (age 46) Calvin Cordozar Broadus, Jr., known professionally as Snoop Dogg, is an American rapper, singer, songwriter, record producer, television personality, and actor. Snoop Dogg has the dankest kush. He makes fat stacks and drops mad bars all day every day. What else would he be doing? This rap star has been in the business since 1992 when he was discovered by Dr. Dre. Since then his career has skyrocketed and he is one of the most prolific names in hip-hop music. When Snoop Dogg isn't blazed (and sometimes even while he is) he is constantly looking to push more musical content and market his products to his fans. Recently he has moved into the city and set up his base of operations here..
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as this job. Your only goals are entertaining your fans, making sure you stay pimpin' and stay making money baby. You must actively be out there in the community socializing with fans. You can play your music over the radio if you wish. Do not tie up this special job slot by going afk or not practicing your musical talents. Work for respect and stay on your game! Only kill another player if they are attacking you. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Grow medical grade kush for cash (F4 > Purchasables).
	4. Play your rap music over the radio for fans.
	5. Promote yourself.
	6. Sell your entertainment services to paying clients.
------------------
	]],		
	weapons = {"m9k_glock", "m9k_uzi", "weapon_vape"},
	command = "snoop",
	max = 1,
	salary = 185,
	admin = 0,
	vote = false,
	hasLicense = true,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("150") ply:SetMaxHealth("150") ply:SetArmor("150") return CLIENT end,
    category = "Entertainment",
    sortOrder = 40,
    tier = '4'
})
--=========================================================================================================
TEAM_CASINO_MANAGER = AddExtraTeam("Casino Manager", {
	color = Color(249, 231, 159, 255),
	model = "models/icefuse_networks/players/criminals/mexgoon02gmy.mdl",
	description = [[A casino manager operates and oversees his casino/arcade. He is a proud tribesman and business man who capitalizes on the luck of others (or lack of it). Clients will hang around your place for hours at a time getting lost in the lights and the signs, all the people swarming around, betting against the odds and hoping to get lucky.. they know that all it takes is one good spin to change their lives. Customers will come from miles around, endlessly trying to achieve the heavily anticipated jackpot win. Everyone loves to win big money! That's what it's all about! Show me the benjamins!
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as this job. Your only goals are entertaining your customers, providing them with what they need and making sure you don't get robbed. Since a lot of money and people go through your establishment, it is recommended that you have a security detail. You must actively provide machines for your customers to gamble with. Do not tie up this job slot by going afk or not having an operational casino. If you have an appealing establishment there's no way to not be successful, everyone goes to the casino! Only kill another player if they are attacking you or trying to raid your casino. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base (operate a casino).
	2. Access money printers (F4 > Purchasables).
	2. Install casino machines for customers to gamble with (F4 > Purchasables).
	3. Congratulate your winners with celebrations or bonus rewards.
	4. Offer incentives to gamble at your establishment.
	5. Do your absolute best to ensure a safe gambling environment.
	
-Be sure to install adequate security to protect yourself and your customers, including cameras and potential security doors and/or guards. Casinos are a known hotspot for spontaneous violence, including assassination attempts on unsuspecting gamblers (targets of hitmen) and attempted raids.
------------------
]],
	weapons = {},
	command = "casino",
	max = 2,
	salary = 100,
	admin = 0,
	vote = false,
	hasLicense = true,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("200") ply:SetArmor("100") return CLIENT end,
    category = "Entertainment",
    sortOrder = 50,
    tier = 'M'
})