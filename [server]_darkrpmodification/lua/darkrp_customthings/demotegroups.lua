--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_darkrpmodification/lua/darkrp_customthings/demotegroups.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

/*---------------------------------------------------------------------------
Demote groups
---------------------------------------------------------------------------
When a chief of police gets demoted you don't want them to be banned from becoming civil protection officer as well.
That is what demote groups are for.

When someone in a group is demoted, they will be banned from EVERY job in the group.
The examples shown below are the default demote groups

HOW TO CREATE A DEMOTE GROUP:
DarkRP.createDemoteGroup("Name of the group", {TEAM1, TEAM2})
---------------------------------------------------------------------------*/


-- Example: DarkRP.createDemoteGroup("Cops", {TEAM_POLICE, TEAM_CHIEF})
-- Example: DarkRP.createDemoteGroup("Gangsters", {TEAM_GANG, TEAM_MOB})
