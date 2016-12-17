include("shared.lua")

function ENT:Draw()
	self.BaseClass.Draw(self)

	if self:IsDroneWorkable() and not DRONES_REWRITE.ClientCVars.NoGlows:GetBool() then
		local color = self:GetColor()

		for i = -1, 1, 2 do
			local dlight = DynamicLight(self:EntIndex())
			local pos = self:LocalToWorld(Vector(3.7, -4.5 * i, 0.4))

			if dlight then
				dlight.pos = pos
				dlight.r = color.r
				dlight.g = color.g
				dlight.b = color.b
				dlight.brightness = 1
				dlight.Decay = 1000
				dlight.Size = 50
				dlight.DieTime = CurTime() + 0.1
			end

			render.SetMaterial(Material("particle/particle_glow_04_additive"))
			render.DrawSprite(pos, 8, 6, color)
		end
	end
end