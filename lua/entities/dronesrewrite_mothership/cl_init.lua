include("shared.lua")

local engine = {
	Vector(-880, 450, 180),
	Vector(-880, -450, 180)
}

function ENT:Draw()
	self:DrawModel()

	if not self.Emitter then self.Emitter = ParticleEmitter(Vector(0, 0, 0)) return end

	if self:IsDroneWorkable() and not DRONES_REWRITE.ClientCVars.NoGlows:GetBool() then
		render.SetMaterial(Material("particle/particle_glow_04_additive"))

		for k, v in pairs(engine) do
			local pos = self:LocalToWorld(v)

			render.DrawSprite(pos, 150, 150, Color(255, 125, 0))

			if math.random(1, 5) == 1 then
				local p = self.Emitter:Add("sprites/heatwave", pos)
					
				p:SetDieTime(math.Rand(0.4, 0.8))
				p:SetStartAlpha(70)
				p:SetEndAlpha(0)
				p:SetStartSize(math.Rand(100, 200))
				p:SetRoll(math.Rand(-10, 10))
				p:SetRollDelta(math.Rand(-1, 1))
				p:SetEndSize(50)		
				p:SetCollide(true)
				p:SetGravity(Vector(0, 0, 5))
				p:SetVelocity(-self:GetForward() * math.random(100, 300))
			end
		end

		local dlight = DynamicLight(self:EntIndex())
		if dlight then
			dlight.pos = self:LocalToWorld(Vector(-495, -50, 753))
			dlight.r = 0
			dlight.g = 155
			dlight.b = 255
			dlight.brightness = 3
			dlight.Decay = 1000
			dlight.Size = 1080
			dlight.DieTime = CurTime() + 0.1
		end
	end
end

function ENT:OnRemove() if self.Emitter then self.Emitter:Finish() end end