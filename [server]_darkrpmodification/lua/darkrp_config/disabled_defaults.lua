--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_darkrpmodification/lua/darkrp_config/disabled_defaults.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

/*---------------------------------------------------------------------------
DarkRP disabled defaults
---------------------------------------------------------------------------

DarkRP comes with a bunch of default things:
	- a load of modules
	- default jobs
	- shipments and guns
	- entities (like the money printer)
	and many more

If you want to disable or replace the default things, you should disable them here

Note: if you want to have e.g. edit the official medic job, you MUST disable the default one in this file!
You can copy the medic from DarkRP and paste it in darkrp_config/jobs.lua
---------------------------------------------------------------------------*/


/*---------------------------------------------------------------------------
The list of modules that are disabled. Set to true to disable, false to enable.
Modules that are not in this list are enabled by default.
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["modules"] = {
	["afk"]              = true,
    ["voting"]           = true,
	["chatsounds"]       = false,
	["events"]           = true,
	["fpp"]              = true,
	["f1menu"]           = true,
	["f4menu"]           = false,
	["hitmenu"]          = true,
	["hud"]              = false,
	["hungermod"]        = false,
	["playerscale"]      = false,
	["sleep"]            = true,
	["fadmin"]           = true,
	["animations"]       = false,
}



/*---------------------------------------------------------------------------
The disabled default jobs. true to disable, false to enable.

NOTE: If you disable a job and remake it, expect things that rely on the job to stop working
e.g. you disable the gundealer and you make a new job as TEAM_GUN. If you want the shipments/door groups/etc. to
work for your custom job, remake them to include your job as well.
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["jobs"] = {
	["chief"]     = true,
	["citizen"]   = true,
	["cook"]      = true, --Hungermod only
	["cp"]        = true,
	["gangster"]  = true,
	["gundealer"] = true,
	["hobo"]      = true,
	["mayor"]     = true,
	["medic"]     = true,
	["mobboss"]   = true,
}

/*---------------------------------------------------------------------------
Shipments and pistols
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["shipments"] = {
	["AK47"]         = true,
	["Desert eagle"] = true,
	["Fiveseven"]    = true,
	["Glock"]        = true,
	["M4"]           = true,
	["Mac 10"]       = true,
	["MP5"]          = true,
	["P228"]         = true,
	["Pump shotgun"] = true,
	["Sniper rifle"] = true,
}

/*---------------------------------------------------------------------------
Entities
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["entities"] = {
	["Drug lab"]      = true,
	["Gun lab"]       = true,
	["Money printer"] = true,
	["Microwave"]     = true, --Hungermod only
}

/*---------------------------------------------------------------------------
Vehicles
(at the moment there are no default vehicles)
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["vehicles"] = {

}

/*---------------------------------------------------------------------------
Food
Food is only enabled when hungermod is enabled (see disabled modules above).
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["food"] = {
	["Banana"]           = false,
	["Bunch of bananas"] = false,
	["Melon"]            = false,
	["Glass bottle"]     = false,
	["Pop can"]          = false,
	["Plastic bottle"]   = false,
	["Milk"]             = false,
	["Bottle 1"]         = false,
	["Bottle 2"]         = false,
	["Bottle 3"]         = false,
	["Orange"]           = false,
}

/*---------------------------------------------------------------------------
Door groups
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["doorgroups"] = {
	["Cops and Mayor only"] = false,
	["Gundealer only"]      = true,
}


/*---------------------------------------------------------------------------
Ammo packets
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["ammo"] = {
	["Pistol ammo"]  = true,
	["Rifle ammo"]   = true,
	["Shotgun ammo"] = true,
}

/*---------------------------------------------------------------------------
Agendas
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["agendas"] = {
	["Gangster's agenda"] = false,
	["Police agenda"] = false,
}

/*---------------------------------------------------------------------------
Chat groups (chat with /g)
Chat groups do not have names, so their index is used instead.
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["groupchat"] = {
	[1] = false, -- Police group chat (mayor, cp, chief and/or your custom CP teams)
	[2] = false, -- Group chat between gangsters and the mobboss
}

/*---------------------------------------------------------------------------
Jobs that are hitmen
set to true to disable
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["hitmen"] = {
	["mobboss"] = false,
}

/*---------------------------------------------------------------------------
Demote groups
When anyone is demote from any job in this group, they will be temporarily banned
from every job in the group
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["demotegroups"] = {
	["Cops"]		 = false,
	["Gangsters"]	 = false,
}
