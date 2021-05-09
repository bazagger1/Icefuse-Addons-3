--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_crack_factory/lua/entities/the_crack_mircowave/cl_init.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]


include("shared.lua")

function ENT:Draw()
	self:DrawModel()	
	if self:GetPos():Distance(EyePos()) > 400 then return end		
	if self:GetCooked() then	
		local pos = ((self:GetPos() ) + self:GetForward() * 2 + self:GetRight() * 3 + self:GetUp() * 7)		
		if !self.emitter then
			self.emitter = ParticleEmitter(pos)
		end	
		if self.emitter then
			local fire = self.emitter:Add( "particle/smokesprites_0016", pos)  
			if !fire then return end
			fire:SetColor( 255, 255, 0, 255 )   
			fire:SetVelocity( Vector(VectorRand().x * 10, VectorRand().y * 10, VectorRand().z) )
			fire:SetDieTime(1)            
			fire:SetLifeTime(0) 	
			fire:SetStartSize(2)
			fire:SetEndSize(0) 
			fire:SetGravity(Vector(0,0,0))
		end
	end
end

function ENT:OnRemove()
	if self.emitter then
		self.emitter:Finish()
	end
end

