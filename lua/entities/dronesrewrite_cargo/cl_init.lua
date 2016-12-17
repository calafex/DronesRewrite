include("shared.lua")

function ENT:Draw()
	self.BaseClass.Draw(self)
	
	if self:IsDroneWorkable() and not DRONES_REWRITE.ClientCVars.NoGlows:GetBool() then
		local dlight = DynamicLight(self:EntIndex())
		if dlight then
			dlight.pos = self:LocalToWorld(Vector(34, 0, -8))
			dlight.r = 0
			dlight.g = 255
			dlight.b = 255
			dlight.brightness = 1
			dlight.Decay = 1000
			dlight.Size = 80
			dlight.DieTime = CurTime() + 0.1
		end

		render.SetMaterial(Material("particle/particle_glow_04_additive"))
		render.DrawSprite(self:LocalToWorld(Vector(34, 0, -8)), 30, 30, Color(0, 255, 255, 30))
	end
end