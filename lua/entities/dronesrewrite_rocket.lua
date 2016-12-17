AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Spawnable = false

local rSound = Sound("Missile.Accelerate")

if SERVER then
	function ENT:Initialize()
	    self:SetModel("models/dronesrewrite/rocket_small/rocket_small.mdl")
	    self:SetMoveType(MOVETYPE_VPHYSICS)
	    self:SetSolid(SOLID_VPHYSICS)
	    self:PhysicsInit(SOLID_VPHYSICS)

	    local phys = self:GetPhysicsObject()

		phys:EnableDrag(false)
	    if IsValid(phys) then phys:Wake() end
		
	    self.Entity:EmitSound(rSound, 100, 100)
	end

	function ENT:Think()
		local ef = EffectData()
		ef:SetOrigin(self:GetPos() - self:GetForward() * 4)
		ef:SetStart(self:GetPos() - self:GetForward() * 1000)
		ef:SetScale(0.5)
		util.Effect("dronesrewrite_rocketfly", ef, true, true)      

		local phys = self:GetPhysicsObject()
		phys:ApplyForceCenter(self:GetForward() * 10000)

		phys:AddAngleVelocity(VectorRand() * math.sin(CurTime() * 3) * 0.14)

		self:NextThink(CurTime())
		return true
	end

	function ENT:PhysicsCollide(data,physobj)
		ParticleEffect("splode_fire", self:GetPos(), Angle(0, 0, 0))
		
		self:EmitSound("BaseExplosionEffect.Sound", 500, 100)

		local tr = util.TraceLine({
			start = self:GetPos(),
			endpos = self:GetPos() + self:GetForward() * 1024,
			filter = self,
			mask = MASK_SOLID_BRUSHONLY
		})

		util.Decal("DrrBigExpo", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
		util.BlastDamage(self, IsValid(self:GetOwner()) and self:GetOwner() or self, self:GetPos(), 300, math.random(80,120) * DRONES_REWRITE.ServerCVars.DmgCoef:GetFloat())
		
		self:Remove()
	end

	function ENT:OnRemove()
		self.Entity:StopSound(rSound)
	end
else
	function ENT:Draw()
		self:DrawModel()
	end
end

