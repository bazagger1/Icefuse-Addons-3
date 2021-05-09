--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_darkrpmodification/lua/darkrp_modules/mayor_menu/cl_mayormenu.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

// Blur material
local blurMat = Material( "pp/blurscreen" )

surface.CreateFont( "MayorMenuFont",
	{
		font      = "Roboto",
		size      = 22,
		weight    = 100,
		underline = 1
	}
)
surface.CreateFont( "MayorMenuFontSmall",
	{
		font      = "Default",
		size      = 12,
		weight    = 100,
		underline = 1
	}
)

local lawList = nil
local mayorMenu = nil

local lawPanel = {}

local function lawsSubMenu()

	local menu = DermaMenu()
	menu:AddOption( "Add Law", function()
	
		local frame = Derma_StringRequest( "Add law", "Type in the new law you would like to add:", nil, function( a )
		RunConsoleCommand( "say", "/addlaw " .. a ) end, function() end )
		
		frame.Paint = function( self, w, h )
			Derma_DrawBackgroundBlur( self, self.startTime )
			draw.RoundedBox( 4, 0, 0, w, h, Color( 133, 133, 133, 100 ) )
		end
		
	end ):SetIcon( "icon16/pencil_add.png" )
	menu:AddOption( "Reset Laws", function()
		RunConsoleCommand( "say", "/resetlaws" )
	end ):SetIcon( "icon16/arrow_refresh.png" )
	
	menu:Open()
end

