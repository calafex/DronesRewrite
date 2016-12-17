include("shared.lua")

local mat = CreateMaterial("UnlitGeneric", "GMODScreenspace", { })

function ENT:Draw()
	if not self.Rt then
		self.Rt = GetRenderTarget("ControllerDrr" .. self:EntIndex(), 1024, 1024, false)
	end

	self:DrawModel()

	cam.Start3D2D(self:LocalToWorld(Vector(-14.7, -14.4, 1.5)), self:LocalToWorldAngles(Angle(0, 90, 0)), 0.03)
		local w, h = 520, 345

		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0))

		local drone = self:GetNWEntity("DronesRewriteDrone")

		if drone:IsValid() then
			if not DRONES_REWRITE.ClientCVars.NoScreen:GetBool() then
				mat:SetTexture("$basetexture", self.Rt)
				surface.SetMaterial(mat)
				surface.DrawTexturedRect(0, 0, w, h)
			end

			draw.SimpleText("DRONE: " .. drone:GetUnit(), "DronesRewrite_font3", 8, 8, Color(255, 255, 255, 200))
			draw.SimpleText("HEALTH: " .. drone:GetHealth(), "DronesRewrite_font3", 8, 30, Color(255, 255, 255, 200))
			draw.SimpleText("MAX DISTANCE: " .. self:GetNWInt("Distance"), "DronesRewrite_font3", 8, 52, Color(255, 255, 255, 200))
		else
			surface.SetMaterial(Material("stuff/console/broken4"))
			surface.SetDrawColor(Color(255, 255, 255, 50))
			surface.DrawTexturedRect(0, 0, w, h)

			draw.SimpleText("NO SIGNAL", "DronesRewrite_font1", w / 2, h / 2 - 16, Color(255, 255, 255, 50), TEXT_ALIGN_CENTER)
		end
	cam.End3D2D()

	if not DRONES_REWRITE.ClientCVars.NoGlows:GetBool() then 
		local dlight = DynamicLight(self:EntIndex())
		if dlight then
			dlight.pos = self:LocalToWorld(Vector(-7, -7, 3))
			dlight.r = 255
			dlight.g = 255
			dlight.b = 255
			dlight.brightness = 1
			dlight.Decay = 1000
			dlight.Size = 36
			dlight.DieTime = CurTime() + 0.1
		end
	end
end

function ENT:OpenMenu()
	local win = DRONES_REWRITE.CreateWindow(265, 110)

	local del = true
	local text = vgui.Create("DTextEntry", win)
	text:SetSize(245, 25)
	text:SetPos(10, 30)

	text.OnTextChanged = function()
		net.Start("dronesrewrite_controllerlookup")
			net.WriteEntity(self)
			net.WriteString(text:GetValue())
		net.SendToServer()
	end

	text.OnLoseFocus = function() text:RequestFocus() end
	text:RequestFocus()

	local btn = DRONES_REWRITE.CreateButton("Enter a valid drone id", 10, 70, 245, 30, win, function()
		net.Start("dronesrewrite_controldr")
			net.WriteEntity(self)
		net.SendToServer()

		win:Close()
	end)

	text.OnEnter = btn.DoClick

	btn.Think = function(btn)
		local text = self:GetNWEntity("DronesRewriteDrone"):IsValid() and "Control " .. self:GetNWEntity("DronesRewriteDrone"):GetUnit() or "Enter a valid drone id"
		if text != btn:GetText() then btn:SetText(text) end
	end
end