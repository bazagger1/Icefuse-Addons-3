--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_darkrpmodification/lua/darkrp_modules/laws_hud_v3/cl_lawshud.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local ICEFUSE_LAWS_CONVAR = CreateClientConVar( "icefuse_laws_hud", "1", true, false )

local lawTab = {}
local lawPanel = {}

local height = 0
local actualHeight = 0

local lawFrame	= nil
local lawList 	= nil

local function addNewLaw( index, str )
	
	if ( !IsValid( lawFrame ) ) then return end
	
	--
	
	surface.SetFont( "Default" )
	local indexWidth = select( 1, surface.GetTextSize( index .. "." ) ) + 6
	
	local lawParsed = markup.Parse( "<font=Default>" .. str .. "</font>", lawFrame:GetWide() - 19 )
	local heightComp = ( lawParsed:GetHeight() + 5 + 2 )
	
	lawFrame:SetTall( lawFrame:GetTall() + heightComp )
	
	//height = height + ( heightComp )
	//actualHeight = actualHeight + ( heightComp )
	
	//if ( height > ( lawList:GetTall() ) ) then
		
		//lawFrame:SetTall( height )
		//height = lawList:GetTall()
	//end
	
	local pan = vgui.Create( "DPanel" )
	pan:SetSize( lawFrame:GetWide(), lawParsed:GetHeight() + 5 )
	pan:SetDrawBackground( true )
	
	pan.m_Index = index
	pan.m_IndexWidth = indexWidth
	
	pan.Paint = function( self, w, h )
		
		draw.SimpleText( self.m_Index .. ".", "Default", 2, 0, color_white )
		lawParsed:Draw( self.m_IndexWidth, 0, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
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
	
	if ( !IsValid( lawFrame ) || !IsValid( lawPanel[ index ] ) ) then return end
	
	--
	
	local panelHeight = lawPanel[ index ]:GetTall()
	lawPanel[ index ]:Close()
	
	local newHeight = lawFrame:GetTall() - panelHeight - 2
	lawFrame:SetTall( newHeight )
	
	// Decrement the actual height
	//actualHeight = actualHeight - panelHeight - 2
	
	//if ( actualHeight < height ) then
		
		//lawFrame:SetTall( actualHeight )
		//height = actualHeight
	//end
end

local function removeAllLaws()
	
	if ( !IsValid( lawFrame ) ) then return end
	
	--
	
	lawList:Clear()
	
	// Reset heights
	height = 22
	
	--
	
	// Reset to the default DarkRP laws
	local lawTab = table.Copy( DarkRP.getLaws() )
	
	--
	
	for k = 1, #lawTab do
		
		local v = lawTab[ k ]
		addNewLaw( k, v )
	end
end

local function createLawHUD()
	if ( lawFrame ) then
	
		lawFrame:Remove()
		lawFrame = nil
	end
	
	height = 22
	
	lawFrame = vgui.Create( "DPanel" )
	lawFrame:SetPos( ScrW() + 200, 50 )
	lawFrame:MoveTo( ScrW() - 2 - 225, 50, 0.2, 0, -1 )
	lawFrame:SetSize( 225, 22 )
	lawFrame.Paint = function( self, w, h )
		
		draw.RoundedBox( 2, 0, 0, w, h + 20, Color( 33, 33, 33, 180 ) )
		draw.RoundedBox( 2, 0, 0, w, 20, Color( 0, 0, 0, 180 ) )
		
		draw.SimpleText( "Laws", "DermaDefaultBold", 7, 10, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
----------------------------------------------------------	
	local DermaButton = vgui.Create( "DButton", lawFrame ) // Create the button and paste it to the 'lawFrame' frame
	DermaButton:SetText( "Refresh" )					// Set the text on the button
	DermaButton:SetPos( 175, 0 )					// Set the position on the parent frame
	DermaButton:SetSize( 50, 20 )					// Set the size
	DermaButton.DoClick = function()				// A custom function run when clicked ( note the . instead of : )
	RunConsoleCommand( "icefuse_laws_hud", 0 )
	RunConsoleCommand( "icefuse_laws_hud", 1 )
end
----------------------------------------------------------
	lawFrame.CloseFrame = function( self )
	
		self:MoveTo( ScrW() + self:GetWide(), 50, 0.2, 0, -1, function()
			self:Remove()
		end )
	end
	lawFrame.PerformLayout = function( self )
	
		print("resizing law list")
		lawList:SetSize( self:GetWide() - 2, self:GetTall() - 20 )
	end
	
	lawList = vgui.Create( "DPanelList", lawFrame )
	lawList:SetSpacing( 2 )
	lawList:EnableHorizontal( false )
	lawList:EnableVerticalScrollbar( false )
	lawList:SetPos( 0, 22 )
	lawList:SetSize( lawFrame:GetWide() - 2, lawFrame:GetTall() - 26 )
	
	function lawList.VBar:Paint( w, h ) end
	function lawList.VBar.btnUp:Paint( w, h ) end
	function lawList.VBar.btnDown:Paint( w, h ) end
	
	function lawList.VBar.btnGrip:Paint( w, h )
		draw.RoundedBox( 2, 4, 0, w - 8, h, Color( 133, 133, 133, 255 ) )
	end
	
	lawList.pnlCanvas.GetWide = function()
		return lawList:GetWide()
	end
	
	removeAllLaws()
end

--

hook.Add( "addLaw", "ICE_ADD_LAW", function( index, str )
	
	addNewLaw( index, str )
end )

hook.Add( "removeLaw", "ICE_REMOVE_LAW", function( index )
	
	local maxIndex = #lawPanel
	
	-- Remove the law
	removeLaw( index )
	
	for i = index + 1, maxIndex do
		
		local newIndex = i - 1
		
		local pan = lawPanel[ i ]
		pan.m_Index = newIndex
		
		surface.SetFont( "Default" )
		pan.m_IndexWidth = select( 1, surface.GetTextSize( newIndex .. "." ) ) + 6
		
		lawPanel[ newIndex ] = pan
	end
	
	lawPanel[ maxIndex ] = nil
end )


hook.Add( "resetLaws", "ICE_RESET_LAWS", removeAllLaws )


hook.Add( "OnPlayerChat", "ICE_OPC_LAWS", function( ply, text )

	if ( ply == LocalPlayer() ) then
		
		if ( string.lower( text ) == "/laws" ) then
		
			if ( ( ICEFUSE_LAWS_CONVAR:GetInt() >= 1 ) && IsValid( lawFrame ) ) then
				// Show the laws HUD
				RunConsoleCommand( "icefuse_laws_hud", 0 )
			else
				// Hide the laws HUD
				RunConsoleCommand( "icefuse_laws_hud", 1 )
			end
		elseif ( string.lower( text ) == "/pcon" ) then
			RunConsoleCommand( "police_menu" )
		elseif ( string.lower( text ) == "/mcon" ) then
			RunConsoleCommand( "president_menu" )
		end
		
		return true
	end
end )

hook.Add( "InitPostEntity", "ICE_IPE_LAWSHUD", function()
	
	timer.Simple( 0, function()
		
		if ( ICEFUSE_LAWS_CONVAR:GetInt() >= 1 ) then
			createLawHUD()
		end
	end )
end )

cvars.AddChangeCallback( "icefuse_laws_hud", function( convar_name, old_val, new_val )

	if ( tonumber( new_val ) >= 1 ) then
		
		createLawHUD()
	else
			
		if ( IsValid( lawFrame ) ) then
			lawFrame:CloseFrame()
		end
	end
end )


if ( !IcefuseHUD ) then
	IcefuseHUD = {}
end

function IcefuseHUD.toggleLawsHUD()

	if ( ( ICEFUSE_LAWS_CONVAR:GetInt() >= 1 ) && IsValid( lawFrame ) ) then
		// Show the laws HUD
		RunConsoleCommand( "icefuse_laws_hud", 0 )
	else
		// Hide the laws HUD
		RunConsoleCommand( "icefuse_laws_hud", 1 )
	end
end

local refresh = {}
function refresh:timer( event )
    print( "refresh called" )
		if ( ( ICEFUSE_LAWS_CONVAR:GetInt() >= 1 ) && IsValid( lawFrame ) ) then
		// Show the laws HUD
		RunConsoleCommand( "icefuse_laws_hud", 0 )
	else
		// Hide the laws HUD
		RunConsoleCommand( "icefuse_laws_hud", 1 )
	end
end
--timer.performWithDelay( 15000, refresh )