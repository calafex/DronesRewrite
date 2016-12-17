include("shared.lua")

function ENT:Draw()
	self.BaseClass.Draw(self)

	if self:IsDroneWorkable() and not DRONES_REWRITE.ClientCVars.NoGlows:GetBool() then
		local pos = self:GetAttachment(self:LookupAttachment("light")).Pos
		local dlight = DynamicLight(self:EntIndex())
		if dlight then
			dlight.pos = pos
			dlight.r = 0
			dlight.g = 255
			dlight.b = 0
			dlight.brightness = 1
			dlight.Decay = 1000
			dlight.Size = 80
			dlight.DieTime = CurTime() + 0.1
		end

		render.SetMaterial(Material("particle/particle_glow_04_additive"))
		render.DrawSprite(pos, 8, 8, Color(0, 255, 0, 100))
	end
end

function ENT:Think()
	self.BaseClass.Think(self)

	local cam = self:GetCamera()

	if cam:IsValid() then
		local ang = self:WorldToLocalAngles(cam:GetAngles())

		self:SetPoseParameter("aim_yaw", ang.y)
		self:SetPoseParameter("aim_pitch", ang.p)

		self:InvalidateBoneCache()
	end
end