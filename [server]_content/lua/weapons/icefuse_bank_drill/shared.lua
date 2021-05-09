--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_content/lua/weapons/icefuse_bank_drill/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	
end

if ( CLIENT ) then

	SWEP.PrintName			= "Bank Drill"
	SWEP.Author				= "Icefuse"
	SWEP.Slot				= 4
	SWEP.SlotPos			= 1
	SWEP.IconLetter			= "Bank Drill"
end


SWEP.Base				= "weapon_base"
SWEP.HoldType			= "physgun"
SWEP.Category			= "Icefuse Utilities"
SWEP.ViewModelFlip		= false
SWEP.ViewModelFOV		= 85

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModel			= "models/weapons/v_mach_ree_nailgun.mdl"
SWEP.WorldModel			= "models/weapons/w_mach_ree_nailgun.mdl"

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= true
SWEP.AutoSwitchFrom		= true

SWEP.Primary.Sound			= Sound( "NPC_Manhack.Slice" )
SWEP.Primary.Recoil			= 1
SWEP.Primary.Damage			= 12.5
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= -1
SWEP.Primary.Delay			= 0.2
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "nil"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"
SWEP.IronSightsPos = Vector(-1.642, -0.419, 0.642)
SWEP.IronSightsAng = Vector(0, 0.003, 0)
SWEP.AimSightsPos = Vector (-1.642, -0.419, 0.642)
SWEP.AimSightsAng = Vector (0, 0.003, 0)
SWEP.DashArmPos = Vector (2.5202, 0.6998, 1.1286)
SWEP.DashArmAng = Vector (-22.8466, 12.5831, -4.7914)

--Extras
SWEP.ReloadHolster	= 3
SWEP.TracerShot		= 0
SWEP.CSSZoom		= true
-- Accuracy
SWEP.CrouchCone				= 0.017 -- Accuracy when we're crouching
SWEP.CrouchWalkCone			= 0.017 -- Accuracy when we're crouching and walking
SWEP.WalkCone				= 0.017 -- Accuracy when we're walking
SWEP.AirCone				= 0.017 -- Accuracy when we're in air
SWEP.StandCone				= 0.017 -- Accuracy when we're standing still
SWEP.IronSightsCone			= 0.017
SWEP.Delay				= 0.25
SWEP.DelayZoom			= 0.25
SWEP.Recoil				= 1
SWEP.RecoilZoom			= 0.4

function SWEP:Think()
	self:SetHoldType( "shotgun" )
end

function SWEP:SecondaryAttack() end

function SWEP:DrawWorldModel()
	self:SetModelScale(1.5,0)
	self:DrawModel()
end

function SWEP:PrimaryAttack()	
	self.Weapon:SetNextPrimaryFire( CurTime() + self.Primary.Delay )

	
	if self.Owner:GetEyeTrace().Entity:GetClass()~="func_breakable" or self.Owner:GetEyeTrace().HitPos:Distance(self.Owner:GetPos()+Vector(0,0,73))>50 then 
		if SERVER then
			self.Owner:ChatPrint("You must be aiming at a bank vault entrance!")
		end
		return
	end


		self.Weapon:EmitSound( self.Primary.Sound , 300, math.Rand(90,110))
		self:ShootEffects()
		local dmg = DamageInfo()
		dmg:SetAttacker(self.Owner)
		dmg:SetInflictor(self)
		dmg:SetDamageType(64)
		dmg:IsExplosionDamage(true)
		dmg:SetDamage(self.Primary.Damage)
		if SERVER then
			self.Owner:GetEyeTrace().Entity:TakeDamageInfo(dmg)
			local ply = self.Owner
			local ang = self.Owner:GetAngles():Forward()
			local pushvel
			pushvel = ang * 50
			ply:SetGroundEntity(nil)
			ply:SetLocalVelocity(ply:GetVelocity() - Vector(pushvel.X,pushvel.Y,0))
		end
		self.Owner:ViewPunch(Angle(math.random(-1,1),math.random(-1,1),0))

	self:TakePrimaryAmmo( 0 )
	//Remove X bullet from our clip	
end

function SWEP:FireAnimationEvent( pos, ang, event, options )
	
	-- Disables animation based muzzle event
	if ( event == 21 ) then return true end	
	if ( event == 20 ) then return true end	

	-- Disable thirdperson muzzle flash
	if ( event == 5001 ) then return true end
	if ( event == 5003 ) then return true end
	if ( event == 5011 ) then return true end
	if ( event == 5021 ) then return true end
	if ( event == 5031 ) then return true end
	if ( event == 6001 ) then return true end

end