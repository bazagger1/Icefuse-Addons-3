--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_content/lua/weapons/icefuse_drilldo/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

if( SERVER ) then
        AddCSLuaFile( "shared.lua" );
end
 
if( CLIENT ) then
        SWEP.PrintName = "Drilldo";
		SWEP.Category = "Icefuse Utilities";
        SWEP.Slot = 3;
        SWEP.SlotPos = 3;
        SWEP.DrawAmmo = false;
        SWEP.DrawCrosshair = false;
end
 
SWEP.Author                     = ""
SWEP.Instructions       = "Left click to drill"
SWEP.Contact            = ""
SWEP.Purpose            = ""
 
SWEP.ViewModelFOV       = 62
SWEP.ViewModelFlip      = false
 
SWEP.Spawnable                  = true
SWEP.AdminSpawnable             = true
 
SWEP.NextStrike = 0;
 
SWEP.ViewModel      = "models/jaanus/v_drilldo.mdl"
SWEP.WorldModel   = "models/jaanus/w_drilldo.mdl"
 
-------------Primary Fire Attributes----------------------------------------
SWEP.Primary.Delay                      = 0.001         --In seconds
SWEP.Primary.Recoil                     = 0             --Gun Kick
SWEP.Primary.Damage                     = 15    --Damage per Bullet
SWEP.Primary.NumShots           = 1             --Number of shots per one fire
SWEP.Primary.Cone                       = 0     --Bullet Spread
SWEP.Primary.ClipSize           = -1    --Use "-1 if there are no clips"
SWEP.Primary.DefaultClip        = -1    --Number of shots in next clip
SWEP.Primary.Automatic          = true  --Pistol fire (false) or SMG fire (true)
SWEP.Primary.Ammo               = "none"        --Ammo Type
 
-------------Secondary Fire Attributes-------------------------------------
SWEP.Secondary.Delay            = 0.9
SWEP.Secondary.Recoil           = 0
SWEP.Secondary.Damage           = 0
SWEP.Secondary.NumShots         = 1
SWEP.Secondary.Cone                     = 0
SWEP.Secondary.ClipSize         = -1
SWEP.Secondary.DefaultClip      = -1
SWEP.Secondary.Automatic        = true
SWEP.Secondary.Ammo         = "none"
 
-- util.PrecacheSound("vo/npc/male01/yeah02.wav")
util.PrecacheSound("physics/rubber/rubber_tire_impact_hard1.wav")
util.PrecacheSound("physics/rubber/rubber_tire_impact_hard2.wav")
util.PrecacheSound("physics/rubber/rubber_tire_impact_hard3.wav")
util.PrecacheSound("physics/flesh/flesh_strider_impact_bullet1.wav")
util.PrecacheSound("physics/flesh/flesh_strider_impact_bullet2.wav")
util.PrecacheSound("physics/flesh/flesh_strider_impact_bullet3.wav")
util.PrecacheSound("weapons/crossbow/hitbod1.wav")
util.PrecacheSound("weapons/crossbow/hitbod2.wav")
util.PrecacheSound("weapons/drilldo/rev.wav")
 
 
function SWEP:Initialize()
        if( SERVER ) then
                self:SetWeaponHoldType( "pistol" );
        end
        self.Hit = {
        Sound( "physics/rubber/rubber_tire_impact_hard1.wav" ),
        Sound( "physics/rubber/rubber_tire_impact_hard2.wav" ),
        Sound( "physics/rubber/rubber_tire_impact_hard3.wav" ) };
        self.FleshHit = {
        Sound( "physics/flesh/flesh_strider_impact_bullet1.wav" ),
        Sound( "physics/flesh/flesh_strider_impact_bullet2.wav" ),
        Sound( "physics/flesh/flesh_strider_impact_bullet3.wav" ),
        util.PrecacheSound("weapons/crossbow/hitbod1.wav"),
        util.PrecacheSound("weapons/crossbow/hitbod2.wav"),
        util.PrecacheSound("weapons/crossbow/hitbod3.wav"), };
 
end
 
function SWEP:Precache()
end
 
-- function SWEP:Deploy()
        -- if SERVER then
                -- self.Owner:EmitSound( "vo/npc/male01/yeah02.wav" );
        -- end
        -- return true;
-- end
 
function SWEP:PrimaryAttack()
        if( CurTime() < self.NextStrike ) then return; end
        self.NextStrike = ( CurTime() + .2 );
        self.Owner:LagCompensation(true)
        local trace = self.Owner:GetEyeTrace();
        if trace.HitPos:Distance(self.Owner:GetShootPos()) <= 70 then
                if( trace.Entity:IsPlayer() or trace.Entity:IsNPC() or trace.Entity:GetClass()=="prop_ragdoll" ) then
                        
                        self.Weapon:EmitSound("weapons/drilldo/rev.wav")
                        if SERVER then
                                if trace.Entity:IsPlayer() then trace.Entity:TakeDamage(30,self.Owner,self) end
                                self.Owner:EmitSound( self.FleshHit[math.random(1,#self.FleshHit)] );
                        end
                else
                        if SERVER then
                                self.Owner:EmitSound( self.Hit[math.random(1,#self.Hit)] );
                        end
                        self.Weapon:EmitSound("weapons/drilldo/rev.wav")
                end
                        self.Owner:SetAnimation( PLAYER_ATTACK1 );
                        self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK );
                        --        bullet = {}
                        --        bullet.Num    = 1
                        --        bullet.Src    = self.Owner:GetShootPos()
                        --        bullet.Dir    = self.Owner:GetAimVector()
                        --        bullet.Spread = Vector(0, 0, 0)
                        --        bullet.Tracer = 0
                        --        bullet.Force  = 1
                        --        bullet.Damage = 10
                        --self.Owner:FireBullets(bullet)
        else
                self.Owner:SetAnimation( PLAYER_ATTACK1 );
                self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK );
                self.Weapon:EmitSound("weapons/drilldo/rev.wav")
        end
        self.Owner:LagCompensation(false)
end