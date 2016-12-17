include("shared.lua")

local mat = CreateMaterial("UnlitGeneric", "GMODScreenspace", { })

function ENT:DrawBroken(index, w, h)
	surface.SetMaterial(self.BrokenMat[index])
	surface.SetDrawColor(Color(255, 255, 255))
	surface.DrawTexturedRect(0, 0, w, h)
end

function ENT:Draw()
	self:DrawModel()

	if self:GetNWBool("shithappened") then return end

	if not self.Rt then
		self.Rt = GetRenderTarget("ConsoleDrr" .. self:EntIndex(), 1024, 1024, false)
	end

	if not self.RandomDraw then
		self.RandomDraw = 1
	end

	if DRONES_REWRITE.ClientCVars.NoConRender:GetBool() and self:GetNWEntity("User") != LocalPlayer() then return end

	if not self.BrokenMat then
		self.BrokenMat = { }

		for i = 1, 5 do
			self.BrokenMat[i] = Material("stuff/console/broken" .. math.random(1, 9))
		end
	end

	if not self:GetNWBool("Destroyed") then
		-- Lights
		if not self:GetNWBool("noLights") then
			local dlight = DynamicLight(self:EntIndex())
			if dlight then
				dlight.pos = self:LocalToWorld(Vector(58, 12, 75))
				dlight.r = 255
				dlight.g = 255
				dlight.b = 255
				dlight.brightness = 4
				dlight.Decay = 1
				dlight.Size = 128
				dlight.DieTime = CurTime() + 0.1
			end

			local dlight = DynamicLight(self:EntIndex() + 1)
			if dlight then
				dlight.pos = self:LocalToWorld(Vector(-16, 12, 75))
				dlight.r = 255
				dlight.g = 255
				dlight.b = 255
				dlight.brightness = 4
				dlight.Decay = 1
				dlight.Size = 128
				dlight.DieTime = CurTime() + 0.1
			end
		end
	end

	-- Drawing lines
	cam.Start3D2D(self:LocalToWorld(Vector(0.4, -21.4, 71.5)), self:LocalToWorldAngles(Angle(0, 90, 90)), 0.06)
		local w, h = 720, 434

		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0))

		if self:GetNWBool("Destroyed") then
			self:DrawBroken(1, w, h)
		else
			if self.Cache then
				local min = #self.Cache > 28 and #self.Cache - 28 or 1

				local count = 1
				for i = min, #self.Cache do
					local cache = self.Cache[i]

					draw.SimpleText(cache.Text, "DronesRewrite_font5", 10, count * 14, cache.Color)

					count = count + 1
				end
			end
		end
	cam.End3D2D()

	-- Drawing camera view
	cam.Start3D2D(self:LocalToWorld(Vector(12, -69, 71.5)), self:LocalToWorldAngles(Angle(0, 105, 90)), 0.06)
		local w, h = 720, 434

		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0))

		if self:GetNWBool("Destroyed") then
			self:DrawBroken(2, w, h)
		else
			local drone = self:GetNWEntity("DronesRewriteDrone")

			if not self:GetNWBool("noScreen") then
				if drone:IsValid() then
					if not DRONES_REWRITE.ClientCVars.NoScreen:GetBool() then
						mat:SetTexture("$basetexture", self.Rt)
						surface.SetMaterial(mat)
						surface.DrawTexturedRect(0, 0, w, h)
					end
				else
					draw.SimpleText("No signal", "DronesRewrite_font5", 10, 14, Color(255, 255, 255))
				end
			else
				draw.SimpleText("Screen is disabled. To enable type screen 1", "DronesRewrite_font5", 10, 14, Color(255, 255, 255))
			end
		end
	cam.End3D2D()

	-- Garbage
	cam.Start3D2D(self:LocalToWorld(Vector(0.9, 27, 71.5)), self:LocalToWorldAngles(Angle(0, 75, 90)), 0.06)
		local w, h = 720, 434

		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0))	

		if self:GetNWBool("Destroyed") then
			self:DrawBroken(3, w, h)
		else
			local drone = self:GetNWEntity("DronesRewriteDrone")

			if drone:IsValid() then
				local params = {
					"Unit: " .. drone:GetUnit(),
					"Health: " .. drone:GetHealth() .. " / " .. drone:GetDefaultHealth(),
					"Fuel: " .. drone:GetFuel() .. " / " .. drone.MaxFuel,
					"Distance: " .. math.floor(drone:GetPos():Distance(self:GetPos())) .. " units",
					"",
					"Weapon: " .. drone:GetNWString("CurrentWeapon"),
					"Primary ammo: " .. drone:GetPrimaryAmmo(),
					"Secondary ammo: " .. drone:GetSecondaryAmmo(),
					"",
					"Up speed: " .. drone.UpSpeed,
					"Speed: " .. drone.Speed,
					"Rotate speed: " .. drone.RotateSpeed,
					"Sprint coefficient: " .. drone.SprintCoefficient,
					"",
					"Type: " .. (drone.DrrBaseType == "base" and "flying" or drone.DrrBaseType),
					"Weight: " .. drone.Weight,
					"Enabled: " .. (drone:IsDroneEnabled() and "yes" or "no"),
					"Workable: " .. (drone:IsDroneWorkable() and "yes" or "no"),
					"Driver: " .. (drone:GetDriver():IsValid() and drone:GetDriver():Name() or "nobody"),
					"Admin only: " .. (drone.AdminOnly and "yes" or "no")
				}

				local x = 0
				for k, v in pairs(params) do
					draw.SimpleText(v, "DronesRewrite_font5", 12 + x, (k * 20) - 12, Color(255, 255, 255))
				end
			else
				draw.SimpleText("No signal", "DronesRewrite_font5", 10, 14, Color(255, 255, 255))
			end
		end
	cam.End3D2D()

	-- Clock
	cam.Start3D2D(self:LocalToWorld(Vector(3.3, -11.5, 80.2)), self:LocalToWorldAngles(Angle(0, 90, 117)), 0.06)
		local w, h = 176, 110

		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0))

		if self:GetNWBool("Destroyed") then
			self:DrawBroken(4, w, h)
		else
			draw.SimpleText(os.date("%X" , os.time()), "DronesRewrite_font1", 10, 30, Color(255, 255, 255))
		end
	cam.End3D2D()

	if math.random(1, 150) == 1 then self.RandomDraw = math.random(1, 5) end

	-- Garbage
	cam.Start3D2D(self:LocalToWorld(Vector(3.3, 1, 80.2)), self:LocalToWorldAngles(Angle(0, 90, 117)), 0.06)
		local w, h = 176, 110

		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0))

		if self:GetNWBool("Destroyed") then
			self:DrawBroken(5, w, h)
		else
			if not self:GetNWBool("noRandomScr") then
				surface.SetMaterial(Material("effects/tvscreen_noise002a"))
				surface.DrawTexturedRect(0, 0, w, h)
			end
		end
	cam.End3D2D()
