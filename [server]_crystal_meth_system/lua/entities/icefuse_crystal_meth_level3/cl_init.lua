--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_crystal_meth_system/lua/entities/icefuse_crystal_meth_level3/cl_init.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

include("shared.lua")

ENT.RenderGroup = RENDERGROUP_BOTH

local TEXT_FADE_DISTANCE = 300 ^ 2
local TEXT_FADE_DISTANCE_LENGTH = 100 ^ 2

local SCALE = 3
local BOX_WIDTH = 150 * SCALE
local BOX_HEADER_HEIGHT = 30 * SCALE
local BOX_BODY_HEIGHT = 40 * SCALE

ENT.BOX_UP = 1

--------------------------------------------------

function ENT:Initialize()
	
end

surface.CreateFont("ph_TrebuchetC", {
	font = "Trebuchet24",
	size = 19 * SCALE,
	weight = 400
})

surface.CreateFont("ph_TrebuchetD", {
	font = "Trebuchet24",
	size = 40 * SCALE,
	weight = 400,
})

function ENT:Draw()
	self:DrawModel()
end

function ENT:DrawTranslucent()
	
	local client = LocalPlayer()
	
	local distance = self:GetPos():DistToSqr(client:GetViewEntity():GetPos())

	-- Don't draw from a certain distance
	local opacity = 1 - math.max(distance - TEXT_FADE_DISTANCE, 0) / TEXT_FADE_DISTANCE_LENGTH
	if opacity <= 0.2 then
		return
	end
	
	//Time
	local time = self:GetCrystalMethTimer()
	local minutes = math.floor(time / 60)
	local sec = time - (minutes * 60)
	local dots = ":"
	if sec < 10 then
		dots = ":0"
	end
	local actualtime = tonumber(minutes) .. dots .. tonumber(sec)

//=======================================================================//
--                              Draw 3D2D
//=======================================================================//
	
	local angle = self:GetAngles()
	
	local pos = self:GetPos()
	pos = pos + angle:Up() * (35 + self.BOX_UP)
	
	local angle = (pos - LocalPlayer():EyePos()):Angle()
	angle:RotateAroundAxis(angle:Up(), -90)
	angle:RotateAroundAxis(angle:Forward(), 90)
	
	cam.Start3D2D(pos, angle, 0.15 / SCALE)
		
		surface.SetDrawColor(51, 204, 255, 255 * opacity)
		surface.DrawRect(- BOX_WIDTH * .5, 0, BOX_WIDTH, BOX_HEADER_HEIGHT)
		
		surface.SetDrawColor(20, 20, 20, 200 * opacity)
		surface.DrawRect(- BOX_WIDTH * .5, BOX_HEADER_HEIGHT, BOX_WIDTH, BOX_BODY_HEIGHT)
		
		draw.SimpleText("Crystal Meth Timer" or actualtime, 'ph_TrebuchetC',
			- BOX_WIDTH * .5 + 5 * SCALE, BOX_HEADER_HEIGHT * .5, Color(255, 255, 255, 255 * opacity), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		
		draw.SimpleText(time <= 0 and "DONE" or actualtime, 'ph_TrebuchetD',
			0, BOX_HEADER_HEIGHT + BOX_BODY_HEIGHT * .5, Color(255, 255, 255, 255 * opacity), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			
	cam.End3D2D()
	
end