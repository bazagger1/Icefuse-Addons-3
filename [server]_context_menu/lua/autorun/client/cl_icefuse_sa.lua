--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_context_menu/lua/autorun/client/cl_icefuse_sa.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

include("sh_isa.lua")

local menu = nil
local menuAnimation = nil --The menu
local menuServer = nil
local menuCommands = nil
local ISA_Unlocks = {} --a table of unlocked actions
local commands = {} --This is a list of commands and there status.

surface.CreateFont( "ISA:title", {
	font = "Roboto",
	extended = false,
	size = 25,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "ISA:title2", {
	font = "Roboto Lt",
	extended = false,
	size = 20,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

local blur = Material("pp/blurscreen")

local function DrawBlur( p, a, d )
	local x, y = p:LocalToScreen(0, 0)
	surface.SetDrawColor( 255, 255, 255 )
	surface.SetMaterial( blur )
	
	for i = 1, d do
		blur:SetFloat( "$blur", (i / d ) * ( a ) )
		blur:Recompute()
		render.UpdateScreenEffectTexture()
		surface.DrawTexturedRect( x * -1, y * -1, ScrW(), ScrH() )
	end
end

local function ColorLerp(v, c1, c2)
	local c = Color(0,0,0)
	c.r = Lerp(v, c1.r, c2.r)
	c.g = Lerp(v, c1.g, c2.g)
	c.b = Lerp(v, c1.b, c2.b)
	c.a = Lerp(v, c1.a, c2.a)

	return c
end

local function ThirdPerson( ply, pos, ang, fov )
	local view = {}
	local dist = 100
	local trace = {}
	
	trace.start = pos
	trace.endpos = pos - ( ang:Forward() * dist )
	trace.filter = LocalPlayer()
	local trace = util.TraceLine( trace )
	if( trace.HitPos:Distance( pos ) < dist - 10 ) then
		dist = trace.HitPos:Distance( pos ) - 10
	end;
	view.origin = pos - ( ang:Forward() * dist )
	view.angles = ang;
	view.fov = fov;
	
	return view;
end

local function ThirdPersonView()
	return true
end

local function CreateMenu()
	local frame = vgui.Create("DFrame")
	frame:SetSize(500, 700)
	frame:SetPos(ScrW() - 500, ScrH() - 700)
	frame:NoClipping(false)
	frame:ShowCloseButton(false)
	frame:SetDraggable(false)
	frame:MakePopup()

	frame.Paint = function() end

	menu = frame
end

--Creates the menu
local function CreateAnimationMenu()
	--Create the main frame
	local frame = vgui.Create("DPanel", menu)
	frame:SetSize(200, (#ISA_ACTIONS * 30) + 30)
	frame:SetPos(menu:GetWide() - 200 - 220,700 -  frame:GetTall())
	frame:NoClipping(false)

	frame.Paint = function(s , w , h)
		DrawBlur( s, 3, 3 )
		draw.RoundedBoxEx(8,0,0,w,30, Color(40,40,40,250), true, true, false, false)
		draw.RoundedBox(0, 199,30,1,frame:GetTall() - 30, Color(40,40,40,250))

		draw.SimpleText("Gestures","ISA:title", w/2, 15, Color(240,240,240,255), 1, 1)
	end
	
	local buttons = {}
	for k ,v in pairs(ISA_ACTIONS) do 
		local b = vgui.Create("DButton", frame)
		b:SetPos(0, 30 + ((k-1) * 30))
		b:SetSize(199, 30)
		b:SetText("")
		local mat = Material( "pp/blurscreen" )
		b.color = Color(40,40,40,100)
		b.Paint = function(s, w, h)
			DrawBlur( s, 1, 1 )
			local text = "ERROR"

			if s.state == 0 then
				s.color = ColorLerp(182 * FrameTime(), s.color, Color(40,40,40,120))
				draw.RoundedBox(0,0,0,w,h,s.color)
				surface.SetDrawColor(0,0,0,255)
				surface.DrawOutlinedRect(0,0,w,h + 1)

				text = v.name 
			elseif s.state == 1 then
				s.color = ColorLerp(8 * FrameTime(), s.color, Color(40,200,40,90))
				text = "Buy for $"..v.price
			elseif s.state == 2 then
				s.color = ColorLerp(8 * FrameTime(), s.color, Color(200,40,40,90))
				text = "Are you sure?"
			end

			draw.RoundedBox(0,0,0,w,h,s.color)
			surface.SetDrawColor(0,0,0,255)
			surface.DrawOutlinedRect(0,0,w,h + 1)

			if ISA_Unlocks[k] then
				draw.SimpleText(text,"ISA:title2", w/2, h/2, Color(210,210,210,255), 1, 1)
			else
				if s.state == 0 then 
					draw.SimpleText(text,"ISA:title2", w/2, h/2, Color(210,120,120,255), 1, 1)
				else
					draw.SimpleText(text,"ISA:title2", w/2, h/2, Color(210,210,210,255), 1, 1)
				end
			end
		end
		b.state = 0
		b.DoClick = function(s)
			if b.state == 0 then
				if ISA_Unlocks[k] then
					net.Start("ISA:RquestAction")
					net.WriteInt(k, 8)
					net.SendToServer() 
					return
				else
					b.state = 1
				end
				return
			end
			if b.state == 1 then
				b.state = 2
				return
			end
			--Time to purchase
			if b.state == 2 then
				b.state = 0
				--Purform purchase?
				if LocalPlayer():ISA_CanBuyAction(k) then
					net.Start("ISA:PurchaseAction")
					net.WriteInt(k, 8)
					net.SendToServer()
				end
			end		
		end

		table.insert(buttons, b)
	end

	menuAnimation = frame
end


--Creates the menu
local function CreateCommandsMenu()
	--Create the main frame
	local frame = vgui.Create("DPanel", menu)
	frame:SetSize(200, (#ISA_COMMANDS * 30) + 40)
	frame:SetPos(menu:GetWide() - 200, 700 -  frame:GetTall())
	frame:NoClipping(false)

	frame.Paint = function(s , w , h)
		DrawBlur( s, 3, 3 )
		draw.RoundedBoxEx(8,0,0,w,30, Color(40,40,40,250), true, false, false, false)

		draw.RoundedBox(0, 0,30,w,frame:GetTall() - 30, Color(0,0,0,150))

		draw.RoundedBox(0, 199,30,1,frame:GetTall() - 30, Color(40,40,40,250))

		draw.SimpleText("Commands","ISA:title", w/2, 15, Color(240,240,240,255), 1, 1)
	end

	--Now create the commands
	for k ,v in pairs(ISA_COMMANDS) do
		local checkBox = vgui.Create("DCheckBox", frame)
		checkBox:SetPos(10, 40 + ((k-1) * 30))
		checkBox:SetSize(24, 24)
		checkBox:NoClipping(true)
		checkBox.Paint = function(s, w, h)
			for i = 1 , 3 do
				surface.SetDrawColor(Color(240,240,240,255))
				surface.DrawOutlinedRect(i,i,w - (i * 2), h - (i * 2))
			end

			if s:GetChecked() then
				draw.RoundedBox(0, 7, 7, w - 14, h - 14, Color(240,240,240,255))
			end 

			--Draw the label now
			draw.SimpleText(v.name, "ISA:title2", h + 5, h/2, Color(240,240,240,255), 0, 1)
		end

		checkBox.DoClick = function(s)
			local splitCommands

			if not s:GetChecked() then --Invert becuase it hasnt changed yet
				splitCommands = string.Explode(";", v.onEnabled)
			else
				splitCommands = string.Explode(";", v.onDisabled)
			end

		    --Decode command
			for a , b in pairs(splitCommands) do
				local arguments = string.Explode(" ", b)
				RunConsoleCommand(unpack(arguments)) --Run the commands
			end

			s:SetChecked(not s:GetChecked())
			commands[k] = s:GetChecked()
		end

		if commands[k] ~= nil then 
			checkBox:SetChecked(commands[k])
		end
	end
	menuCommands = frame 
end

--Creates the menu
local function CreateServerMenu()
	--Create the main frame
	local frame = vgui.Create("DPanel", menu)
	frame:SetSize(200, (#ISA_SERVERS * 30) + 30)
	frame:SetPos(menu:GetWide() - 200, 700 -  menuCommands:GetTall() - frame:GetTall() - 20)
	frame:NoClipping(false)

	frame.Paint = function(s , w , h)
		DrawBlur( s, 3, 3 )
		draw.RoundedBoxEx(8,0,0,w,30, Color(40,40,40,250), true, false, false, false)
		draw.RoundedBox(0, 199,30,1,frame:GetTall() - 30, Color(40,40,40,250))

		draw.SimpleText("Servers","ISA:title", w/2, 15, Color(240,240,240,255), 1, 1)
	end

	local buttons = {}
	for k ,v in pairs(ISA_SERVERS) do 
		local b = vgui.Create("DButton", frame)
		b:SetPos(0, 30 + ((k-1) * 30))
		b:SetSize(199, 30)
		b:SetText("")
		local mat = Material( "pp/blurscreen" )
		b.color = Color(40,40,40,100)
		b.Paint = function(s, w, h)
			DrawBlur( s, 1, 1 )
			local text = "ERROR" 

			if s.state == 0 then
				s.color = ColorLerp(182 * FrameTime(), s.color, Color(40,40,40,120))
				draw.RoundedBox(0,0,0,w,h,s.color)
				surface.SetDrawColor(0,0,0,255)
				surface.DrawOutlinedRect(0,-1, w, h + 1)

				text = v.name  
			elseif s.state == 1 then
				s.color = ColorLerp(8 * FrameTime(), s.color, Color(40,200,40,90))
				text = "Connet?"
			end 

			draw.RoundedBox(0,0,0,w,h,s.color)
			surface.SetDrawColor(0,0,0,255)
			surface.DrawOutlinedRect(0,0,w + 1,h + 1)

			if s.state == 0 then 
				draw.SimpleText(text,"ISA:title2", w/2, h/2, Color(210,210,210,255), 1, 1)
			else
				draw.SimpleText(text,"ISA:title2", w/2, h/2, Color(210,210,210,255), 1, 1)
			end
		end

		b.state = 0
		b.DoClick = function(s)
			if b.state == 0 then
				b.state = 1
				return
			end
			if b.state == 1 then
				LocalPlayer():ConCommand("connect "..v.ip)
				return
			end	
		end

		table.insert(buttons, b)
	end

	menuCommands = frame 
end

--Closes it
local function CloseMenus()
	menu:Close()
end
 
--Acctualy plays a sound and the animation
local function TriggerAction(action, ply) 
	ply:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ISA_ACTIONS[action].anim, true)

	--Play the sound if you can
	if ISA_ACTIONS[action].sound then
		ply:EmitSound(ISA_ACTIONS[action].sound , 75, 100, 1, CHAN_AUTO )
	end

	if ply == LocalPlayer() then
		hook.Add( "CalcView", "ISA:ThirdPerson", ThirdPerson)
		hook.Add( "ShouldDrawLocalPlayer", "ISA:ThirdPersonView", ThirdPersonView )
		timer.Simple(ISA_ACTIONS[action].time, function()  --Wait 4 seconds
			hook.Remove("CalcView", "ISA:ThirdPerson")
			hook.Remove("ShouldDrawLocalPlayer", "ISA:ThirdPersonView")
		end)
	end
end

net.Receive("ISA:TriggerAction", function(len)
	TriggerAction(net.ReadInt(8), net.ReadEntity())
end)

net.Receive("ISA:UpdateUnlockedActions", function(len)
	ISA_Unlocks = net.ReadTable()
end)

hook.Add("ContextMenuOpen", "ISA:CreateMenu", function()
	CreateMenu()
	CreateAnimationMenu()
	CreateCommandsMenu()
	CreateServerMenu()
end)

hook.Add("OnContextMenuClose", "ISA:DestroyMenu", function()
	CloseMenus()
end)




