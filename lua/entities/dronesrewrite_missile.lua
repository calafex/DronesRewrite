AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Spawnable = false

local rSound = Sound("Missile.Accelerate")

if SERVER then
	function ENT:Initialize()
	    self:SetModel("models/dronesrewrite/bigrocket/bigrocket.mdl")
	    self:SetMoveType(MOVETYPE_VPHYSICS)
	    self:SetSolid(SOLID_VPHYSICS)
	    self:PhysicsInit(SOLID_VPHYSICS)

	    local phys = self:GetPhysicsObject()

		phys:EnableDrag(false)
	    if IsValid(phys) then phys:Wake() end
		
	    self.Entity:EmitSound(rSound, 100, 100)
	end

	function ENT:Boom()
		ParticleEffect("splode_big_main", self:GetPos(), Angle(0, 0, 0))	
		
		self:EmitSound("BaseExplosionEffect.Sound", 500, 100)

		local tr = util.TraceLine({
			start = self:GetPos(),
			endpos = self:GetPos() + self:GetForward() * 1024,
			filter = self,
			mask = MASK_SOLID_BRUSHONLY
		})

		util.Decal("DrrBigExpo", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)

		util.BlastDamage(self, IsValid(self:GetOwner()) and self:GetOwner() or self, self:GetPos(), 200, math.random(180,220) * DRONES_REWRITE.ServerCVars.DmgCoef:GetFloat())
		util.ScreenShake(self:GetPos(), 2, 0.5, 1, 1000) 
		
		self:Remove()
	end

	function ENT:PhysicsCollide(data, physobj)
		self:Boom()
	end

	function ENT:OnRemove()
		self.Entity:StopSound(rSound)
	end

	function ENT:Think()
		local ef = EffectData()
		ef:SetOrigin(self:GetPos() - self:GetForward() * 4)
		util.Effect("dronesrewrite_rocketfly", ef, true, true)      

		local phys = self:GetPhysicsObject()
		phys:ApplyForceCenter(self:GetForward() * 10000)

		phys:AddAngleVelocity(VectorRand() * math.sin(CurTime() * 3) * 0.14)

		self:NextThink(CurTime())
		return true
	end
else
	function ENT:Draw()
		self:DrawModel()
	end
end