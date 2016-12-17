include("shared.lua")

function ENT:Draw()
	self.BaseClass.Draw(self)
	
	if not self.Emitter then self.Emitter = ParticleEmitter(Vector(0, 0, 0)) end

	if self:IsDroneWorkable() and not DRONES_REWRITE.ClientCVars.NoGlows:GetBool() then
		if math.random(1, 2) == 1 then
			local p = self.Emitter:Add("sprites/light_glow02_add", self:GetPos())
						
			p:SetDieTime(math.Rand(0.4, 0.8))
			p:SetStartAlpha(255)
			p:SetEndAlpha(0)
			p:SetStartSize(30)
			p:SetRoll(math.Rand(-10, 10))
			p:SetRollDelta(math.Rand(-1, 1))
			p:SetEndSize(5)		
			p:SetCollide(true)
			p:SetGravity(Vector(0, 0, -5))
			p:SetColor(math.random(0, 255), math.random(0, 255), math.random(0, 255))

			p:SetVelocity(VectorRand() * 80)
		end
	end
end

function ENT:OnRemove() if self.Emitter then self.Emitter:Finish() end end