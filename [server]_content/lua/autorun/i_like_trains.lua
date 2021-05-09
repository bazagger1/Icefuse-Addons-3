--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_content/lua/autorun/i_like_trains.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- if SERVER then
-- hook.Add("OnEntityCreated", "wOS.RemoveRagdollShit", function( ent ) 

-- if ent == NULL or ent == nil then return end
-- local class = ent:GetClass()
-- if class == "prop_ragdoll" or class == "item_ammo_ar2_altfire" or class == "item_healthvial" or string.find( class, "ai_weapon" ) then 
-- if ent:IsValid() and ent != NULL then
-- timer.Simple( 0, function() 
-- if not ent:IsValid() then return end
-- if ent == NULL then return end
-- if IsValid(ent:GetNW2Entity('DW.corpse')) then return end -- Death World
-- ent:Remove() 
-- end )
-- end
-- return
-- end 

-- if string.find( class, "weapon_" ) then 
-- if ent:IsValid() and ent != NULL then
-- if ent:GetOwner() != NULL then return end
-- timer.Simple( 0, function() 
-- if not ent:IsValid() then return end
-- if ent == NULL then return end
-- ent:Remove() 
-- end )
-- end
-- end 

-- end )
-- else
-- hook.Add("OnEntityCreated", "wOS.RemoveRagdollShit", function( ent ) 

-- if ent == NULL or ent == nil then return end
-- if ent:GetClass() == "class C_ClientRagdoll" then 
-- if ent:IsValid() and ent != NULL then
-- SafeRemoveEntityDelayed( ent, 0 )  
-- end
-- end 

-- end )
-- end
