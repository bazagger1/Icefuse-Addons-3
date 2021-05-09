--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_content/lua/autorun/dice.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

if SERVER then
	
	local string_sub = string.sub
	
	util.AddNetworkString('Dice')
	
	hook.Add('PlayerSay', 'Dice', function(ply, message)
		if string_sub(message, 1, 5) == '/roll' then
			local rangeNumber = math.floor(math.Clamp(tonumber(string_sub(message, 6)) or 100, 0, 1000000000))
			
			math.randomseed(SysTime() - FrameTime())
			local rollsNumber = math.random(0, rangeNumber)
			
			local players = {}
			for _, entity in pairs(ents.FindInSphere(ply:GetPos(), 250)) do
				if entity:IsPlayer() then
					table.insert(players, entity)
				end
			end
			
			net.Start('Dice')
				net.WriteString(ply:Nick())
				net.WriteUInt(rangeNumber, 32)
				net.WriteUInt(rollsNumber, 32)
			net.Send(players)
			
			return ""
		end
	end)
	
end

if CLIENT then
	
	net.Receive('Dice', function(len)
		
		local name = net.ReadString()
		local rangeNumber = net.ReadUInt(32)
		local rollsNumber = net.ReadUInt(32)
		
		chat.AddText(
			Color(0, 160, 0),		name,
			Color(255, 255, 255),	" rolls a dice... and rolls ",
			Color(255, 255, 255),	"",
			Color(240, 40, 40),		tostring(rollsNumber),
			Color(255, 255, 255),	" out of ",
			Color(40, 100, 255),	tostring(rangeNumber),
			Color(255, 255, 255),	"."
		)
		
	end)
	
end