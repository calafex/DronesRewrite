include("shared.lua")

function ENT:Draw()
	self:DrawModel()

	local drone = self:GetNWEntity("DronesRewriteDrone")
	if drone:IsValid() then
		local ang = (self:GetPos() - LocalPlayer():GetPos()):Angle()
		ang.p = 0
		ang:RotateAroundAxis(ang:Up(), -90)
		ang:RotateAroundAxis(ang:Forward(), 90)

		cam.Start3D2D(self:GetPos() + vector_up * 15, ang, 0.1)
			surface.SetDrawColor(Color(0, 150, 255))
			surface.DrawOutlinedRect(-100, -30, 200, 70)
			local fuel = (drone:GetFuel() / drone.MaxFuel) * 200
			surface.DrawRect(-95, -25, fuel - 10, 60)

			draw.SimpleText("FUEL " .. math.floor(drone:GetFuel()) .. " / " .. drone.MaxFuel, "DronesRewrite_font1", 110, -5, nil, TEXT_ALIGN_LEFT)

			if drone:GetFuel() < drone.MaxFuel then 
				draw.SimpleText("REFUELING...", "DronesRewrite_font1", 110, -35, nil, TEXT_ALIGN_LEFT) 
			else 
				draw.SimpleText("FULL", "DronesRewrite_font1", 110, -35, nil, TEXT_ALIGN_LEFT) 
			end

			draw.SimpleText("To stop refueling move your drone away", "DronesRewrite_font4", 110, 35, nil, TEXT_ALIGN_LEFT)
		cam.End3D2D()
	end
end