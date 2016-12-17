DRONES_REWRITE.HUD["Camera"] = function(drone)
	local shouldDrawCenter = drone.HUD_shouldDrawCenter and DRONES_REWRITE.ClientCVars.DrawCenter:GetBool()
	local shouldDrawFuel = drone.HUD_shouldDrawFuel and DRONES_REWRITE.ClientCVars.DrawFuel:GetBool()

	local x, y = ScrW(), ScrH()
	local pos = (drone:GetForward() * 10 + drone:LocalToWorld(drone.FirstPersonCam_pos)):ToScreen()

	if shouldDrawFuel then
		surface.SetDrawColor(Color(255, 255, 255))

		surface.SetMaterial(Material("stuff/battery"))
		surface.DrawTexturedRect(20, 0, 100, 100)

		surface.SetMaterial(Material("stuff/bar"))

		for i = 0, (drone:GetFuel() / drone.MaxFuel) * 2 do
			surface.DrawTexturedRect(21 + i * 19, 30, 45, 40)
		end
	end

	local text = "Flashlight: " .. (drone:GetNWBool("camera_flashen", true) and "enabled" or "disabled")
	draw.SimpleText(text, "DronesRewrite_customfont2", 20, 100, Color(255, 255, 255), TEXT_ALIGN_LEFT) 
	draw.SimpleText("RES: " .. ScrW() .. "x" .. ScrH(), "DronesRewrite_customfont2", 20, 125, Color(255, 255, 255), TEXT_ALIGN_LEFT)

	surface.SetDrawColor(Color(255, 255, 255, 55 + math.abs(math.sin(CurTime() * 5)) * 200))
	surface.SetMaterial(Material("stuff/rec"))
	surface.DrawTexturedRect(20, y - 90, 100, 100)

	x, y = x / 2, y / 2
	surface.DrawRect(x - 100, y - 70, 50, 2)
	surface.DrawRect(x - 100, y - 70, 2, 50)

	surface.DrawRect(x + 50, y - 70, 50, 2)
	surface.DrawRect(x + 100, y - 70, 2, 50)

	surface.DrawRect(x - 100, y + 70, 50, 2)
	surface.DrawRect(x - 100, y + 20, 2, 50)

	surface.DrawRect(x + 50, y + 70, 52, 2)
	surface.DrawRect(x + 100, y + 20, 2, 50)

	if shouldDrawCenter then
		surface.SetMaterial(Material("stuff/cross"))
		surface.DrawTexturedRect(pos.x, pos.y, 8, 8)
	end
end