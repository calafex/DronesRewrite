AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Spawnable = false

if SERVER then
	function ENT:Initialize()
	    self:SetModel("models/dronesrewrite/artillery_ammo_proj/artillery_ammo_proj.mdl")
	    self:SetMoveType(MOVETYPE_VPHYSICS)
	    self:SetSolid(SOLID_VPHYSICS)
	    self:PhysicsInit(SOLID_VPHYSICS)
		
	    self:StartMotionController()

	    local phys = self:GetPhysicsObject()

		phys:EnableDrag(false)
	    if IsValid(phys) then phys:Wake() end
	end

	function ENT:PhysicsSimulate(phys, dt)
		local force = Vector(0, 0, 0)
		local angForce = Vector(0, 0, 0)

		force = force + Vector(0, 0, GetConVarNumber("sv_gravity") * 20)

		force = force * dt
		angForce = angForce * dt

		return angForce, force, SIM_GLOBAL_ACCELERATION
	end

	function ENT:PhysicsCollide(data,physobj)
		//ParticleEffect("splode_fire", self:GetPos(), Angle(0, 0, 0))
		
		ParticleEffect("splode_big_main", self:GetPos(), Angle(0, 0, 0))		
		
		self:EmitSound("BaseExplosionEffect.Sound", 500, 100)

		local tr = util.TraceLine({
			start = self:GetPos(),
			endpos = self:GetPos() + self:GetForward() * 1024,
			filter = self,
			mask = MASK_SOLID_BRUSHONLY
		})

		util.Decal("DrrBigExpo", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
		util.BlastDamage(self, IsValid(self:GetOwner()) and self:GetOwner() or self, self:GetPos(), 300, math.random(450,600) * DRONES_REWRITE.ServerCVars.DmgCoef:GetFloat())
		
		self:Remove()
	end

	function ENT:OnRemove()
		self:StopMotionController()
	end
else
	function ENT:Draw()
		self:DrawModel()
	end
end

