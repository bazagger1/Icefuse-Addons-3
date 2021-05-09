--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_content/lua/weapons/icefuse_anti_cancer_baton/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

AddCSLuaFile()

if CLIENT then
    SWEP.PrintName = "Anti-Cancer Baton"
    SWEP.Slot = 0
    SWEP.SlotPos = 5
    SWEP.RenderGroup = RENDERGROUP_BOTH

    killicon.AddAlias("stunstick", "weapon_stunstick")

    CreateMaterial("darkrp/stunstick_beam", "UnlitGeneric", {
        ["$basetexture"] = "sprites/lgtning",
        ["$additive"] = 1
    })
end

DEFINE_BASECLASS("stick_base")

SWEP.Instructions = "Left click to freeze/unfreeze the target player.\n\nRight click to kick the target player from the server immediately.\n\nThis tool is restricted to staff members of the rank Administrator or above and may be used responsibly during administrative situations."
SWEP.Author = "Icefuse (Psyche)"
SWEP.Spawnable = true
SWEP.Category = "Icefuse Utilities"

SWEP.StickColor = Color(0, 0, 255)

function SWEP:Initialize()
    BaseClass.Initialize(self)

    self.Hit = {
        Sound("weapons/stunstick/stunstick_impact1.wav"),
        Sound("weapons/stunstick/stunstick_impact2.wav")
    }

    self.FleshHit = {
        Sound("weapons/stunstick/stunstick_fleshhit1.wav"),
        Sound("weapons/stunstick/stunstick_fleshhit2.wav")
    }
end

function SWEP:SetupDataTables()
    BaseClass.SetupDataTables(self)
    -- Float 0 = LastPrimaryAttack
    -- Float 1 = ReloadEndTime
    -- Float 2 = BurstTime
    -- Float 3 = LastNonBurst
    -- Float 4 = SeqIdleTime
    -- Float 5 = HoldTypeChangeTime
    self:NetworkVar("Float", 6, "LastReload")
end

function SWEP:Think()
    BaseClass.Think(self)
    if self.WaitingForAttackEffect and self:GetSeqIdleTime() ~= 0 and CurTime() >= self:GetSeqIdleTime() - 0.35 then
        self.WaitingForAttackEffect = false

        local effectData = EffectData()
        effectData:SetOrigin(self:GetOwner():GetShootPos() + (self:GetOwner():EyeAngles():Forward() * 45))
        effectData:SetNormal(self:GetOwner():EyeAngles():Forward())
        util.Effect("StunstickImpact", effectData)
    end
end

function SWEP:DoFlash(ply)
    if not IsValid(ply) or not ply:IsPlayer() then return end

    ply:ScreenFade(SCREENFADE.IN, color_white, 1.2, 0)
end

local stunstickMaterial = Material("effects/stunstick")
local stunstickBeam     = Material("!darkrp/stunstick_beam")
function SWEP:PostDrawViewModel(vm)
    if self:GetSeqIdleTime() ~= 0 or self:GetLastReload() >= CurTime() - 0.1 then
        local attachment = vm:GetAttachment(1)
        local pos = attachment.Pos
        cam.Start3D(EyePos(), EyeAngles())
            render.SetMaterial(stunstickMaterial)
            render.DrawSprite(pos, 12, 12, Color(180, 180, 180))
            for i = 1, 3 do
                local randVec = VectorRand() * 3
                local offset = (attachment.Ang:Forward() * randVec.x) + (attachment.Ang:Right() * randVec.y) + (attachment.Ang:Up() * randVec.z)
                render.SetMaterial(stunstickBeam)
                render.DrawBeam(pos, pos + offset, 3.25 - i, 1, 1.25, Color(180, 180, 180))
                pos = pos + offset
            end
        cam.End3D()
    end
end

local light_glow02_add = Material("sprites/light_glow02_add")

function SWEP:DrawWorldModelTranslucent()
    if CurTime() <= self:GetLastReload() + 0.1 then
        local bone = self:GetOwner():LookupBone("ValveBiped.Bip01_R_Hand")
        if not bone then self:DrawModel() return end
        local bonePos, boneAng = self:GetOwner():GetBonePosition(bone)
        if bonePos then
            local pos = bonePos + (boneAng:Up() * -16) + (boneAng:Right() * 3) + (boneAng:Forward() * 6.5)
            render.SetMaterial(light_glow02_add)
            render.DrawSprite(pos, 32, 32, Color(255, 255, 255))
        end
    end
    self:DrawModel()
end

local entMeta = FindMetaTable("Entity")

