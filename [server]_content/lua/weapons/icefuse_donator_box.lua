--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_content/lua/weapons/icefuse_donator_box.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

SWEP.PrintName = "Cardboard Box"
SWEP.Category = "Icefuse Donator"
SWEP.Instructions = "Primary: !\nSecondary: Toggle stealth mode\nCrouch: Cardboard box"

SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.ViewModel = "models/weapons/v_hands.mdl"
SWEP.WorldModel = "models/gmod_tower/stealth box/box.mdl"

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

if CLIENT then
	SWEP.Slot = 0
	SWEP.SlotPos = 3
	SWEP.DrawCrosshair = false

	SWEP.WepSelectIcon = surface.GetTextureID( "cbox/select" )
	SWEP.BounceWeaponIcon = false
end

SWEP.m_WeaponDeploySpeed = 10 -- very fast, so we don't wind up waiting for the hands animation to play

function SWEP:Initialize()
	self:SetWeaponHoldType( "normal" )
	self:DrawShadow( false )
	
	if SERVER then
		if GetConVarNumber( "cbox_stealth" ) == 2 then
			self:SetStealth( true )
		end
	end
end

function SWEP:SetupDataTables()
	self:NetworkVar( "Bool", 0, "Stealth" )
end

function SWEP:IsUnderBox()
	-- IsOnGround is buggy and doesn't always return the right value in mp
	return self.Owner:Crouching()-- and self.Owner:IsOnGround()
end

function SWEP:EquipNoise()
	self.Owner:EmitSound( "cbox/equip.mp3" )
end

local Stealth, AdminStealth

if SERVER then
	AddCSLuaFile()
	
	Stealth = CreateConVar( "cbox_stealth", 1, FCVAR_ARCHIVE )
	AdminStealth = CreateConVar( "cbox_adminstealth", 0, FCVAR_ARCHIVE )
	-- 0: No stealth
	-- 1: Selectable stealth
	-- 2: Forced stealth
	
	-- resource.AddWorkshop( 317267606 )

	function SWEP:Alert()
		local effect = EffectData()
		effect:SetOrigin( self.Owner:GetPos() )
		effect:SetEntity( self.Owner )
		
		util.Effect( "MGSAlert", effect, true, true )
	end
end

function SWEP:PrimaryAttack()
	if CLIENT then return end

	self:Alert()
	self:SetNextPrimaryFire( CurTime() + 1 )
end

function SWEP:SecondaryAttack()
	if CLIENT then return end

	if Stealth:GetInt() ~= 1 then return end
	if AdminStealth:GetBool() and not self.Owner:IsAdmin() then return end

	self:SetStealth( not self:GetStealth() )
	
	if self:GetStealth() then
		self.Owner:ChatPrint( "Stealth mode activated." )
	else
		self.Owner:ChatPrint( "Stealth mode deactivated." )
	end
end

if SERVER then return end

function SWEP:Holster()
	if IsFirstTimePredicted() then
		if self:IsUnderBox() then
			self:EquipNoise()
		end
		
		self.UnderBox = false
		self.LerpMul = 1
	end
	
	return true
end

function SWEP:IsHiding()
	return self:GetStealth() and self:IsUnderBox() and self.LerpMul < 0.1
end

SWEP.LerpMul = 1
function SWEP:DrawWorldModel()
	if not IsValid( self.Owner ) then self:DrawModel() return end
	if not self:IsUnderBox() and self.LerpMul > 0.8 then return end

	local pos = self.Owner:GetPos()
	local ang = Angle( 0, self.Owner:EyeAngles().y, 0 )
	
	pos = pos + ( ang:Forward() * 10 )
	
	local bone_pos, bone_ang = self.Owner:GetBonePosition( self.Owner:LookupBone( "ValveBiped.Bip01_Spine1" ) )
	
	bone_pos = bone_pos + ( ang:Forward() * 10 )
	bone_pos.z = bone_pos.z - 15
	
	bone_ang:RotateAroundAxis( bone_ang:Forward(), 90 )
	bone_ang:RotateAroundAxis( bone_ang:Right(), -40 )
	bone_ang.y = ang.y -- box will spin around really fast in certain angles unless we make it the same in both
	
	if self:IsUnderBox() then
		local vel = self.Owner:GetVelocity():Length2D()
		local mul = math.Clamp( vel / 40, 0, 1 )
		self.LerpMul = Lerp( FrameTime() * 10, self.LerpMul, mul )
	else
		self.LerpMul = Lerp( FrameTime() * 10, self.LerpMul, 1 )
	end
	
	self:SetRenderOrigin( pos * ( 1 - self.LerpMul ) + bone_pos * self.LerpMul )
	self:SetRenderAngles( ang * ( 1 - self.LerpMul ) + bone_ang * self.LerpMul )
	self:SetModelScale( 1.2, 0 )
	
	if not self:IsHiding() then
		self:DrawModel()
	end
end

SWEP.Material = Material( "cbox/icon.png" )
function SWEP:DrawHUD()
	if not self:IsUnderBox() then return end

	surface.SetMaterial( self.Material )
	surface.SetDrawColor( Color( 255, 255, 255 ) )
	surface.DrawTexturedRect( ScrW() - 256, ScrH() - 256, 256, 256 )
end

-- SWEP:Think only gets called serverside and clientside with the owner.
-- We need it to fire on all players. Garry is stupid.
hook.Add( "Think", "CBoxThink", function()
	for _, pl in ipairs( player.GetAll() ) do
		local wep = pl:GetActiveWeapon()
		
		if IsValid( wep ) and wep:GetClass() == "weapon_cbox" and
			wep:IsUnderBox() ~= wep.UnderBox then

			wep:EquipNoise()
			wep.UnderBox = wep:IsUnderBox()
			
			if wep.UnderBox then
				wep.LerpMul = 1
			end
		end
	end
end )

hook.Add( "PrePlayerDraw", "CBoxStealth", function( pl )
	local wep = pl:GetActiveWeapon()
	
	if IsValid( wep ) and wep:GetClass() == "weapon_cbox" and wep:IsHiding() then
		pl:DrawShadow( false )
		return true
	end
	
	pl:DrawShadow( true )
end )

hook.Add( "HUDDrawTargetID", "CBoxTargetID", function()
	local pl = LocalPlayer():GetEyeTrace().Entity
	
	if not IsValid( pl ) then return end
	if not pl:IsPlayer() then return end

	local wep = pl:GetActiveWeapon()
	
	if IsValid( wep ) and wep:GetClass() == "weapon_cbox" and wep:IsUnderBox() then
		return false
	end
end )