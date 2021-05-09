--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_darkrpmodification/lua/darkrp_customthings/groupchats.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

/*---------------------------------------------------------------------------
Group chats
---------------------------------------------------------------------------
Team chat for when you have a certain job.
e.g. with the default police group chat, police officers, chiefs and mayors can
talk to one another through /g or team chat.

HOW TO MAKE A GROUP CHAT:
Simple method:
GAMEMODE:AddGroupChat(List of team variables separated by comma)

Advanced method:
GAMEMODE:AddGroupChat(a function with ply as argument that returns whether a random player is in one chat group)
This is for people who know how to script Lua.

---------------------------------------------------------------------------*/
GAMEMODE:AddGroupChat(TEAM_STAFF_ON_DUTY)


GAMEMODE:AddGroupChat(
TEAM_MAYOR, 
TEAM_SECRET_SERVICE, 
TEAM_SWAT_CHIEF, 
TEAM_SWAT_TACTICLE, 
TEAM_SWAT_SNIPER, 
TEAM_SWAT_CQB, 
TEAM_POLICE_CHIEF, 
TEAM_POLICE_OFFICER, 
TEAM_BANK_SECURITY,
----------------------------------------
TEAM_FBI_CHIEF,
TEAM_FBI_AGENT,
TEAM_SPECIAL_OPS_CHIEF,
TEAM_SPECIAL_OPS_AGENT,
TEAM_SUPER_SOLDIER
)






GAMEMODE:AddGroupChat(TEAM_REBEL_LEADER, TEAM_REBEL)
GAMEMODE:AddGroupChat(TEAM_MASTER_THIEF, TEAM_THIEF)
GAMEMODE:AddGroupChat(TEAM_TERRORIST_LEADER, TEAM_TERRORIST)
GAMEMODE:AddGroupChat(TEAM_FIGHT_CLUB_MANAGER, TEAM_FIGHT_CLUB_MEMBER)
GAMEMODE:AddGroupChat(TEAM_PIMP, TEAM_PROSTITUTE)
GAMEMODE:AddGroupChat(TEAM_HOBO_KING, TEAM_HOBO)
GAMEMODE:AddGroupChat(TEAM_CULTIST_PRIEST, TEAM_CULTIST_MEMBER)
GAMEMODE:AddGroupChat(TEAM_PROTESTER_LEADER, TEAM_PROTESTER)