function SWEP:Freeze(dmg)
    if CLIENT then return end

    self:GetOwner():LagCompensation(true)
    local trace = util.QuickTrace(self:GetOwner():EyePos(), self:GetOwner():GetAimVector() * 90, {self:GetOwner()})
    self:GetOwner():LagCompensation(false)

    local ent = trace.Entity
    if IsValid(ent) and ent.onStunStickUsed then
        ent:onStunStickUsed(self:GetOwner())
        return
    elseif IsValid(ent) and ent:GetClass() == "func_breakable_surf" then
        ent:Fire("Shatter")
        self:GetOwner():EmitSound(self.Hit[math.random(#self.Hit)])
        return
    end

    self.WaitingForAttackEffect = true

    local ent = self:GetOwner():getEyeSightHitEntity(
        self.stickRange,
        15,
        fn.FAnd{
            fp{fn.Neq, self:GetOwner()},
            fc{IsValid, entMeta.GetPhysicsObject},
            entMeta.IsSolid
        }
    )

    if not IsValid(ent) then return end
    if ent:IsPlayer() and not ent:Alive() then return end

    if not ent:isDoor() then
        ent:SetVelocity((ent:GetPos() - self:GetOwner():GetPos()) * 7)
    end
	
    if dmg > 0 then
        ent:TakeDamage(dmg, self:GetOwner(), self)
    end

    if ent:IsPlayer() or ent:IsNPC() or ent:IsVehicle() then
        self:DoFlash(ent)
        self:GetOwner():EmitSound(self.FleshHit[math.random(#self.FleshHit)])
--------------------------------------------------------------------
--FREEZE EFFECT
	if not ent:IsFrozen() then --if ent is not frozen
	ent:Freeze(true) --set frozen to 1
	ent:SetMoveType(MOVETYPE_NONE) --stop movement
	IcefuseAdmin.Chat.SendToPlayer(self:GetOwner(), "Froze " .. ent:Name() .. ".") --chat to gun holder
	IcefuseAdmin.Chat.SendToPlayer(ent, self:GetOwner():Name() .. " has frozen you.") --chat to entet
	self:GetOwner():EmitSound( "buttons/blip1.wav",75, 100, 1, CHAN_AUTO ) --sound
	
	else
	ent:Freeze(false)
	ent:SetMoveType(MOVETYPE_WALK)
	IcefuseAdmin.Chat.SendToPlayer(self:GetOwner(), "Unfroze " .. ent:Name() .. ".") --chat to gun holder
	IcefuseAdmin.Chat.SendToPlayer(ent, self:GetOwner():Name() .. " has unfrozen you.") --chat to entet
	self:GetOwner():EmitSound( "buttons/blip1.wav",75, 100, 1, CHAN_AUTO ) --sound
	end
--------------------------------------------------------------------
    else
        self:GetOwner():EmitSound(self.Hit[math.random(#self.Hit)])
    end
end

function SWEP:Kick(dmg)
    if CLIENT then return end

    self:GetOwner():LagCompensation(true)
    local trace = util.QuickTrace(self:GetOwner():EyePos(), self:GetOwner():GetAimVector() * 90, {self:GetOwner()})
    self:GetOwner():LagCompensation(false)

    local ent = trace.Entity
    if IsValid(ent) and ent.onStunStickUsed then
        ent:onStunStickUsed(self:GetOwner())
        return
    elseif IsValid(ent) and ent:GetClass() == "func_breakable_surf" then
        ent:Fire("Shatter")
        self:GetOwner():EmitSound(self.Hit[math.random(#self.Hit)])
        return
    end

    self.WaitingForAttackEffect = true

    local ent = self:GetOwner():getEyeSightHitEntity(
        self.stickRange,
        15,
        fn.FAnd{
            fp{fn.Neq, self:GetOwner()},
            fc{IsValid, entMeta.GetPhysicsObject},
            entMeta.IsSolid
        }
    )

    if not IsValid(ent) then return end
    if ent:IsPlayer() and not ent:Alive() then return end

    if not ent:isDoor() then
        ent:SetVelocity((ent:GetPos() - self:GetOwner():GetPos()) * 7)
    end

	-- [WIP] - try again later.
     -- if ent:isDoor() then
		-- local ent = ent:GetOwner()
    -- end
	
    if dmg > 0 then
        ent:TakeDamage(dmg, self:GetOwner(), self)
    end

    if ent:IsPlayer() or ent:IsNPC() or ent:IsVehicle() then
        self:DoFlash(ent)
        self:GetOwner():EmitSound(self.FleshHit[math.random(#self.FleshHit)])
--		self:GetOwner():ConCommand("say /me vaporizes the player (kicked)!") --this is the admin player saying/doing something locally, WORKS.
--		ent:ChatPrint( self:GetOwner():Nick() .. " (" .. self:GetOwner():SteamID() .. ") kicked you from the server." ) --this is the target player recieving a message about who kicked them.
		IcefuseAdmin.Chat.Broadcast( self:GetOwner():Nick() .. " kicked " .. ent:Nick() .. " (" .. ent:SteamID() .. ") from the server." ) --global chat broadcast, WORKS.
--		self:GetOwner():ConCommand("say /me completely vaporized " .. ent:Nick() .. " (kicked from the server)!") --this is the admin player saying/doing something locally, WORKS.
--		ent:Kick("Goodbye") --says 'Disconnect: Goodbye.' (punctuation is included automatically), WORKS.
--		ent:Kick( self:GetOwner():Nick() .. " (" .. self:GetOwner():SteamID() .. ") kicked you from the server." ) --says 'Disconnect: Goodbye.' (punctuation is included automatically), WORKS.
		ent:Kick("\n\n" .. self:GetOwner():Nick() .. " (" .. self:GetOwner():SteamID() .. ") kicked you from the server. You haved been disconnected" ) --(punctuation is included automatically), WORKS.
--      ent:ConCommand("say /rules") --this is the target player, forces the rules to appear on screen for the player.

    else
        self:GetOwner():EmitSound(self.Hit[math.random(#self.Hit)])
    end
end

function SWEP:PrimaryAttack()
    BaseClass.PrimaryAttack(self)
    self:SetNextSecondaryFire(self:GetNextPrimaryFire())
    self:Freeze(0) --self:Freeze(10) --damage modifier
end

function SWEP:SecondaryAttack()
    BaseClass.PrimaryAttack(self)
    self:SetNextSecondaryFire(self:GetNextPrimaryFire())
    self:Kick(0)
end

function SWEP:Reload()
    self:SetHoldType("melee")
    self:SetHoldTypeChangeTime(CurTime() + 0.1)

    if self:GetLastReload() + 0.1 > CurTime() then self:SetLastReload(CurTime()) return end
    self:SetLastReload(CurTime())
    self:EmitSound("weapons/stunstick/spark" .. math.random(1, 3) .. ".wav")
end