end

function ENT:OpenConsole()
	if not self.Cache then self.Cache = { } end
	hook.Add("ShouldDrawLocalPlayer", "dronesrewrite_console_drawply", function() return true end)

	local newang
	local newpos

	local display = 2
	local nextch = 0

	hook.Add("CalcView", "dronesrewrite_console_camera", function(ply, pos, ang, fov)
		if not ply:Alive() then self:CloseWindow() end
		if not newpos then newpos = pos end
		if not newang then newang = ang end

		local ang = self:GetAngles()
		local struct = {
			[1] = {
				pos = self:LocalToWorld(Vector(30, 35, 60)),
				angle = Angle(0, ang.y + 160, 0)
			},

			[2] = {
				pos = self:LocalToWorld(Vector(30, 0, 60)),
				angle = Angle(0, ang.y + 180, 0)
			},

			[3] = {
				pos = self:LocalToWorld(Vector(30, -35, 60)),
				angle = Angle(0, ang.y + 200, 0)
			},

			[4] = {
				pos = self:LocalToWorld(Vector(65, 0, 80)),
				angle = Angle(20, ang.y + 180, 0)
			}
		}

		if input.IsKeyDown(KEY_RIGHT) and CurTime() > nextch then
			if display == 4 then display = 2 end

			display = display - 1
			if display < 1 then display = 4 end

			nextch = CurTime() + 0.2
		end

		if input.IsKeyDown(KEY_LEFT) and CurTime() > nextch then
			if display == 4 then display = 2 end

			display = display + 1
			if display > 3 then display = 4 end

			nextch = CurTime() + 0.2
		end

		if input.IsKeyDown(KEY_DOWN) and CurTime() > nextch then
			display = display == 4 and 2 or 4
			nextch = CurTime() + 0.2
		end

		toch = struct[display].pos
		tocha = struct[display].angle

		newang = LerpAngle(0.1, newang, tocha)
		newpos = LerpVector(0.1, newpos, toch)
		
		local view = { }
		view.origin = newpos
		view.angles = newang
		view.fov = fov
			
		return view
	end)

	local no_drawing = {
		CHudHealth = true,
		CHudBattery = true,
		CHudCrosshair = true,
		CHudAmmo = true,
		CHudSecondaryAmmo = true
	}

	hook.Add("HUDShouldDraw", "dronesrewrite_console_nohud", function(name)
		if no_drawing[name] then return false end
	end)

	local win = DRONES_REWRITE.CreateWindow(365, 200)
	win:SetPos(0, ScrH() - 200)

	local hide = DRONES_REWRITE.CreateButton("", win:GetWide() - 45, 0, 15, 25, win, function()
		-- Seems like RunConsoleCommand uses net to send shit
		-- so i've made timer
		RunConsoleCommand("dronesrewrite_cl_noconwin", "1")

		timer.Simple(0.1, function()
			if IsValid(self) then 
				self:CloseWindow()
				self:OpenConsole() 
			end
		end)
	end)

	hide.Paint = function(hide, w, h)
		draw.RoundedBox(2, 0, h / 2, w, 2, Color(255, 255, 255))
	end

	local panellabs = DRONES_REWRITE.CreateScrollPanel(10, 30, 340, 119, win)
	panellabs.Paint = function(panellabs, w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0))
		surface.SetDrawColor(Color(255, 255, 255, 100))
		surface.DrawOutlinedRect(0, 0, w, h)
	end

	local pan = { }

	win.Think = function()
		if self.Cache then
			for k, v in pairs(self.Cache) do
				if not pan[k] or pan[k]:GetText() != v.Text then
					if pan[k] then pan[k]:Remove() pan[k] = nil end

					local lab = DRONES_REWRITE.CreateLabel(v.Text, 5, (k - 1) * 18, panellabs)
					lab:SetColor(v.Color)

					pan[k] = lab
				end
			end

			for k, v in pairs(pan) do
				if not self.Cache[k] then pan[k]:Remove() pan[k] = nil end
			end
		end
	end

	win.OnCloseButton = function()
		net.Start("dronesrewrite_conexit")
			net.WriteEntity(self)
		net.SendToServer()

		return true -- block closing
	end

	local del = true
	local text = vgui.Create("DTextEntry", win)
	text:SetSize(340, 25)
	text:SetPos(10, 165)
	text:SetFont("DronesRewrite_font4")
	text:SetHistoryEnabled(true)
	text:RequestFocus()

	local user = "> "
	local user_len = string.len(user)

	local newSeance = false

	text.OnTextChanged = function()
		if string.len(text:GetValue()) > self.MaxSymbols then 
			surface.PlaySound("buttons/button10.wav") 
			text:SetText(text.OldValue) 
			text:SetCaretPos(self.MaxSymbols)

			return 
		end

		self:EmitSound("buttons/lightswitch2.wav", 60, 180)

		local key = self.Cache[#self.Cache]

		if not key then
			self:AddLine(user)
			newSeance = false

			key = self.Cache[#self.Cache]
		end

		if key then
			if string.sub(key.Text, 1, user_len) != user or newSeance then self:AddLine(user) newSeance = false end
			self.Cache[#self.Cache].Text = user .. text:GetValue()
		end

		text.OldValue = text:GetValue()
		panellabs:GetVBar():SetScroll(panellabs:GetVBar().CanvasSize)
	end

	local function foo()
		self.LastTyped = text:GetValue()
		local cmd = string.Explode(" ", self.LastTyped)[1]

		text:AddHistory(self.LastTyped)

		net.Start("dronesrewrite_concmd")
			net.WriteEntity(self)
			net.WriteString(cmd)
			net.WriteString(string.sub(self.LastTyped, string.len(cmd) + 2, #self.LastTyped))
		net.SendToServer()

		text:SetText("")
		surface.PlaySound("ui/buttonclick.wav")

		newSeance = true
	end

	text.OnEnter = foo
	text.OnLoseFocus = function() text:RequestFocus() end

	text.NextClick = 0

	hook.Add("HUDPaint", "dronesrewrite_console_hud", function()
		if not self:GetNWBool("noHints") then
			local x = DRONES_REWRITE.ClientCVars.NoConWin:GetBool() and 20 or 385
			draw.SimpleText("Type 'exit' to stop using console", "DronesRewrite_customfont1", x, ScrH() - 60, Color(255, 255, 255), TEXT_ALIGNT_LEFT)
			draw.SimpleText("Use arrow keys to change view", "DronesRewrite_customfont1", x, ScrH() - 45, Color(255, 255, 255), TEXT_ALIGNT_LEFT)
			draw.SimpleText("Type helpmenu to get help", "DronesRewrite_customfont1", x, ScrH() - 30, Color(255, 255, 255), TEXT_ALIGNT_LEFT)

			local i = DRONES_REWRITE.ClientCVars.NoConWin:GetBool() and 6 or 14
			for k, v in pairs(DRONES_REWRITE.GetCommands()) do
				if text:GetValue() != "" and string.find(k, text:GetValue(), nil, true) then
					draw.SimpleText(k, "DronesRewrite_customfont1", 20, ScrH() - i * 16, Color(255, 255, 255), TEXT_ALIGNT_LEFT)
					i = i + 1
				end
			end
		end
	end)

	if DRONES_REWRITE.ClientCVars.NoConWin:GetBool() then
		win:SetPos(0, ScrH())
	end

	self.Window = win
end

function ENT:OnRemove()
	self:CloseWindow()
end

function ENT:CloseWindow() 
	if IsValid(self.Window) then self.Window:Close() self.Window = nil end 

	if self.Cache then
		local key = self.Cache[#self.Cache]
		if key and string.sub(key.Text, 1, user_len) == user then self.Cache[#self.Cache] = nil end
	end

	hook.Remove("CalcView", "dronesrewrite_console_camera")
	hook.Remove("HUDPaint", "dronesrewrite_console_hud")
	hook.Remove("ShouldDrawLocalPlayer", "dronesrewrite_console_drawply")
	hook.Remove("HUDShouldDraw", "dronesrewrite_console_nohud")
end
