--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_content/lua/weapons/icefuse_pickpocket.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

SWEP.PrintName = "Pickpocket"
SWEP.Category = "Icefuse Utilities"
SWEP.Purpose = "Stealing money or weapons from other players"
SWEP.Instructions = "Primary attack: steal active weapon\nSecondary attack: steal money\nMash mouse1 while pickpocketing: speed up pickpocket"

SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = "models/weapons/v_hands.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"

SWEP.Primary.Clipsize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.Clipsize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.Slot               = 1
SWEP.SlotPos 			= 10
SWEP.DrawAmmo           = false
SWEP.DrawCrosshair      = false

-- Configuration
SWEP.PickpocketDuration = 20 -- Time it takes to successfully pickpocket a player
SWEP.PickpocketDistance = 75 -- How close the player has to stand to the other player to successfully pickpocket
SWEP.PickpocketFailureChance = 0.2 -- How often should a pickpocket "fail" at random?
SWEP.AllowPickpocketSpeedup = true -- Should the pickpocket speed up if the player mashes mouse1?
SWEP.SpeedUpIncrement = 0.1 -- How much time to take away from the timer if the player is mashing.
SWEP.AllowWeaponPickpocket = false -- Should we let the player pickpocket weapons?
SWEP.BannedWeapons = {"keys", 
"pocket", 
"gmod_tool", 
"gmod_camera", 
"weapon_keypadchecker",
"weapon_fists",
"weapon_physgun",
"weapon_physcannon",
"weapon_arc_atmcard",
"weapon_angryhobo", 
"weapon_keypadchecker", 
"arrest_stick", 
"door_ram", 
"darkrp_handcuffs", 
"knockout", 
"icefuse_lockpick", 
"icefuse_master_lockpick", 
"police_badge", 
"stunstick",
"unarrest_stick", 
"weaponchecker", 
"weapon_hack_phone", 
"realistic_hook", 
"weapon_fishing_rod", 
"weapon_gascan_limited", 
"weapon_gascan", 
"itemstore_pickup", 
"manhack_welder", 
"swep_pickpocket",
"stungun", 
"wyozi_tvcamera", 
"vc_repair", 
"laserpointer", 
"remotecontroller",
"map_decorator"
} 
SWEP.AllowMoneyPickpocket = true -- Should we let the player pickpocket money?
SWEP.PickpocketReward = 1500 -- Amount of money stolen when pickpocketing money.
SWEP.AllowInventoryPickpocket = false -- Should we let the player pickpocket from inventories if ItemStore is installed?
SWEP.SoundFrequency = 1 -- How often the "rummmaging" sounds play, in seconds.
SWEP.DarkRP25 = true -- Set this to true if you are running DarkRP 2.5.0
-- End of configuration

function SWEP:SetupDataTables()
	self:NetworkVar( "Bool", 0, "Pickpocketing" )
	self:NetworkVar( "String", 0, "PickpocketMode" )
	self:NetworkVar( "Float", 0, "PickpocketTime" )
	self:NetworkVar( "Entity", 0, "PickpocketTarget" )
end

function SWEP:Initialize()
	self:SetWeaponHoldType( "normal" )
end

function SWEP:CanPickpocket( target )
	return IsValid( target ) and target:IsPlayer() and target:GetPos():Distance( self.Owner:GetPos() ) < self.PickpocketDistance
end

function SWEP:Pickpocket( target, mode )
	self:SetPickpocketing( true )
	self:SetPickpocketTime( CurTime() + self.PickpocketDuration )
	self:SetPickpocketTarget( target )
	self:SetPickpocketMode( mode )
end

function SWEP:PrimaryAttack()
	local target = self.Owner:GetEyeTrace().Entity
	
	if ( self:GetPickpocketing() ) then
		if ( self.AllowPickpocketSpeedup ) then
			self:SetPickpocketTime( self:GetPickpocketTime() - self.SpeedUpIncrement )
		end
	else
		if ( self.AllowWeaponPickpocket and self:CanPickpocket( target ) ) then
			self:Pickpocket( target, "weapon" )
		end
	end
end

function SWEP:SecondaryAttack()
	local target = self.Owner:GetEyeTrace().Entity
	
	if ( self.AllowMoneyPickpocket and not self:GetPickpocketing() and self:CanPickpocket( target ) ) then
		self:Pickpocket( target, "money" )
	end
end

function SWEP:Reload()
	if ( itemstore ) then
		local target = self.Owner:GetEyeTrace().Entity
		
		if ( self.AllowInventoryPickpocket and not self:GetPickpocketing() and self:CanPickpocket( target ) ) then
			self:Pickpocket( target, "inventory" )
		end
	end
end

