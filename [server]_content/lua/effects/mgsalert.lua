--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_content/lua/effects/mgsalert.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

AddCSLuaFile()

EFFECT.Material = Material( "cbox/alert.png" )

function EFFECT:Init( data )	
	self.EndTime = CurTime() + 1.5
	self.Entity = data:GetEntity()
	
	self.Height = 75
	self.EndHeight = 85
	
	self.Alpha = 255
	
	self.Entity:EmitSound( "cbox/alert.wav" )
end

function EFFECT:Render()
	render.SetMaterial( self.Material )
	self.Height = Lerp( FrameTime() * 5, self.Height, self.EndHeight)
	
	if ( ( self.EndTime - CurTime() ) < 0.5 ) then
		self.Alpha = math.Clamp( Lerp( FrameTime() * 7, self.Alpha, 0 ), 0, 255 )
	end
	
	render.DrawSprite( self.Entity:GetPos() + Vector( 0, 0, self.Height ), 16, 16, Color( 255, 255, 255, self.Alpha )  )
end

function EFFECT:Think()
	self:SetPos( self.Entity:GetPos() )
	
	return self.EndTime > CurTime()
end