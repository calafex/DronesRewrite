include("shared.lua")

function ENT:Draw()
	self.BaseClass.Draw(self)

	if self:IsDroneWorkable() and not DRONES_REWRITE.ClientCVars.NoGlows:GetBool() then
		local dlight = DynamicLight(self:EntIndex())
		if dlight then
			dlight.pos = self:LocalToWorld(Vector(12, 0, 0))
			dlight.r = 0
			dlight.g = 255
			dlight.b = 255
			dlight.brightness = 1
			dlight.Decay = 1000
			dlight.Size = 80
			dlight.DieTime = CurTime() + 0.1
		end

		if not self.Emitter then self.Emitter = ParticleEmitter(Vector(0, 0, 0)) return end

		if math.random(1, 15) == 1 then
			local p = self.Emitter:Add("particle/smokesprites_000" .. math.random(1, 9), self:LocalToWorld(Vector(-7.5, 16, 0)))
				
			p:SetDieTime(math.Rand(0.5, 1.5))
			p:SetStartAlpha(70)
			p:SetEndAlpha(0)
			p:SetStartSize(math.Rand(0.5, 1))
			p:SetRoll(math.Rand(-10, 10))
			p:SetRollDelta(math.Rand(-1, 1))
			p:SetEndSize(5)		
			p:SetCollide(true)
			p:SetGravity(Vector(0, 0, 5))
			p:SetVelocity(VectorRand() * 2 - self:GetRight() * 7 - self:GetForward() * 6)
			p:SetColor(0, 255, 255)
		end
	end
end

function ENT:OnRemove() 
	if IsValid(self.Emitter) then self.Emitter:Finish() end 
end