--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_crack_factory/lua/entities/the_crack_npc/cl_init.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

include("shared.lua")

surface.CreateFont( "simple2_font_17crack", {
	font = "Lato",
	size = 17,
	weight = 500,
	antialias = true,
} )

surface.CreateFont( "simple2_font_19crack", {
	font = "Lato",
	size = 28,
	weight = 500,
	antialias = true,
} )

local ahshop3_icon1 = Material("materials/crackcontent/icon.png")

function ENT:Draw()

	self:DrawModel()

	local leng = self:GetPos():Distance(EyePos())
	local clam = math.Clamp(leng, 0, 255 )
	local main = (255 - clam)
	
	if (main <= 0) then return end

	local ahAngle = self:GetAngles()
	local AhEyes = LocalPlayer():EyeAngles()
	
	ahAngle:RotateAroundAxis(ahAngle:Forward(), 90)
	ahAngle:RotateAroundAxis(ahAngle:Right(), -90)		
	
	cam.Start3D2D(self:GetPos()+self:GetUp()*79, Angle(0, AhEyes.y-90, 90), 0.08)
	
		draw.RoundedBox(0,-130,10,260,60,Color(32, 30, 32, 70 + main))
		draw.RoundedBox( 0,-130,10,260,28, Color( 40, 38, 40, 70 + main ) )
		surface.SetDrawColor( 150, 150, 150, 70 + main )
		surface.SetMaterial( ahshop3_icon1	) 
		surface.DrawTexturedRect( -120, 16, 16, 16 )	
		draw.SimpleText( "Kim Jefferson", "simple2_font_19crack", -103, 23, Color( 168, 167, 168, 70 + main ), 0, 1 )
		draw.SimpleText( "Sell me your CrackBucket for $"..ccka.CrackBucketValue.." ea", "simple2_font_17crack", -120, 51, Color( 113, 111, 113, 70 + main ), 0, 1 )
		surface.SetDrawColor( Color(77, 75, 77 , 70 + main) )
		surface.DrawOutlinedRect( -130,10,260,60 )
		
	cam.End3D2D()	
	
end				
