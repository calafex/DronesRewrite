AddCSLuaFile()

function EFFECT:Init(data)
	if DRONES_REWRITE.ClientCVars.NoMuzzleFlash:GetBool() then return end
	
	self.Start = data:GetOrigin()
	self.Forward = data:GetNormal()

	self.Emitter = ParticleEmitter(self.Start)

	local dlight = DynamicLight(self:EntIndex())
	if dlight then
		dlight.pos = self.Start
		dlight.r = 0
		dlight.g = 150
		dlight.b = 100
		dlight.brightness = 1
		dlight.Decay = 1
		dlight.Size = math.random(150, 300)
		dlight.DieTime = CurTime()
	end

	for i = 1, 5 do
		local p = self.Emitter:Add("effects/muzzleflash"..math.random(1, 4), self.Start + i * 4 * self.Forward)

		p:SetVelocity(10 * VectorRand())

		p:SetDieTime(math.Rand(0.04, 0.1))

		p:SetStartAlpha(255)

		p:SetStartSize(25 - i * 2)
		p:SetEndSize(0)

		p:SetRoll(math.Rand(180, 480))
		p:SetRollDelta(math.Rand(-1, 1))

		p:SetColor(0, 150, 255)	
	end
	
	self.Emitter:Finish()
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end





