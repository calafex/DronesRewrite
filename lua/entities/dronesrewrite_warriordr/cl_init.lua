include("shared.lua")

function ENT:Draw()
	self.BaseClass.Draw(self)

	if self:IsDroneWorkable() and not DRONES_REWRITE.ClientCVars.NoGlows:GetBool() then
		local dlight = DynamicLight(self:EntIndex())
		if dlight then
			dlight.pos = self:LocalToWorld(self.FirstPersonCam_pos)
			dlight.r = 255
			dlight.g = 0
			dlight.b = 0
			dlight.brightness = 1
			dlight.Decay = 1000
			dlight.Size = 80
			dlight.DieTime = CurTime() + 0.1
		end
	end
end