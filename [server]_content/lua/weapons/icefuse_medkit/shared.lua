--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_content/lua/weapons/icefuse_medkit/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

--[[
████████████████████████████████████████████████████████████████████████████████████
If you are reading this, you have successfully used client side lua theft. 
████████████████████████████████████████████████████████████████████████████████████

░░░░░░░░░░░░░░░░░░░░░░█████████
░░███████░░░░░░░░░░███▒▒▒▒▒▒▒▒███
░░█▒▒▒▒▒▒█░░░░░░░███▒▒▒▒▒▒▒▒▒▒▒▒▒███
░░░█▒▒▒▒▒▒█░░░░██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██
░░░░█▒▒▒▒▒█░░░██▒▒▒▒▒██▒▒▒▒▒▒██▒▒▒▒▒███
░░░░░█▒▒▒█░░░█▒▒▒▒▒▒████▒▒▒▒████▒▒▒▒▒▒██
░░░█████████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██
░░░█▒▒▒▒▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒▒██
░██▒▒▒▒▒▒▒▒▒▒▒▒▒█▒▒▒██▒▒▒▒▒▒▒▒▒▒██▒▒▒▒██
██▒▒▒███████████▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒▒██
█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▒▒▒▒▒▒████████▒▒▒▒▒▒▒██
██▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██
░█▒▒▒███████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██
░██▒▒▒▒▒▒▒▒▒▒████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█
░░████████████░░░█████████████████


But seroiusly, please respect me and my server by not stealing my hard work.
I understand you have dreams of being the next big server owner, But become that
with your own work. Not mine. Thank you for respecting my wishes, 

yours truly: Corvezeo C.E.O of Icefuse Networks

http://steamcommunity.com/id/Corvezeo/
--]]



if SERVER then
    AddCSLuaFile("shared.lua")
end

local HealthPerSecond = 0.02; // % of max hp

SWEP.PrintName = "Icefuse Medkit"
SWEP.Author = "Icefuse"
SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.Description = "Heals the wounded."
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.Instructions = "Left click to heal someone\nRight click to heal yourself"
SWEP.IsDarkRPMedKit = true

SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.Category = "Icefuse Utilities"

SWEP.ViewModel = "models/weapons/c_medkit.mdl"
SWEP.WorldModel = "models/weapons/w_medkit.mdl"
SWEP.UseHands = true

SWEP.Primary.Recoil = 0
SWEP.Primary.ClipSize  = -1
SWEP.Primary.DefaultClip = 1
SWEP.Primary.Automatic  = true
SWEP.Primary.Delay = 0.1
SWEP.Primary.Ammo = "none"

SWEP.Secondary.Recoil = 0
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Delay = 0.3
SWEP.Secondary.Ammo = "none"

function SWEP:PrimaryAttack()
    self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)

    local found
    local lastDot = -1 -- the opposite of what you're looking at
    self:GetOwner():LagCompensation(true)
    local aimVec = self:GetOwner():GetAimVector()

    for k,v in pairs(player.GetAll()) do
        local maxHealth = v:GetMaxHealth() || 100 // camelCase!!!!!!!!!!!!!!!!
        if v == self:GetOwner() or v:GetShootPos():Distance(self:GetOwner():GetShootPos()) > 85 or v:Health() >= maxHealth || !v:Alive() then continue end

        local direction = v:GetShootPos() - self:GetOwner():GetShootPos()
        direction:Normalize()
        local dot = direction:Dot(aimVec)

        -- Looking more in the direction of this player
        if dot > lastDot then
            lastDot = dot
            found = v
        end
    end
    self:GetOwner():LagCompensation(false)

    if found then
      local foundMaxHp = found:GetMaxHealth() || 100;

      local newHp = math.min(foundMaxHp, found:Health() + foundMaxHp * HealthPerSecond);

      found:SetHealth(newHp);
      self:EmitSound("hl1/fvox/boop.wav", 150, found:Health() / foundMaxHp * 100, 1, CHAN_AUTO);
    end
end

function SWEP:SecondaryAttack()
    self:SetNextSecondaryFire(CurTime() + self.Secondary.Delay)
    local ply = self:GetOwner()
    local maxHealth = self:GetOwner():GetMaxHealth() or 100
    if ply:Health() < maxHealth then

      local newHp = math.min(maxHealth, ply:Health() + maxHealth * HealthPerSecond);

        ply:SetHealth(newHp);
        self:EmitSound("hl1/fvox/boop.wav", 150, ply:Health() / maxHealth * 100, 1, CHAN_AUTO)
    end
end