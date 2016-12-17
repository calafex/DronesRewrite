include("shared.lua")

function ENT:Draw()
	self.BaseClass.Draw(self)

	if self:IsDroneWorkable() and not DRONES_REWRITE.ClientCVars.NoGlows:GetBool() then
		local dlight = DynamicLight(self:EntIndex())
		if dlight then
			dlight.pos = self:LocalToWorld(Vector(22, 0, 2))
			dlight.r = 255
			dlight.g = 255
			dlight.b = 255
			dlight.brightness = 1
			dlight.Decay = 1000
			dlight.Size = 40
			dlight.DieTime = CurTime() + 0.1
		end

		render.SetMaterial(Material("particle/particle_glow_04_additive"))
		render.DrawSprite(self:LocalToWorld(Vector(15, 0, 2)), 11, 11, Color(255, 255, 255, 10))
	end
end