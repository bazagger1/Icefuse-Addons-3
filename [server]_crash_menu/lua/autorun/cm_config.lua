--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_crash_menu/lua/autorun/cm_config.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

CM = {}

//Increase this if the menu shows on map change.
CM.DelayTime = 5

//Whats the title?
CM.Title = "Whoops..."

//What message do you want to display when the server has crashed?
CM.Message = "Looks like the server has just crashed or you lost connection! Things should be up and running shortly :)"

//What is the estimated time in seconds it takes for the server to restart after a crash?
CM.ServerRestartTime = 35

CM.BackgroundColor = Color(30, 30, 30, 245)

CM.ButtonColor = Color(25, 25, 25, 200)
CM.ButtonHoverColor = Color(25, 25, 25, 220)

CM.TitleTextColor = Color(236, 240, 241)
CM.MessageTextColor = Color(236, 240, 241)
CM.ButtonTextColor = Color(255, 255, 255)

/*
Insert the YouTube video ID if you want music.
Example:
If the YouTube link is: https://www.youtube.com/watch?v=2HQaBWziYvY then 'YouTubeURL = "2HQaBWziYvY"'.

Leave YouTubeURL at nil if you don't want any music.
*/
CM.YouTubeURL = nil

//Server buttons(Limit 3).

CM.ServerNameButtons = {
	"Website",
}

//Make sure it corresponds to the server names above!
//You can also do websites. Have it start with http://
CM.ServerIPButtons = {
	"http://icefuse.net/",
}

//Delete the code inside the brackets of both the ServerNameButtons and ServerIPButtons if you don't need server buttons.
