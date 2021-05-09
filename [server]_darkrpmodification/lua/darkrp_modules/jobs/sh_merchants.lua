--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_darkrpmodification/lua/darkrp_modules/jobs/sh_merchants.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

--=========================================================================================================
TEAM_GUN_DEALER = AddExtraTeam("Gun Dealer", {
	color = Color(245, 176, 65, 255),
	model = "models/player/monk.mdl",
	description = [[As an arms dealer you are to sell weapons to people. This can be very profitable, but be careful who you sell to. Profits attract unwanted attention. Keep a close eye on the laws of your city to ensure your safety, and not to get caught selling illegal firearms to people as this could quickly earn you a jail cell instead. Be mindful of all your customers, and be as accommodating as possible, but always be ready for anything. You never know in this line of work. It is recommended that you hire some security, just in case.
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as this job. Your only goal is sales. As a professional businessman you are not allowed to be wandering around. You must have a shop set up or let another player take your place. Do not tie up job slots by going afk or not having an operational store. To be successful it requires a serious player or you will get yourself in trouble. Only kill another player if they are raiding your store or attacking you. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base (operate a store).
	2. Access money printers (F4 > Purchasables).
	3. Buy store supplies (cash register, shelves, etc., F4 > Purchasables).
	4. Buy weapon shipments for resale/personal use (F4 > Shipments).
------------------
]],
	weapons = {},
	command = "gun_dealer",
	max = 3,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = true,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Merchants",
    sortOrder = 10,
    tier = 'M'
})
--=========================================================================================================
TEAM_BLACK_MARKET_DEALER = AddExtraTeam("Black Market Dealer", {
	color = Color(204, 209, 209, 255),
	model = "models/player/gman_high.mdl",
	description = [[A black market dealer, through their various black market connections, has the ability to sell illegal items such as infiltration equipment, weapons, burglary tools, hacking equipment, and Kevlar armor to any clientelle they approve of. This job can be very profitable, but be careful who you sell to. Profits attract unwanted attention. Keep a close eye on the laws of your city to ensure your safety, and not to get caught selling illegal items to people as this could quickly earn you a jail cell instead. Be mindful of all your customers, and be as accommodating as possible, but always be ready for anything. You never know in this line of work. It is recommended that you hire some security, just in case.
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as this job. Your only goal is sales. As a businessman who specializes in illegal property you are permitted to wander and sell items to people that want them, but mind your store and make it a priority. You must have a shop set up or let another player take your place. Do not tie up job slots by going afk or not having an operational store. To be successful it requires a serious player or you will get yourself in trouble. Only kill another player if they are raiding your store or attacking you. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base (operate a store).
	2. Access money printers (F4 > Purchasables).
	3. Buy store supplies (cash register, shelves, etc., F4 > Purchasables).
	4. Buy illegal shipments for resale/personal use (F4 > Shipments).
	5. Wander around selling illegal items to shady people (F4 > Shipments).
------------------
]],
	weapons = {},
	command = "black_market_dealer",
	max = 4,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,

	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Merchants",
    sortOrder = 20,
    tier = 'M'
})
--=========================================================================================================
TEAM_DOCTOR = AddExtraTeam("Doctor", {
	color = Color(125, 206, 160, 255),
	model = "models/player/magnusson.mdl",
	description = [[As a doctor you are to aid people with their medical needs. People get hurt every day in all kinds of crazy ways. You see all sorts of things walk through your door. Fights, burn victims, car accident survivors, you name it.. some of them even have lasting pain that needs treated with alternative pain medications, including your personal favorite - medical cannabis! You are a certified medical professional, with your own growing room and dispensory. Every individual is different, but a lot of your registered customers are fond of this particular solution to their pain management! Lately you have been seeing a lot of stabbing and shooting victims, and it makes you wonder exactly what the Hell has gone wrong with the world to make it so proliferated with violence.. however, the money is great so you can't claim that you're totally taken aback by it. Business has been so good this month..
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as this job. Your only goal is sales and public health. As a professional businessman you are not allowed to be wandering around. You must have an office set up or let another player take your place. Do not tie up job slots by going afk or not having an operational store. To be successful it requires a serious player or you will get yourself in trouble. Only kill another player if they are raiding your store or attacking you. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base (operate an office).
	2. Access money printers (F4 > Purchasables).
	3. Buy store supplies (cash register, shelves, etc., F4 > Purchasables).
	4. Grow medical marijuana for a profit. (F4 > Purchasables).
	5. Buy medical shipments for resale/personal use (F4 > Shipments).
	6. Charge for medical aid.
------------------
]],
	weapons = {"icefuse_medkit"},
	command = "doctor",
	max = 4,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	medic = true,
	mayorCanSetSalary = true,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Merchants",
    sortOrder = 30,
    tier = 'M'
})
--=========================================================================================================
TEAM_COOK = AddExtraTeam("Cook", {
	color = Color(174, 214, 241, 255),
	model = {"models/fearless/chef1.mdl"},
	description = [[As a cook you are a master chef, and your job is to sell food to the residents of the city and keep them well fed. The items you sell can restore health and buff energy. Items from your store are also able to be placed in a customer's pocket, so they can conveniently take the food items with them. The customers are always eager to restore their vitals, so demand is high! You should always bear in mind to keep a well stocked shelf, because there's lots of money to be made here if you price your food reasonably and keep up with demand. Defend your shop with a watchful eye! The occupants of this city quickly become unsettled when they cannot eat, and some have been show to break into establishments. Security is recommended for any store owner!
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as this job. Your only goal is sales. As a professional businessman you are not allowed to be wandering around. You must have a shop set up or let another player take your place. Do not tie up job slots by going afk or not having an operational store. To be successful it requires a serious player or you will get yourself in trouble. Only kill another player if they are raiding your store or attacking you. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base (operate a store).
	2. Access money printers (F4 > Purchasables).
	3. Buy store supplies (cash register, shelves, etc., F4 > Purchasables).
	4. Buy food shipments for resale/personal use (F4 > Shipments).

-Be sure that your customers know that your store's shipments can be placed within their pockets, as well as restore their health! These benefits offer a large advantage over the standard vending machines, which only refill your energy level! 
------------------
]],
	weapons = {},
	command = "cook",
	max = 4,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Merchants",
    sortOrder = 40,
    tier = 'M'
})
--=========================================================================================================
TEAM_DRUG_DEALER = AddExtraTeam("Drug Dealer", {
	color = Color(237, 187, 153, 255),
	model = "models/player/eli.mdl",
	description = [[As a drug dealer, you are to sell illegal drugs to people. It's a pretty lucrative gig. You started out just selling a bag of weed to your friends here and there for the extra cash and to help them out, but you soon realized that you were sitting on a gold mine. At that point you decided to expand to a more diverse clientele and started offering more products to your buyers. Now that the word is out everyone is coming to you. Everyone in town knows who you are, and anyone that wants to throw a great party knows that they should come see you first..
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as this job. Your only goal is sales. As a professional businessman you are not allowed to be wandering around. You must have a shop set up or let another player take your place. Do not tie up job slots by going afk or not having an operational store. To be successful it requires a serious player or you will get yourself in trouble. Only kill another player if they are raiding your store or attacking you. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base.
	2. Access money printers (F4 > Purchasables).
	3. Buy store supplies (cash register, shelves, etc., F4 > Purchasables).
	4. Grow marijuana for a profit (F4 > Purchasables).
	5. Buy drug shipments for resale/personal use (F4 > Shipments).
------------------
]],
	weapons = {},
	command = "drug_dealer",
	max = 4,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,

	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Merchants",
    sortOrder = 60,
    tier = 'M'
})
--=========================================================================================================
TEAM_HOTEL_MANAGER = AddExtraTeam("Hotel Manager", {
	color = Color(215, 189, 226, 255),
	model = "models/player/hostage/hostage_03.mdl",
	description = [[As a hotel manager your job is to provide living space for the various customers that come through your door seeking a place to stay. You don't really care who they are or what they are doing in there as long as they are peaceful, and paying the rent. You only have two priorities - money, and keeping happy tenants. You will find that hiring security, checking the locks on your doors on a regular basis, and installing a camera system will go a long way towards making your clients feel safe and secure.
  
Note: Mind your roleplay with this job very carefully. Do not FailRP. Do not mug or attempt to kidnap as this job. Your only goal is sales. As a professional businessman you are not allowed to be wandering around. You must have a hotel set up or let another player take your place. Do not tie up job slots by going afk or not having an operational hotel. To be successful it requires a serious player or you will get yourself in trouble. Only kill another player if they are raiding your hotel or attacking you. Random killing (RDM) in spawn (or anywhere else) for any reason is restricted and punishable. Always have sound reasons to initiate hostiles first. Any abuse of the position or its features will be punished with a jail stay or a ban. No exceptions. Know that your combat is monitored and logged for admins to review. This job is not exempt from the rules. If you break them, expect that you will receive harsh punishment.
  
-Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information.
-If you need to reference the rules you can use /rules at any time. :)
  
------------------
	You are allowed to do the following..
  
	1. Base in your hotel.
	2. Access money printers (F4 > Purchasables).
	3. Sell rooms in the hotel for a profit:
  
-Buy or section off all the doors to the rooms within a suitable building.
-Resell those rooms or sections of the building to occupants for a fee/rent money.
-Rooms must always be sold/rented at reasonable prices. Negotiate the price based on the client's needs.
------------------
]],
	weapons = {},
	command = "hotel_manager",
	max = 2,
	salary = 40,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = false,

	PlayerSpawn = function(ply) ply:SetHealth("100") ply:SetMaxHealth("100") ply:SetArmor("0") return CLIENT end,
    category = "Merchants",
    sortOrder = 70,
    tier = 'M'
})
--=========================================================================================================