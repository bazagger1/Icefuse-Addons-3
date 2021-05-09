--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_content/lua/entities/donation_box/cl_init.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

include 'shared.lua'

local color_white = Color(255,255,255)
local color_black = Color(0,0,0)

surface.CreateFont('DonationBox3D2D',{font = 'Tahoma',size = 130,weight = 1700,shadow = true, antialias = true})

local client = nil
function ENT:Draw()
	self:DrawModel()

	if not IsValid(client) then
		client = LocalPlayer()
		
		return
	end
	
	if client:EyePos():DistToSqr(self:GetPos()) > 350 ^ 2 then
		return
	end
	
	local pos 	= self:GetPos()
	local ang 	= self:GetAngles()
	local mypos = LocalPlayer():GetPos()

	if (pos:Distance(mypos) > 350) or (mypos - mypos):DotProduct(LocalPlayer():GetAimVector()) < 0 then
		return
	end

	ang:RotateAroundAxis(ang:Up(), 90)
	ang:RotateAroundAxis(ang:Forward(), 76.5)

	cam.Start3D2D(pos + (ang:Right() * -20) + (ang:Up() * -14.51) , ang, 0.0225)
		draw.SimpleTextOutlined((IsValid(self:Getowning_ent()) and self:Getowning_ent():Name() or 'Unknown'), 'DonationBox3D2D', 0, -80, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, color_black)
		draw.SimpleTextOutlined('$' .. self:GetMoney(), 'DonationBox3D2D', 0, -80, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, color_black)         
	cam.End3D2D()
end