local function addNewLaw( index, str )
	
	if ( !IsValid( mayorMenu ) ) then return end
	
	--
	
	surface.SetFont( "DermaDefaultBold" )
	local indexWidth = select( 1, surface.GetTextSize( index .. "." ) ) + 10
	
	local lawParsed = markup.Parse( "<font=DermaDefaultBold>" .. str .. "</font>", lawList:GetWide() - 20 )
	
	local pan = vgui.Create( "DImageButton" )
	pan:SetSize( lawList:GetWide(), lawParsed:GetHeight() + 10 )
	
	pan.m_Index = index
	pan.m_IndexWidth = indexWidth
	
	
	pan.Paint = function( self, w, h )
		
		if ( self:IsHovered() || self.m_MenuHovered ) then
			draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 255, 255, 20 ) )
		else
			draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 175 ) )
		end
		
		draw.SimpleText( self.m_Index .. ".", "DermaDefaultBold", 5, h/2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		lawParsed:Draw( self.m_IndexWidth, h/2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	
	
	pan.DoClick = function( self )
	
		local menu = DermaMenu()
		menu:AddOption( "Remove Law", function()
			RunConsoleCommand( "say", "/removelaw " .. self.m_Index )
		end ):SetIcon( "icon16/pencil_delete.png" )
		menu:AddOption( "Add Law", function()
	
			local frame = Derma_StringRequest( "Add law", "Type in the new law you would like to add:", nil, function( a )
			RunConsoleCommand( "say", "/addlaw " .. a ) end, function() end )
			
			frame.Paint = function( self, w, h )
				Derma_DrawBackgroundBlur( self, self.startTime )
				draw.RoundedBox( 4, 0, 0, w, h, Color( 133, 133, 133, 100 ) )
			end
		end ):SetIcon( "icon16/pencil_add.png" )
		menu:AddOption( "Reset Laws", function()
			RunConsoleCommand( "say", "/resetlaws" )
		end ):SetIcon( "icon16/arrow_refresh.png" )
		
		
		menu:Open()
		
		menu.OnRemove = function( menu_self )

			self.m_MenuHovered = false
		end
		
		self.m_MenuHovered = true
	end
	
	pan.Close = function( self )
		self:Remove()
	end
	
	lawPanel[ index ] = pan
	lawList:AddItem( pan )
	
	if ( lawList.VBar != nil && lawList.VBar:IsVisible() ) then
		
		lawList.VBar:SetScroll( lawList.VBar:GetScroll() )
	end
end

local function removeLaw( index )
	
	if ( !IsValid( mayorMenu ) || !IsValid( lawPanel[ index ] ) ) then return end
	lawPanel[ index ]:Close()
end


local function removeAllLaws()
	
	if ( !IsValid( mayorMenu ) ) then return end
	
	--
	
	lawList:Clear()
	
	--
	
	// Reset to the default DarkRP laws
	local lawTab = table.Copy( DarkRP.getLaws() )
	
	--
	
	for k = 1, #lawTab do
		
		local v = lawTab[ k ]
		addNewLaw( k, v )
	end
end

hook.Add( "addLaw", "ICE_ADD_LAW_2", function( index, str )
	
	addNewLaw( index, str )
end )

hook.Add( "removeLaw", "ICE_REMOVE_LAW_2", function( index )
	
	if ( !IsValid( mayorMenu ) ) then return end
	
	--
	
	local maxIndex = #lawPanel
	
	-- Remove the law
	removeLaw( index )
	
	for i = index + 1, maxIndex do
		
		local newIndex = i - 1
		
		local pan = lawPanel[ i ]
		pan.m_Index = newIndex
		
		surface.SetFont( "Default" )
		pan.m_IndexWidth = select( 1, surface.GetTextSize( index .. "." ) ) + 10
		
		lawPanel[ newIndex ] = pan
	end
	
	lawPanel[ maxIndex ] = nil
end )


hook.Add( "resetLaws", "ICE_RESET_LAWS_2", removeAllLaws )


concommand.Add( "president_menu", function( p, c, a )

	if ( !IsValid( p ) || !p:isMayor() ) then return end
	
	--
	
	mayorMenu = vgui.Create( "DFrame" )
	mayorMenu:SetTitle( "President Menu" )
	mayorMenu:ShowCloseButton( false )
	mayorMenu:SetSize( 350, 350 )
	mayorMenu:Center()
	mayorMenu:MakePopup()
	
	mayorMenu.OnRemove = function()
		lawPanel = {}
	end
	
	local exitB = vgui.Create( "DImageButton", mayorMenu )
	exitB:SetIcon( "icon16/cancel.png" )
	exitB:SetPos( mayorMenu:GetWide() - 18, 11 - 8 )
	exitB:SizeToContents()
	exitB.DoClick = function()
		mayorMenu:Close()
	end
	
	local policeB = vgui.Create( "DImageButton", mayorMenu )
	policeB:SetIcon( "icon16/wrench.png" )
	policeB:SetPos( mayorMenu:GetWide() - 18 - 20, 11 - 8 )
	policeB:SizeToContents()
	policeB.DoClick = function()
		mayorMenu:Close()
		RunConsoleCommand( "police_menu" )
	end
	
	mayorMenu.OnRemove = function()
		lawPanel = {}
	end
	
	mayorMenu.Paint = function( self, w, h )
		
		// Background
		local x, y = self:LocalToScreen( 0, 0 )
		
		surface.SetMaterial( blurMat )	
		surface.SetDrawColor( 255, 255, 255, 255 )
		
		blurMat:SetFloat( "$blur", 1.5 )
		blurMat:Recompute()
		
		for i = 0, 4 do
			render.UpdateScreenEffectTexture()
			surface.DrawTexturedRect( -x, -y, ScrW(), ScrH() )
		end
		
		draw.RoundedBox( 2, 0, 0, w, 22, Color( 0, 0, 0, 200 ) )
		draw.RoundedBox( 2, 0, 0, w, h, Color( 0, 0, 0, 150 ) )
	end

	local lockdownB = vgui.Create( "DButton", mayorMenu )
	lockdownB:Dock( BOTTOM )
	lockdownB:SetHeight( 30 )
	lockdownB:SetContentAlignment( 5 )
	lockdownB:SetFont( "MayorMenuFont" )
	lockdownB:SetText( "Lockdown" )
	lockdownB:SetTextColor( Color( 0, 0, 0, 255 ) )
	lockdownB.DoClick = function( self )

		local menu = DermaMenu()
		menu:AddOption( "Initiate lockdown", function()
			RunConsoleCommand( "say", "/lockdown" )
		end ):SetIcon( "icon16/lock.png" )
		menu:AddOption( "End lockdown", function()
			RunConsoleCommand( "say", "/unlockdown" )
		end ):SetIcon( "icon16/lock_delete.png" )
		
		menu:Open()
	end
	lockdownB.Paint = function( self, w, h )

		if ( !self:IsHovered() ) then
			draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ) )
		else
			draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 255, 255, 200 ) )
		end
	end
	lockdownB.OnCursorEntered = function( self )
		self:SetTextColor( Color( 0, 0, 255, 255 ) )
	end
	lockdownB.OnCursorExited = function( self )
		self:SetTextColor( Color( 0, 0, 0, 255 ) )
	end

	local demotePoB = vgui.Create( "DButton", mayorMenu )
	demotePoB:Dock( BOTTOM )
	demotePoB:DockMargin( 0, 0, 0, 2 )
	demotePoB:SetHeight( 30 )
	demotePoB:SetContentAlignment( 5 )
	demotePoB:SetFont( "MayorMenuFont" )
	demotePoB:SetText( "Demote Police" )
	demotePoB:SetTextColor( Color( 0, 0, 0, 255 ) )
	demotePoB.DoClick = function( self )

		local menu = DermaMenu()
		
		for k, v in pairs( player.GetAll() ) do
			
			// Don't allow the demotion of yourself
			if ( v == LocalPlayer() ) then continue end
			
			--
			
			if ( v:isCP() ) then
			
				menu:AddOption( v:Nick(), function()
					RunConsoleCommand( "icefuse_mayor_demote", v:SteamID64() )
				end ):SetIcon( "icon16/user_suit.png" )
			end
		end
		
		menu:Open()
	end
	demotePoB.Paint = function( self, w, h )
		if ( !self:IsHovered() ) then
			draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ) )
		else
			draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 255, 255, 200 ) )
		end
	end
	demotePoB.OnCursorEntered = function( self )
		self:SetTextColor( Color( 0, 0, 255, 255 ) )
	end
	demotePoB.OnCursorExited = function( self )
		self:SetTextColor( Color( 0, 0, 0, 255 ) )
	end

	surface.SetFont( "DermaLarge" )
	local height = select( 2, surface.GetTextSize( "Laws" ) )

	local lawsTitle = vgui.Create( "DImageButton", mayorMenu )
	lawsTitle:SetSize( mayorMenu:GetWide(), height )
	lawsTitle:SetPos( 0, 25 )
	lawsTitle:SetDrawBackground( true )
	lawsTitle.Paint = function( self, w, h )
		
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 230 ) )
		draw.SimpleText( "Laws", "DermaLarge", 5, h/2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	lawsTitle.DoClick = lawsSubMenu

	lawList = vgui.Create( "DPanelList", mayorMenu )
	lawList:SetSpacing( 0 )
	lawList:EnableHorizontal( false )
	lawList:EnableVerticalScrollbar( false )
	lawList:SetPos( 0, 25 + height )
	lawList:SetSize( mayorMenu:GetWide(), mayorMenu:GetTall() - 100 - height )
	function lawList.VBar:Paint( w, h ) end
	function lawList.VBar.btnUp:Paint( w, h ) end
	function lawList.VBar.btnDown:Paint( w, h ) end

	function lawList.VBar.btnGrip:Paint( w, h )
		draw.RoundedBox( 2, 4, 0, w - 8, h, Color( 255, 255, 255, 255 ) )
	end
	
	lawList.OnMousePressed = lawsSubMenu
	
	timer.Simple( 0, removeAllLaws )
end )