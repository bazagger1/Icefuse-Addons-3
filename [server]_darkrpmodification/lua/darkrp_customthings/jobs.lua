--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_darkrpmodification/lua/darkrp_customthings/jobs.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

--=========================================================================================================
TEAM_CITIZEN = AddExtraTeam("Citizen", {
	color = Color(169, 223, 191, 255),
	model = {
		"models/player/group01/male_01.mdl",
		"models/player/group01/male_02.mdl",
		"models/player/group01/male_03.mdl",
		"models/player/group01/male_04.mdl",
		"models/player/group01/male_05.mdl",
		"models/player/group01/male_06.mdl",
		"models/player/group01/male_07.mdl",
		"models/player/group01/male_08.mdl"
	},
	description = [[The citizen is the most basic level of society you can hold aside from being a hobo. Being fortunate enough to meet your daily requirements has kept you in good shape as a well-groomed resident, and you pride yourself on having come so far in life. Your upbringing wasn't always as great as you wished, but yet here you are. You've still managed to make it to the city you always dreamed of living in! Wow, I guess a bit of hard work and dedication goes a long way. Now that you are here, you should establish a home and get to work on whatever you choose, really. There's so many options! You're well on your way to creating a foothold for yourself in this amazing new city..
  
	You are allowed to do the following..
  
	1. Base (create a home for yourself and/or friends).
	2. Get a car (drive like a boss).
	3. Try to find work or a means to make money.
]],
	weapons = {},
	command = "citizen",
	max = 0,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = true,
    category = "General",
    sortOrder = 300
})
--=========================================================================================================

GAMEMODE.DefaultTeam = TEAM_CITIZEN
DarkRP.addHitmanTeam(TEAM_HITMAN)
DarkRP.addHitmanTeam(TEAM_PRO_HITMAN)

--These settings change who is considered 'government' only, and will not affect access to doors. These settings mean that the server will show any players with the jobs below a message for the use of /pcon (police forces) or /mcon (president). Use 'doorgroups.lua' to configure government job door permissions.
GAMEMODE.CivilProtection = GAMEMODE.CivilProtection or {}

GAMEMODE.CivilProtection[TEAM_PRESIDENT] = true
GAMEMODE.CivilProtection[TEAM_SECRET_SERVICE] = true
GAMEMODE.CivilProtection[TEAM_FIB] = true
GAMEMODE.CivilProtection[TEAM_SWAT_CHIEF] = true
GAMEMODE.CivilProtection[TEAM_SWAT_HEAVY] = true
GAMEMODE.CivilProtection[TEAM_SWAT_SNIPER] = true
GAMEMODE.CivilProtection[TEAM_SWAT_MEDIC] = true  
GAMEMODE.CivilProtection[TEAM_SWAT] = true
GAMEMODE.CivilProtection[TEAM_POLICE_CHIEF] = true
GAMEMODE.CivilProtection[TEAM_POLICE_OFFICER] = true
GAMEMODE.CivilProtection[TEAM_HIGHWAY_PATROL] = true
GAMEMODE.CivilProtection[TEAM_PRISON_GUARD] = true


GAMEMODE.CivilProtection[TEAM_IRON_MAN] = true
GAMEMODE.CivilProtection[TEAM_WAR_MACHINE] = true
GAMEMODE.CivilProtection[TEAM_SPIDERMAN] = true
GAMEMODE.CivilProtection[TEAM_YODA_HULK] = true
GAMEMODE.CivilProtection[TEAM_AQUAMAN] = true
GAMEMODE.CivilProtection[TEAM_BATMAN] = true
GAMEMODE.CivilProtection[TEAM_SUPERMAN] = true
GAMEMODE.CivilProtection[TEAM_BLACK_LIGHTNING] = true
GAMEMODE.CivilProtection[TEAM_FIRESTORM] = true
GAMEMODE.CivilProtection[TEAM_POWER_RANGER] = true
GAMEMODE.CivilProtection[TEAM_NINJA_TURTLE] = true
GAMEMODE.CivilProtection[TEAM_STAR_LORD] = true






















