--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_content/lua/autorun/client/toolsearch.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]


local cl_toolsearch_autoselect = CreateClientConVar("cl_toolsearch_autoselect", "1")

hook.Add("PostReloadToolsMenu", "ToolSearch", function()
	local toolPanel = g_SpawnMenu.ToolMenu.ToolPanels[1]
	local divider = toolPanel.HorizontalDivider
	local list = toolPanel.List

	local panel = vgui.Create("EditablePanel", divider)
	list:SetParent(panel)
	list:Dock(FILL)

	local text = panel:Add("EditablePanel")
	text:Dock(TOP)
	text:DockMargin(0, 0, 0, 2)
	text:SetTall(20)

	local search = text:Add("DTextEntry")
	search:Dock(FILL)
	search:DockMargin(0, 0, 2, 0)
	search:SetText("Search Tool...")
	search._OnGetFocus = search.OnGetFocus
	function search:OnGetFocus(...)
		if not self.Clicked then
			self:SetText("")
			self.Clicked = true
		end
		self:_OnGetFocus(...)
	end
	search:SetUpdateOnType(true)
	function search:OnValueChange(str)
		local i = 0
		for _, cat in next, list.pnlCanvas:GetChildren() do
			local hidden = 0
			for k, pnl in next, cat:GetChildren() do
				if pnl.ClassName ~= "DCategoryHeader" then
					if language.GetPhrase(pnl:GetText()):lower():match(str:lower()) then
						pnl:SetVisible(true)
						if cl_toolsearch_autoselect:GetBool() then
							i = i + 1
							if i == 1 then
								pnl:SetSelected(true)
								pnl:DoClick()
							else
								pnl:SetSelected(false)
							end
						end
					else
						pnl:SetVisible(false)
						hidden = hidden + 1
					end
				end
			end
			if hidden >= #cat:GetChildren() - 1 then
				cat:SetVisible(false)
			else
				cat:SetVisible(true)
			end
			cat:InvalidateLayout()
			list.pnlCanvas:InvalidateLayout()
		end
	end

	local clear = text:Add("DButton")
	clear:Dock(RIGHT)
	clear:SetWide(20)
	clear:SetText("")
	clear:SetTooltip("Press to clear")
	function clear:DoClick()
		search:SetValue("")
	end
	local close = Material("icon16/cross.png")
	function clear:Paint(w, h)
		derma.SkinHook("Paint", "Button", self, w, h)

		surface.SetMaterial(close)
		surface.SetDrawColor(Color(255, 255, 255))
		surface.DrawTexturedRect(w * 0.5 - 16 * 0.5, h * 0.5 - 16 * 0.5, 16, 16)
	end

	divider:SetLeft(panel)
end)

hook.Add("PopulateToolMenu", "ToolSearch", function()
	spawnmenu.AddToolMenuOption("Utilities",
		"User",
		"ToolSearch",
		"Tool Search",    "",    "",
		function(pnl)
			pnl:AddControl("Header", {
				Description = "Configure the Tool Search's behavior."
			})

			pnl:AddControl("CheckBox", {
				Label = "Auto-Select",
				Command = "cl_toolsearch_autoselect",
			})
			pnl:ControlHelp("If enabled, this will select the top most tool automatically when you do a search query.")

			pnl:AddControl("Header", {
				Description = "" -- spacer
			})
		end
	)
end)

RunConsoleCommand("spawnmenu_reload")

