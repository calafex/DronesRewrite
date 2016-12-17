include("shared.lua")

function ENT:Draw()
	self.BaseClass.Draw(self)

	if self:IsDroneWorkable() and not DRONES_REWRITE.ClientCVars.NoGlows:GetBool() then
		local dlight = DynamicLight(self:EntIndex())
		if dlight then
			dlight.pos = self:LocalToWorld(self.FirstPersonCam_pos)
			dlight.r = 255
			dlight.g = 255
			dlight.b = 255
			dlight.brightness = 2
			dlight.Decay = 1000
			dlight.Size = 120
			dlight.DieTime = CurTime() + 0.1
		end

		render.SetMaterial(Material("particle/particle_glow_04_additive"))
		render.DrawSprite(self:LocalToWorld(self.FirstPersonCam_pos), 30, 30, Color(255, 255, 255, 30))
	end
end