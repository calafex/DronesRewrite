include("shared.lua")

function ENT:Draw()
	self.BaseClass.Draw(self)
	
	if self:IsDroneWorkable() and not DRONES_REWRITE.ClientCVars.NoGlows:GetBool() then
		local pos = self:LocalToWorld(self.FirstPersonCam_pos)

		local dlight = DynamicLight(self:EntIndex())
		if dlight then
			dlight.pos = pos
			dlight.r = 255
			dlight.g = 255
			dlight.b = 255
			dlight.brightness = 1
			dlight.Decay = 1000
			dlight.Size = 80
			dlight.DieTime = CurTime() + 0.1
		end

		render.SetMaterial(Material("particle/particle_glow_04_additive"))
		render.DrawSprite(pos, 24, 24, Color(255, 255, 255, 64))
	end
end