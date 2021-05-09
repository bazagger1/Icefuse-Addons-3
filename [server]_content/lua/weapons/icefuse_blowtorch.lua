--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_content/lua/weapons/icefuse_blowtorch.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

if CLIENT then
	SWEP.PrintName = "Blowtorch"
	SWEP.Slot = 2
	SWEP.SlotPos = 1
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end

SWEP.Author = "Icefuse"
SWEP.Instructions = "Left Click: Hold to destroy props!"
SWEP.Contact = ""
SWEP.Category			= "Icefuse Utilities"
SWEP.Purpose = "To break through props like a boss"
SWEP.ViewModelFOV = 85
SWEP.ViewModelFlip = false

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.Primary.Sound = Sound( "NPC_Manhack.Slice" )
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = ""
--
SWEP.IronSightsPos = Vector(-1.642, -0.419, 0.642)
SWEP.IronSightsAng = Vector(0, 0.003, 0)
SWEP.AimSightsPos = Vector (-1.642, -0.419, 0.642)
SWEP.AimSightsAng = Vector (0, 0.003, 0)
SWEP.DashArmPos = Vector (2.5202, 0.6998, 1.1286)
SWEP.DashArmAng = Vector (-22.8466, 12.5831, -4.7914)

SWEP.ViewModel			= "models/weapons/v_mach_ree_nailgun.mdl"
SWEP.WorldModel			= "models/weapons/w_mach_ree_nailgun.mdl"

SWEP.TorchDistance = 80;
SWEP.TorchAmount = 25 -- How long it takes to 'drill' a prop in seconds
SWEP.TorchTimeout = 35;
SWEP.TorchReset = 5 -- Seconds

function SWEP:Initialize()
	self.nextPrimaryAttack = 1
end

function SWEP:Think()
	self:SetHoldType( "shotgun" )
end

function SWEP:DrawWorldModel()
	self:SetModelScale(1.5,0)
	self:DrawModel()
end

---------------------------------------------------------------------------------------------------------------
--                                               Functions
---------------------------------------------------------------------------------------------------------------

local TorchableEnts = {"prop_physics", "gmod_button"};

function SWEP:TorchEntity(ent)
	
	ent.SavedColor = ent:GetColor();
	ent.SavedSolid = ent:GetSolid();
	
	ent:SetRenderMode(1)
	ent:SetColor(Color(255,255,255,100));
	ent:SetSolid(SOLID_NONE);
	
	local vPoint = ent:GetPos()
	local effectdata = EffectData()
	effectdata:SetStart(vPoint)
	effectdata:SetOrigin(vPoint)
	effectdata:SetScale(1)
	util.Effect("Explosion", effectdata, true, true)
	ent:GetPhysicsObject():EnableMotion(false);
	
	timer.Simple(self.TorchTimeout, function()
		if ent:IsValid() then
			ent:SetColor(ent.SavedColor);
			ent:SetSolid(ent.SavedSolid);
		end
	end);
	
end

function SWEP:ShootEffects()

	-- self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK ) -- View model animation
	self.Owner:MuzzleFlash() -- Crappy muzzle light
	self.Owner:SetAnimation( PLAYER_ATTACK1 ) -- 3rd Person Animation

end

function SWEP:PrimaryAttack()
	
	if self.nextPrimaryAttack > SysTime() then
		return
	end
	self.nextPrimaryAttack = SysTime() + .1
	
	
	local Trace = self.Owner:GetEyeTrace();
	if Trace.HitPos:Distance(self.Owner:GetPos()) > self.TorchDistance || !Trace.Entity:IsValid() then
		self.nextPrimaryAttack = SysTime() + 1
		
		if CLIENT then
			notification.AddLegacy("Must use on an entity!", NOTIFY_GENERIC, 4)
		end
		
		return
	end
	
	if !table.HasValue(TorchableEnts, Trace.Entity:GetClass()) then
		self.nextPrimaryAttack = SysTime() + 1
		
		if CLIENT then
			notification.AddLegacy("Can't use on this entity!", NOTIFY_GENERIC, 4)
		end
		
		return
	end
	
	if CLIENT then -- Broken for the client for some reason if targeted at the weapon...
		self.Owner:EmitSound(self.Primary.Sound , 300, math.Rand(90,110))
	else
		self.Weapon:EmitSound(self.Primary.Sound , 300, math.Rand(90,110))
	end
	self:ShootEffects()
	
	local effectdata = EffectData()
	effectdata:SetOrigin(Trace.HitPos)
	effectdata:SetMagnitude(1)
	effectdata:SetScale(1)
	effectdata:SetRadius(2)
	util.Effect("Sparks", effectdata)
	
	if !SERVER then
		return
	end
	
	local ent = Trace.Entity;
	
	ent.torch = ent.torch or {
		amount = 0,
		last = 0
	}
	
	-- Reset if timed out
	if ent.torch.last > 0 and SysTime() - ent.torch.last > self.TorchReset then
		ent.torch.amount = 0
	end
	
	ent.torch.amount = ent.torch.amount + .1
	ent.torch.last = SysTime()
	
	if ent.torch.amount > self.TorchAmount then
		ent.torch.amount = 0
		self:TorchEntity(ent)
	end
	
end

function SWEP:SecondaryAttack()
	self:PrimaryAttack()
end