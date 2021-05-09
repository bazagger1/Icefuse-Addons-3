--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_crack_factory/lua/crack/sv/data/data.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

if SERVER then

ccka2 = ccka2 || {}

function ccka2.SaveSimple(ply, cmd, args)   
	if ccka.SellWithoutNPC then return end
    if ply:IsSuperAdmin() then  
        local heroine = {}       
        for k,v in pairs( ents.FindByClass("the_crack_npc") ) do
            heroine[k] = { type = v:GetClass(), pos = v:GetPos(), ang = v:GetAngles() }
        end	      
        local convert_data = util.TableToJSON( heroine )		   
        file.Write( "ccka2/ccka2.txt", convert_data )   
    end
end
concommand.Add("save_crack", ccka2.SaveSimple)
 
function ccka2.DeleteSimple(ply, cmd, args)
	if ccka.SellWithoutNPC then return end 
    if ply:IsSuperAdmin() then    
        file.Delete( "ccka2/ccka2.txt" )   
    end    
end
concommand.Add("delete_crack", ccka2.DeleteSimple)
 
function ccka2.SpawnSimple(ply, cmd, args)
	if ccka.SellWithoutNPC then return end
    if ply:IsSuperAdmin() then
        local spawnvault = ents.Create( "the_crack_npc" )
        if ( !IsValid( spawnvault ) ) then return end
        spawnvault:SetPos( ply:GetPos() + (ply:GetForward() * 100) )
        spawnvault:Spawn()	
    end    
end
concommand.Add("spawn_crack", ccka2.SpawnSimple)
 
function ccka2.RespawnSimple()
	if ccka.SellWithoutNPC then return end
    if !file.IsDir( "ccka2", "DATA" ) then
        file.CreateDir( "ccka2", "DATA" ) 
    end	
	if not file.Exists("ccka2/ccka2.txt","DATA") then return end 
    local ImportData = util.JSONToTable(file.Read("ccka2/ccka2.txt","DATA"))   
    for k, v in pairs(ImportData) do      
        local npc = ents.Create( v.type )
        npc:SetPos( v.pos )
        npc:SetAngles( v.ang )
        npc:Spawn()
	end
end
hook.Add( "InitPostEntity", "simple_crack_respawn", ccka2.RespawnSimple )

end