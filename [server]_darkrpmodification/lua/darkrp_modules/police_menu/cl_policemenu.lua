--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_darkrpmodification/lua/darkrp_modules/police_menu/cl_policemenu.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

// Blur material
local blurMat = Material( "pp/blurscreen" )

surface.CreateFont( "PoliceMenuFont",
	{
		font      = "Roboto",
		size      = 28,
		weight    = 100,
		underline = 1
	}
)

surface.CreateFont( "PoliceMenuFont2",
	{
		font      = "Roboto",
		size      = 18,
		weight    = 800,
		underline = 1,
		shadow 	  = true,
	}
)

local arrPan = {}
local wantedPan = {}
local warrPan = {}

local policeMenu = nil

local arrestList = nil
local warrList = nil
local wantedList = nil

local arrestHeight
local wantedHeight
local warrHeight


local function addWantedPan( ply )
	
	local wantedParsed = markup.Parse( "<font=DermaDefaultBold>" .. ply:Nick() .. "\n" .. ply:getDarkRPVar( "job" ) .. "</font>", wantedList:GetWide() - 20 )
	
	local pan = vgui.Create( "DImageButton" )
	
	pan.m_Ply = ply
	pan.m_Job = ply:Team()
	
	local col = team.GetColor( ply:Team() )
	pan.m_Col = Color( col.r, col.g, col.b, 175 )
	
	pan:SetSize( wantedList:GetWide(), wantedParsed:GetHeight() + 5 )
	pan.Paint = function( self, w, h )
		
		if ( self:IsHovered() || self.hovered ) then
			draw.RoundedBox( 0, 0, 0, w, h, Color( self.m_Col.r, self.m_Col.g, self.m_Col.b, 100 ) )
		else
			draw.RoundedBox( 0, 0, 0, w, h, self.m_Col )
		end
		
		wantedParsed:Draw( 5, h/2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	pan.DoClick = function( self )
		
		self.hovered = true
		
		local menu = DermaMenu()
		menu:AddOption( "Unwant", function()
		
			if ( IsValid( self.m_Ply ) ) then
				RunConsoleCommand( "say", "/unwanted " .. tostring( self.m_Ply:UserID() ) )
			end
		end ):SetIcon( "icon16/flag_green.png" )
		
		menu:Open()
		menu.OnRemove = function() self.hovered = false end
	end
	
	pan.m_expireTime = CurTime()
	
	pan.OnCursorEntered = function( self )
	
		self.hovered = true
		policeMenu.m_DrawPan = self
	end
	pan.OnCursorExited = function( self )
		
		self.hovered = false
		policeMenu.m_DrawPan = nil
	end
	
	pan.Think = function( self )
	
		if ( CurTime() > self.m_expireTime ) then
		
			self.m_expireTime = CurTime() + 1
			
			if ( IsValid( self.m_Ply ) ) then
			
				if ( !self.m_Ply:isWanted() ) then
					
					wantedPan[ self.m_Ply ] = nil
					if ( self.hovered ) then
						policeMenu.m_DrawPan = nil
					end
					
					self:Remove()
				end
			
				if ( ( self.m_wantedName != self.m_Ply:Nick() ) || ( self.m_Job != self.m_Ply:Team() ) || ( self.m_wantedReason != tostring(ply:getDarkRPVar("wantedReason")) ) ) then
					
					self.m_wantedName = self.m_Ply:Nick()
					self.m_wantedReason = tostring(self.m_Ply:getDarkRPVar("wantedReason"))
					
					self.m_Job = self.m_Ply:Team()
					local col = team.GetColor( self.m_Ply:Team() )
					self.m_Col = Color( col.r, col.g, col.b, 175 )
					
					wantedParsed = markup.Parse( "<font=DermaDefaultBold>" .. ply:Nick() .. "\n" .. ply:getDarkRPVar( "job" ) .. "</font>", wantedList:GetWide() - 20 )
					self:SetTall( wantedParsed:GetHeight() + 5 )
					
					self.m_InfoParsed = markup.Parse( "<font=DermaDefaultBold><color=255,255,255,255>Reason:\n" .. self.m_wantedReason .. "</color></font>", policeMenu:GetWide()/2 )
					
					wantedList:InvalidateLayout( true )
				end
			else
			
				wantedPan[ self.m_Ply ] = nil
				if ( self.hovered ) then
					policeMenu.m_DrawPan = nil
				end
				
				self:Remove()
			end
		end
	end
	
	wantedPan[ ply ] = pan
	wantedList:AddItem( pan )
	
	if ( wantedList.VBar != nil && wantedList.VBar:IsVisible() ) then
		
		wantedList.VBar:SetScroll( wantedList.VBar:GetScroll() )
	end
end


local function addWarrantPan( ply )
	
	local warrParsed = markup.Parse( "<font=DermaDefaultBold>" .. ply:Nick() .. "\n" .. ply:getDarkRPVar( "job" ) .. "</font>", warrList:GetWide() - 20 )
	
	local pan = vgui.Create( "DImageButton" )
	
	pan.m_Ply = ply
	pan.m_Job = ply:Team()
	
	local col = team.GetColor( ply:Team() )
	pan.m_Col = Color( col.r, col.g, col.b, 175 )
	
	pan:SetSize( wantedList:GetWide(), warrParsed:GetHeight() + 5 )
	
	pan.Paint = function( self, w, h )
		
		if ( self:IsHovered() || self.hovered ) then
			draw.RoundedBox( 0, 0, 0, w, h, Color( self.m_Col.r, self.m_Col.g, self.m_Col.b, 100 ) )
		else
			draw.RoundedBox( 0, 0, 0, w, h, self.m_Col )
		end
		
		warrParsed:Draw( 5, h/2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	
	pan.DoClick = function( self )
		
		self.hovered = true
		
		local menu = DermaMenu()
		menu:AddOption( "Unwarrant", function()
		
			if ( IsValid( self.m_Ply ) ) then
				RunConsoleCommand( "say", "/unwarrant " .. tostring( self.m_Ply:UserID() ) )
			end
		end ):SetIcon( "icon16/house_go.png" )
		
		menu:Open()
		menu.OnRemove = function() self.hovered = false end
	end
	
	pan.m_expireTime = CurTime()
	
	pan.OnCursorEntered = function( self )
	
		self.hovered = true
		policeMenu.m_DrawPan = self
	end
	pan.OnCursorExited = function( self )
		
		self.hovered = false
		policeMenu.m_DrawPan = nil
	end
	
	pan.Think = function( self )
	
		if ( CurTime() > self.m_expireTime ) then
		
			self.m_expireTime = CurTime() + 1
			
			if ( IsValid( self.m_Ply ) ) then
				
				if ( !self.m_Ply:getDarkRPVar( "warranted" ) ) then
					
					warrPan[ self.m_Ply ] = nil
					if ( self.hovered ) then
						policeMenu.m_DrawPan = nil
					end
					self:Remove()
				end
			
				if ( ( self.m_warrName != self.m_Ply:Nick() ) || ( self.m_Job != self.m_Ply:Team() ) || ( self.m_warrReason != tostring(ply:getDarkRPVar("warrantReason")) ) ) then
				
					self.m_warrName = self.m_Ply:Nick()
					self.m_warrReason = tostring(self.m_Ply:getDarkRPVar("warrantReason"))
					self.m_Job = self.m_Ply:Team()
					
					local col = team.GetColor( ply:Team() )
					self.m_Col = Color( col.r, col.g, col.b, 175 )
					
					warrParsed = markup.Parse( "<font=DermaDefaultBold>" .. self.m_Ply:Nick() .. "\n" .. self.m_Ply:getDarkRPVar( "job" ) .. "</font>", warrList:GetWide() - 20 )
					self:SetTall( warrParsed:GetHeight() + 5 )
					
					self.m_InfoParsed = markup.Parse( "<font=DermaDefaultBold><color=255,255,255,255>Reason:\n" .. self.m_warrReason .. "</color></font>", policeMenu:GetWide()/2 )
					
					warrList:InvalidateLayout( true )
				end
			else
			
				warrPan[ self.m_Ply ] = nil
				if ( self.hovered ) then
					policeMenu.m_DrawPan = nil
				end
				
				self:Remove()
			end
		end
	end
	
	warrPan[ ply ] = pan
	warrList:AddItem( pan )
	
	if ( warrList.VBar != nil && warrList.VBar:IsVisible() ) then
		
		warrList.VBar:SetScroll( warrList.VBar:GetScroll() )
	end
end

local function addArrestPan( ply )
	
	local arrestParsed = markup.Parse( "<font=DermaDefaultBold><color=121,214,0,255>" .. ply:Nick() .. "</color></font>", arrestList:GetWide() - 20 )
	local col = team.GetColor( ply:Team() )
	
	local pan = vgui.Create( "DImageButton" )
	
	pan.m_Ply = ply
	pan.m_Col = Color( col.r, col.g, col.b, 175 )
	
	pan:SetSize( wantedList:GetWide(), arrestParsed:GetHeight() + 5 )
	pan.Paint = function( self, w, h )
		
		if ( self:IsHovered() || self.hovered ) then
			draw.RoundedBox( 0, 0, 0, w, h, Color( self.m_Col.r, self.m_Col.g, self.m_Col.b, 100 ) )
		else
			draw.RoundedBox( 0, 0, 0, w, h, self.m_Col )
		end
		
		arrestParsed:Draw( 5, h/2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
		
	pan.m_expireTime = CurTime()
	
	pan.OnCursorEntered = function( self )
	
		self.hovered = true
		policeMenu.m_DrawPan = self
		
		self:SetCursor( "arrow" )
	end
	pan.OnCursorExited = function( self )
		
		self.hovered = false
		policeMenu.m_DrawPan = nil
		
		self:SetCursor( "none" )
	end
	
	pan.Think = function( self )
		
		if ( CurTime() > self.m_expireTime ) then
		
			self.m_expireTime = CurTime() + 1
			
			if ( IsValid( self.m_Ply ) ) then
				
				if ( !self.m_Ply:isArrested() ) then
					
					arrPan[ self.m_Ply ] = nil
					if ( self.hovered ) then
						policeMenu.m_DrawPan = nil
					end
					
					self:Remove()
				end
			
				if ( self.m_arrName != self.m_Ply:Nick() || self.m_Job != self.m_Ply:Team() ) then
				
					self.m_arrName = self.m_Ply:Nick()
					self.m_Job = self.m_Ply:Team()
					
					local col = team.GetColor( ply:Team() )
					self.m_Col = Color( col.r, col.g, col.b, 175 )
					
					arrestParsed = markup.Parse( "<font=DermaDefaultBold><color=255,255,255,255>" .. self.m_Ply:Nick() .. "</color></font>", arrestList:GetWide() - 20 )
					
					self.m_InfoParsed = markup.Parse( "<font=DermaDefaultBold><color=255,255,255,255>Job:\n" .. self.m_Ply:getDarkRPVar( "job" ) .. "</color></font>", policeMenu:GetWide() )
					
					self:SetTall( arrestParsed:GetHeight() + 5 )
					arrestList:InvalidateLayout( true )
				end
			else
			
				arrPan[ self.m_Ply ] = nil
				if ( self.hovered ) then
					policeMenu.m_DrawPan = nil
				end
				
				self:Remove()
			end
		end
	end
	
	arrPan[ ply ] = pan
	arrestList:AddItem( pan )
	
	if ( arrestList.VBar != nil && arrestList.VBar:IsVisible() ) then
		
		arrestList.VBar:SetScroll( arrestList.VBar:GetScroll() )
	end
end

local function policeMenuFunc()
	
	if ( !LocalPlayer():isCP() ) then return end
	
	--
	
	surface.SetFont( "PoliceMenuFont" )
	arrestHeight = select( 2, surface.GetTextSize( "Arrested" ) )
	wantedHeight = select( 2, surface.GetTextSize( "Wanted" ) )
	warrHeight = select( 2, surface.GetTextSize( "Warrants" ) )
		
	if ( IsValid( policeMenu ) ) then
		policeMenu:Remove()
		policeMenu = nil
	end
	
	policeMenu = vgui.Create( "DFrame" )
	policeMenu:SetTitle( "Police Menu" )
	policeMenu:ShowCloseButton( false )
	policeMenu:SetDraggable( true )
	policeMenu:SetSize( ScrH() * 0.8, ScrH() * 0.8 )
	policeMenu:Center()
	policeMenu:MakePopup()
	
	policeMenu.OnRemove = function()
	
		arrPan = {}
		wantedPan = {}
		warrPan = {}
	end
	
	policeMenu.m_DrawPan = nl

	policeMenu.PaintOver = function( self, w, h )

		if ( self.m_DrawPan != nil ) then
			
			local x, y = self:LocalCursorPos()
			local width, height = self.m_DrawPan.m_InfoParsed:GetWidth() + 5, self.m_DrawPan.m_InfoParsed:GetHeight() + 5
			
			if ( ( x + width + 20 ) > w ) then
				
				x = x - width - 30
			end
			
			draw.RoundedBox( 4, x + 20, y, width + 5, height, Color( 0, 0, 0, 240 ) )
			self.m_DrawPan.m_InfoParsed:Draw( x + 25, y + height/2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		end
	end


	policeMenu.Paint = function( self, w, h )

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

	local exitB = vgui.Create( "DImageButton", policeMenu )
	exitB:SetIcon( "icon16/cancel.png" )
	exitB:SetPos( policeMenu:GetWide() - 18, 11 - 8 )
	exitB:SizeToContents()
	exitB.DoClick = function()
		policeMenu:Close()
	end
	
	local mayorB = nil
	
	if ( LocalPlayer():isMayor() ) then
	
		mayorB = vgui.Create( "DImageButton", policeMenu )
		mayorB:SetIcon( "icon16/wrench.png" )
		mayorB:SetPos( policeMenu:GetWide() - 18 - 20, 11 - 8 )
		mayorB:SizeToContents()
		mayorB.DoClick = function()
			policeMenu:Close()
			RunConsoleCommand( "president_menu" )
		end
	end
	
	local arrestTitle = vgui.Create( "DPanel", policeMenu )
	arrestTitle:SetSize( policeMenu:GetWide(), arrestHeight )
	arrestTitle:SetPos( 0, 25 )
	arrestTitle.Paint = function( self, w, h )
			
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 245 ) )
		draw.SimpleText( "Arrested", "PoliceMenuFont", w/2, h/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local arrestListHeight = policeMenu:GetTall()/2 - 70

	arrestList = vgui.Create( "DPanelList", policeMenu )
	arrestList:SetSpacing( 0 )
	arrestList:EnableHorizontal( false )
	arrestList:EnableVerticalScrollbar( false )
	arrestList:SetPos( 0, 25 + arrestHeight )
	arrestList:SetSize( policeMenu:GetWide(), arrestListHeight )
	arrestList.Paint = function( self, w, h )end
	function arrestList.VBar:Paint( w, h ) end
	function arrestList.VBar.btnUp:Paint( w, h ) end
	function arrestList.VBar.btnDown:Paint( w, h ) end

	function arrestList.VBar.btnGrip:Paint( w, h )
		draw.RoundedBox( 2, 4, 0, w - 8, h, Color( 255, 255, 255, 255 ) )
	end
	
	local wantedTitle = vgui.Create( "DPanel", policeMenu )
	wantedTitle:SetSize( policeMenu:GetWide()/2, wantedHeight )
	wantedTitle:SetPos( 0, 25 + arrestHeight + arrestListHeight )
	wantedTitle.Paint = function( self, w, h )
			
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 245 ) )
		draw.SimpleText( "Wanted", "PoliceMenuFont", w/2, h/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	wantedList = vgui.Create( "DPanelList", policeMenu )
	wantedList:SetSpacing( 0 )
	wantedList:EnableHorizontal( false )
	wantedList:EnableVerticalScrollbar( false )
	wantedList:SetPos( 0, 25 + wantedHeight + arrestHeight + arrestListHeight )
	wantedList:SetSize( policeMenu:GetWide()/2, policeMenu:GetTall() - 45 - 25 - arrestHeight - arrestListHeight - wantedHeight - 2 )
	wantedList.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 100 ) )
	end
	function wantedList.VBar:Paint( w, h ) end
	function wantedList.VBar.btnUp:Paint( w, h ) end
	function wantedList.VBar.btnDown:Paint( w, h ) end

	function wantedList.VBar.btnGrip:Paint( w, h )
		draw.RoundedBox( 2, 4, 0, w - 8, h, Color( 255, 255, 255, 255 ) )
	end
	wantedList.m_ScanPlayers = CurTime()
	
	
	local warrTitle = vgui.Create( "DPanel", policeMenu )
	warrTitle:SetSize( policeMenu:GetWide()/2, warrHeight )
	warrTitle:SetPos( policeMenu:GetWide()/2, 25 + arrestHeight + arrestListHeight )
	warrTitle.Paint = function( self, w, h )
		
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 227 ) )
		draw.SimpleText( "Warrants", "PoliceMenuFont", w/2, h/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end


	warrList = vgui.Create( "DPanelList", policeMenu )
	warrList:SetSpacing( 0 )
	warrList:EnableHorizontal( false )
	warrList:EnableVerticalScrollbar( false )
	warrList:SetPos( policeMenu:GetWide()/2, 25 + warrHeight + arrestHeight + arrestListHeight )
	warrList:SetSize( policeMenu:GetWide()/2, wantedList:GetTall() )
	warrList.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 75 ) )
	end
	function warrList.VBar:Paint( w, h ) end
	function warrList.VBar.btnUp:Paint( w, h ) end
	function warrList.VBar.btnDown:Paint( w, h ) end

	function warrList.VBar.btnGrip:Paint( w, h )
		draw.RoundedBox( 2, 4, 0, w - 8, h, Color( 255, 255, 255, 255 ) )
	end


	local wantedB = vgui.Create( "DButton", policeMenu )
	wantedB:SetPos( 1, policeMenu:GetTall() - 45 )
	wantedB:SetSize( policeMenu:GetWide()/2 - 2, 45 - 1 )
	wantedB:SetContentAlignment( 5 )
	wantedB:SetFont( "PoliceMenuFont" )
	wantedB:SetText( "Make Wanted" )
	wantedB:SetTextColor( Color( 0, 0, 0, 255 ) )
	wantedB.DoClick = function( self )

		local menu = DermaMenu()
		for _, ply in ipairs( player.GetAll() ) do
			if ( IsValid( ply ) && !ply:isWanted() && ply != LocalPlayer() ) then
				
				menu:AddOption( ply:Nick(), function()
				
					local frame = Derma_StringRequest( "Wanted reason", "Why do you want to make " .. ply:Nick() .. " wanted?", nil, function( a )
						if ( !IsValid( ply ) ) then return end
						RunConsoleCommand( "say", "/wanted " .. tostring( ply:UserID() ) .. " " .. a ) end, function() end )
					
					frame.Paint = function( self, w, h )
						Derma_DrawBackgroundBlur( self, self.startTime )
						draw.RoundedBox( 4, 0, 0, w, h, Color( 133, 133, 133, 100 ) )
					end
					
				end ):SetIcon( "icon16/user.png" )
			end
		end
		menu:Open()
	end
	wantedB.Paint = function( self, w, h )

		if ( !self:IsHovered() ) then
			draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 255, 255, 100 ) )
		else
			draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ) )
		end
	end
	wantedB.OnCursorEntered = function( self )
		self:SetTextColor( Color( 0, 0, 255, 255 ) )
	end
	wantedB.OnCursorExited = function( self )
		self:SetTextColor( Color( 0, 0, 0, 255 ) )
	end

	local issueWarrantB = vgui.Create( "DButton", policeMenu )
	issueWarrantB:SetPos( policeMenu:GetWide()/2 + 1, policeMenu:GetTall() - 45 )
	issueWarrantB:SetSize( policeMenu:GetWide()/2 - 2, 45 - 1 )
	issueWarrantB:SetContentAlignment( 5 )
	issueWarrantB:SetFont( "PoliceMenuFont" )
	issueWarrantB:SetText( "Issue Warrant" )
	issueWarrantB:SetTextColor( Color( 0, 0, 0, 255 ) )
	issueWarrantB.DoClick = function( self )

		local menu = DermaMenu()
		for _, ply in ipairs( player.GetAll() ) do
			if ( IsValid( ply ) && !ply:getDarkRPVar( "warranted" ) && ply != LocalPlayer() ) then
				
				menu:AddOption( ply:Nick(), function()
				
					local frame = Derma_StringRequest( "Warrant reason", "Why do you want to have a warrant on " .. ply:Nick() .. "?", nil, function( a )
						if ( !IsValid( ply ) ) then return end
						RunConsoleCommand( "say", "/warrant " .. tostring( ply:UserID() ) .. " " .. a ) end, function() end )
					
					frame.Paint = function( self, w, h )
						Derma_DrawBackgroundBlur( self, self.startTime )
						draw.RoundedBox( 4, 0, 0, w, h, Color( 133, 133, 133, 100 ) )
					end
					
				end ):SetIcon( "icon16/user.png" )
			end
		end
		menu:Open()
	end
	issueWarrantB.Paint = function( self, w, h )

		if ( !self:IsHovered() ) then
			draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 255, 255, 100 ) )
		else
			draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ) )
		end
	end
	issueWarrantB.OnCursorEntered = function( self )
		self:SetTextColor( Color( 0, 0, 255, 255 ) )
	end
	issueWarrantB.OnCursorExited = function( self )
		self:SetTextColor( Color( 0, 0, 0, 255 ) )
	end
	
	
	wantedList.Think = function( self )

		if ( CurTime() > self.m_ScanPlayers ) then
		
			self.m_ScanPlayers = self.m_ScanPlayers + 2
			
			--
			
			if ( !LocalPlayer():isCP() ) then
				
				policeMenu:Remove()
				return
			end
			
			--
			
			
			local t = player.GetAll()
			
			for i = 1, #t do
			
				local v = t[ i ]
				
				if ( IsValid( v ) ) then
				
					if ( v:isArrested() && arrPan[ v ] == nil ) then
						
						// Add arrested row
						addArrestPan( v )
					end
					
					if ( v:isWanted() && wantedPan[ v ] == nil ) then
						
						// Add wanted row
						addWantedPan( v )
					end
					
					if ( v:getDarkRPVar( "warranted" ) && warrPan[ v ] == nil ) then
						
						// Add warrant row
						addWarrantPan( v )
					end
				end
			end
		end
	end

	// This resizes and repositions all panels
	policeMenu.PerformLayout = function()
		
		surface.SetFont( "PoliceMenuFont" )
		arrestHeight = select( 2, surface.GetTextSize( "Arrested" ) )
		wantedHeight = select( 2, surface.GetTextSize( "Wanted" ) )
		warrHeight = select( 2, surface.GetTextSize( "Warrants" ) )

		// Police menu
		policeMenu:SetSize( ScrH() * 0.8, ScrH() * 0.8 )
		
		// Close button(s)
		exitB:SetPos( policeMenu:GetWide() - 18, 11 - 8 )
		
		if ( LocalPlayer():isMayor() ) then
			mayorB:SetPos( policeMenu:GetWide() - 20 - 20, 11 - 8 )
		end
		
		// Arrest
		arrestListHeight = policeMenu:GetTall()/2 - 70
		
		arrestTitle:SetSize( policeMenu:GetWide(), arrestHeight )
		arrestTitle:SetPos( 0, 25 )
		
		arrestList:SetPos( 0, 25 + arrestHeight )
		arrestList:SetSize( policeMenu:GetWide(), arrestListHeight )
		
		// Wanted
		wantedTitle:SetSize( policeMenu:GetWide()/2, wantedHeight )
		wantedTitle:SetPos( 0, 25 + arrestHeight + arrestListHeight )
		
		wantedList:SetPos( 0, 25 + wantedHeight + arrestHeight + arrestListHeight )
		wantedList:SetSize( policeMenu:GetWide()/2, policeMenu:GetTall() - 45 - 25 - arrestHeight - arrestListHeight - wantedHeight - 2 )
		
		// Warrant
		warrTitle:SetSize( policeMenu:GetWide()/2, warrHeight )
		warrTitle:SetPos( policeMenu:GetWide()/2, 25 + arrestHeight + arrestListHeight )
		
		warrList:SetPos( policeMenu:GetWide()/2, 25 + warrHeight + arrestHeight + arrestListHeight )
		warrList:SetSize( policeMenu:GetWide()/2, wantedList:GetTall() )
		
		// Buttons
		wantedB:SetPos( 1, policeMenu:GetTall() - 45 )
		wantedB:SetSize( policeMenu:GetWide()/2 - 2, 45 - 1 )
		
		issueWarrantB:SetPos( policeMenu:GetWide()/2 + 1, policeMenu:GetTall() - 45 )
		issueWarrantB:SetSize( policeMenu:GetWide()/2 - 2, 45 - 1 )
	end
end

concommand.Add( "police_menu", policeMenuFunc )


hook.Add( "OnPlayerChangedTeam", "ICEFUSE_OPCT_CHATCMDS", function( ply, before, after )
	
	local isMayor = ( RPExtraTeams[ after ] and RPExtraTeams[ after ].mayor )
	
	if ( isMayor ) then
		chat.AddText( Color( 255, 255, 255 ), "Type /mcon to open the president menu." )
		chat.AddText( Color( 255, 255, 255 ), "Also, type /pcon to open the police menu." )
	else
		
		local isCP = ( GAMEMODE.CivilProtection and GAMEMODE.CivilProtection[ after ] or false )
		
		if ( isCP ) then
			chat.AddText( Color( 255, 255, 255 ), "Type /pcon to open the police menu." )
		end
	end
end )