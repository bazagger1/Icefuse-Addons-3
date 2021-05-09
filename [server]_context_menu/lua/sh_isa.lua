--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_context_menu/lua/sh_isa.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

ISA_COOLDOWN = 5 --Let them taunch only every 20 seconds

ISA_GROUPS = {
	["everyone"] = {
	"c_e_o",
	"developer",

	"e_d", 
	"d_o_i", 
	"d_o_p", 
	"d_o_a", 

	"i_s", 
	"p_s", 
	"a_s",
	"advisor",

	"division_leader", 
	"sector_lead", 

	"elite_administrator", 
	"administrator", 
	"senior_moderator", 
	"moderator", 
	"trial_mod",

	"champion", 
	"legend", 
	"loyal", 
	"supporter", 
	"patron", 
	"subscriber",

	"user", 
	"member"},





	["admins"] = {"superadmin", "admin", "owner"},
	["donators"] = {"bronzevip", "goldvip"}
}


--Keep ID's uinique, or items will override each other
ISA_ACTIONS = {
	[1] = {name = "Wave",            price = 3500, anim = ACT_GMOD_GESTURE_WAVE, sound = "vo/canals/shanty_hey.wav", group = "everyone", time = 1.5},
	[2] = {name = "Salute",          price = 6500, anim = ACT_GMOD_TAUNT_SALUTE, sound = "vo/streetwar/sniper/ba_returnhero.wav", group = "everyone", time = 2},
	[3] = {name = "Laugh",           price = 4500, anim = ACT_GMOD_TAUNT_LAUGH, sound = "vo/ravenholm/madlaugh04.wav", group = "everyone", time = 2},
	[4] = {name = "Show Muscles",    price = 2500, anim = ACT_GMOD_TAUNT_MUSCLE, sound = "vo/npc/Barney/ba_ohyeah.wav", group = "everyone", time = 3},
	[5] = {name = "Point",           price = 2500, anim = ACT_GMOD_GESTURE_POINT, sound = "vo/npc/male01/overthere02.wav", group = "everyone", time = 2},
	[6] = {name = "Dance",           price = 8500, anim = ACT_GMOD_TAUNT_DANCE, sound = "vo/npc/vortigaunt/yes.wav", group = "everyone", time = 3},
	[7] = {name = "Robot Dance",     price = 10000, anim = ACT_GMOD_TAUNT_DANCE, sound = "vo/npc/vortigaunt/yes.wav", group = "everyone", time = 3},
	-- [7] = {name = "Wave", price = 1000, anim = ACT_SIGNAL_HALT, sound = "plats/elevator_large_start1.wav", group = "everyone", time = 1.5},
	-- [8] = {name = "Wave", price = 1000, anim = ACT_SIGNAL_HALT, sound = "plats/elevator_large_start1.wav", group = "everyone", time = 1.5},
}

--Seperate commands using ;
--Dont add a space after the ";"
ISA_COMMANDS = {
	[1] = {name = "MultiCore Rendering", onEnabled = "gmod_mcore_test 1", onDisabled = "gmod_mcore_test 0"},
	[2] = {name = "Fix Vehicle Texture Glitch", onEnabled = "r_rootlod 0", onDisabled = "r_rootlod 2"},
	-- [2] = {name = "Test", onEnabled = "say enabled;kill", onDisabled = "say disabled;kill"},
	-- [3] = {name = "Example 1", onEnabled = "gmod_mcore_test 1", onDisabled = "gmod_mcore_test 0"},
	-- [4] = {name = "Example 2", onEnabled = "say enabled;kill", onDisabled = "say disabled;kill"},
}

ISA_SERVERS = {
	[1] = {name = "Clone Wars (SWRP): Main", ip = "208.103.169.41:27015"}, --old: 192.99.239.48:27015
	[2] = {name = "Clone Wars (SWRP): Event", ip = "208.103.169.41:27016"}, --old: 192.99.239.48:27016
	[3] = {name = "MilitaryRP", ip = "208.103.169.27:27017"}, --old: 192.99.239.50:27015
	[4] = {name = "CityRP", ip = "208.103.169.27:27019"}, --old: 192.99.239.49:27015
	[5] = {name = "APB/Rockford", ip = "208.103.169.42:27015"}, --old: 192.99.239.49:27015
}


local ply = FindMetaTable("Player")

--Can be called on a player, just checks if they can buy it
--If they cannot it notifies the player when called on the client
--And on the server returns true or false if it can or cannot be purchased by the user
function ply:ISA_CanBuyAction(action)
	--Check rank first
	local action = ISA_ACTIONS[action]

	if action.group ~= nil then
		local match = false

		for k, v in pairs(ISA_GROUPS[action.group]) do
			if self:GetUserGroup() == v then
				match = true
				break
			end
		end

		if not match then 
			--Failed due to not being the correct rank.
			--Tell them
			if CLIENT then
				self:ChatPrint("[Gestures] Failed to purchase gesture becuase you are not the correct rank!")
			end

			return false
		end
	end

	--Check money second
	if not self:canAfford(action.price) then
		if CLIENT then 
			self:ChatPrint("[Gestures] You need more money to buy this!")
		end
		return false
	end

	--We can!
	return true
end