if SERVER then
	AddCSLuaFile()
	
	local NextSound = 0
	function SWEP:Think()
		if ( self:GetPickpocketing() ) then
			local target = self:GetPickpocketTarget()
			
			if ( not self:CanPickpocket( target ) or self.Owner:GetEyeTrace().Entity ~= target ) then
				self:SetPickpocketing( false )
			else
				if ( NextSound < CurTime() ) then
					self.Owner:EmitSound( "physics/body/body_medium_impact_soft" .. math.random( 1, 7 ) .. ".wav" )
					NextSound = CurTime() + self.SoundFrequency
				end
				
				if ( self:GetPickpocketTime() < CurTime() ) then
					self:SetPickpocketing( false )
					
					if ( math.Rand( 0, 1 ) > self.PickpocketFailureChance ) then
						if ( self:GetPickpocketMode() == "money" ) then
							local money = math.Clamp( target:getDarkRPVar( "money" ), 0, self.PickpocketReward )
							
							if ( self.DarkRP25 ) then
								target:addMoney( -money )
								self.Owner:addMoney( money )
							else
								target:AddMoney( -money )
								self.Owner:AddMoney( money )
							end
							
							self.Owner:PrintMessage( HUD_PRINTTALK, "Stole $" .. tostring( money ) .. "." )
						elseif ( self:GetPickpocketMode() == "weapon" ) then
							local wep = target:GetActiveWeapon()
							
							if ( IsValid( wep ) ) then
								local class = wep:GetClass()
								
								if ( not table.HasValue( self.BannedWeapons, class ) ) then
									self.Owner:Give( class )
									target:StripWeapon(	class )
									
									self.Owner:PrintMessage( HUD_PRINTTALK, "Stole a " .. class .. "." )
								else
									self.Owner:PrintMessage( HUD_PRINTTALK, "Could not steal from the player." )
								end
							else
								self.Owner:PrintMessage( HUD_PRINTTALK, "Could not steal from the player, they weren't holding anything!" )
							end
						elseif ( self:GetPickpocketMode() == "inventory" ) then
							local inv = target:GetInventory()
							local slots = {}
							
							for slot, item in pairs( inv.Items ) do
								if ( item ) then
									table.insert( slots, slot )
								end
							end
							
							local slot = table.Random( slots )
							
							if ( slot ) then
								local item = target:GetInventory():GetItem( slot )
								
								self.Owner:AddItem( item )
								target:SetItem( nil, slot )
								
								self.Owner:PrintMessage( HUD_PRINTTALK, "Stole a " .. item:GetName() .. "." )
							else
								self.Owner:PrintMessage( HUD_PRINTTALK, "Couldn't steal anything, there are no items in their inventory!" )
							end
						end
					else
						self.Owner:PrintMessage( HUD_PRINTTALK, "Pickpocket failed!" )
					end
				end
			end
		end
	end
	
	function SWEP:Holster()
		self:SetPickpocketing( false )
		return true
	end
else
	local gradientup = Material( "gui/gradient_up" )
	local gradientdown = Material( "gui/gradient_down" )
	
	function SWEP:DrawProgressBar( label, colour, filled )
		filled = math.Clamp( filled, 0, 1 )
		local w, h = 300, 20
		local centerx, centery = ScrW() / 2, ScrH() / 2
		local x, y = centerx - w / 2, centery - h / 2
		
		surface.SetDrawColor( Color( 255, 255, 255 ) ) 
		surface.DrawOutlinedRect( x, y, w, h )
		
		surface.SetDrawColor( colour )
		surface.SetMaterial( gradientdown )
		surface.DrawTexturedRect( x + 2, y + 2, ( w - 4 ) * filled, h - 4 )
		
		surface.SetDrawColor( Color( colour.r / 2, colour.g / 2, colour.b/ 2 ) )
		surface.SetMaterial( gradientup )
		surface.DrawTexturedRect( x + 2, y + 2, ( w - 4 ) * filled, h - 4 )
		
		draw.SimpleTextOutlined( label, "DermaDefaultBold", centerx, centery - 1, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
	end
	
	function SWEP:DrawHUD()
		if ( self:GetPickpocketing() ) then
			local text, colour
			
			if ( self:GetPickpocketMode() == "weapon" ) then
				text = "Pickpocketing weapon..."
				colour = Color( 255, 0, 0 )
			elseif ( self:GetPickpocketMode() == "money" ) then
				text = "Pickpocketing money..."
				colour = Color( 0, 255, 0 )
			elseif ( self:GetPickpocketMode() == "inventory" ) then
				text = "Pickpocketing from inventory..."
				colour = Color( 0, 0, 255 )
			end
			
			self:DrawProgressBar( text, colour, ( self:GetPickpocketTime() - CurTime() ) / self.PickpocketDuration )
		end
	end
end