AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Spawnable = false

local rSound = Sound("Missile.Accelerate")

if SERVER then
	function ENT:Initialize()
	    self:SetModel("models/dronesrewrite/hrocket_cl/hrocket_cl.mdl")
	    self:SetMoveType(MOVETYPE_VPHYSICS)
	    self:SetSolid(SOLID_VPHYSICS)
	    self:PhysicsInit(SOLID_VPHYSICS)

	    local phys = self:GetPhysicsObject()

	    if IsValid(phys) then phys:SetMass(20) phys:Wake() end

	    timer.Simple(0.2, function()
	    	if IsValid(self) then 
	    		self:SetModel("models/dronesrewrite/hrocket/hrocket.mdl")
	    		self.Entity:EmitSound("drones/alarm.wav", 65, 150)
	    		self.Entity:EmitSound(rSound, 75, 100)
	    		self.Enabled = true 
	    	end
	    end)
	end

	function ENT:Think()
		if not self.Enabled then return end

		local ef = EffectData()
		ef:SetOrigin(self:GetPos() - self:GetForward() * 24)
		util.Effect("dronesrewrite_rocketfly", ef, true, true)         

		local phys = self:GetPhysicsObject()
		phys:ApplyForceCenter(self:GetForward() * 10000)

		phys:AddAngleVelocity(VectorRand() * math.sin(CurTime() * 3) * 0.12)

		self:NextThink(CurTime())
		return true
	end

	function ENT:Boom()
		if not self.Enabled then return end

		ParticleEffect("splode_big_main", self:GetPos(), Angle(0, 0, 0))		
		
		self:EmitSound("BaseExplosionEffect.Sound", 500, 100)

		local tr = util.TraceLine({
			start = self:GetPos(),
			endpos = self:GetPos() + self:GetForward() * 1024,
			filter = self,
			mask = MASK_SOLID_BRUSHONLY
		})

		util.Decal("DrrBigExpo", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)

		local att = self.Owner:IsValid() and self.Owner or self
		util.BlastDamage(att, att, self:GetPos(), 700, math.random(280,320) * DRONES_REWRITE.ServerCVars.DmgCoef:GetFloat())
		util.ScreenShake(self:GetPos(), 30, 2, 5, 3000) 
		
		self:Remove()
	end

	function ENT:PhysicsCollide(data, physobj)
		if data.Speed < 400 then return end
		self:Boom()
	end

	function ENT:OnRemove()
		self.Entity:StopSound(rSound)
	end
else
	function ENT:Draw()
		self:DrawModel()
	end
end