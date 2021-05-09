--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_crack_factory/lua/entities/the_crack_barrel/cl_init.lua
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
	
	if !self:GetCook() then return end
	
	local pos = ((self:GetPos() ) + self:GetUp() * 14)
	
	local position = {}
	local right = self:GetForward()
	position[1] = pos + right * -39.7
	

	if !self.emitter then
		self.emitter = self.emitter || {}
		for p=1,1 do 
			self.emitter[p] = ParticleEmitter( position[p] )
		end
	end
		
	for i=1,1 do 
		if self.emitter[i] then
			self.soda = self.soda || {}
			self.soda[i] = self.emitter[i]:Add( "effects/spark", position[i])  
			self.soda[i]:SetColor( 255,215,0 )  
			self.soda[i]:SetVelocity( Vector(0, 0, VectorRand().y) * 7 )
			self.soda[i]:SetDieTime(1)            
			self.soda[i]:SetLifeTime(0) 	
			self.soda[i]:SetStartSize(2)
			self.soda[i]:SetEndSize(0) 
			self.soda[i]:SetGravity(Vector(0,0,0))
		end
	end
end

function ENT:OnRemove()
	if !self.emitter then return end
	for i=1,1 do 
		if self.emitter[i] then
			self.emitter[i]:Finish()
		end
	end 
end