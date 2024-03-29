AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Spawnable = false

if SERVER then
	function ENT:Initialize()
	    self:SetModel("models/dronesrewrite/lray/lray.mdl")
	    self:SetMoveType(MOVETYPE_VPHYSICS)
	    self:SetSolid(SOLID_VPHYSICS)
	    self:PhysicsInit(SOLID_VPHYSICS)

	    self:DrawShadow(false)
		self:SetColor(Color(255, 255, 255))

	    local phys = self:GetPhysicsObject()

	    phys:SetMass(1)
		phys:EnableDrag(false)
		phys:EnableGravity(false)	
	    phys:Wake()

	    self:SetCustomCollisionCheck(true)
	end

	function ENT:PhysicsUpdate(phys)
		if self.LastPhys == CurTime() then return end

		if self:WaterLevel() >= 3 then self:Remove() end

		phys:ApplyForceCenter(self:GetForward() * 100000)

		self.LastPhys = CurTime()
	end

	function ENT:PhysicsCollide(data, physobj)
		local ent = data.HitEntity
		if ent:IsValid() then
			local owner = self.Owner
			ent:TakeDamage(math.random(8,12) * DRONES_REWRITE.ServerCVars.DmgCoef:GetFloat(), owner, owner)
			if ent.IS_DRR then ent:TakeDamage(math.random(15,30) * DRONES_REWRITE.ServerCVars.DmgCoef:GetFloat(), owner, owner) end
		end

		local tr = util.TraceLine({
			start = self:GetPos(),
			endpos = self:GetPos() + self:GetForward() * 1024,
			filter = self,
			mask = MASK_SOLID_BRUSHONLY
		})

		ParticleEffect("elecray_hit_drr", self:GetPos(), Angle(0, 0, 0))

		util.Decal("FadingScorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)

		self:Remove()
	end
else
	function ENT:Draw()
		local dlight = DynamicLight(self:EntIndex())
		if dlight then
			dlight.pos = self:GetPos()
			dlight.r = 100
			dlight.g = 170
			dlight.b = 255
			dlight.brightness = 1
			dlight.Decay = 1000
			dlight.Size = 300
			dlight.DieTime = CurTime() + 0.3
		end
		
		render.SetMaterial(Material("particle/particle_glow_04_additive"))

		local color = Color(100, 170, 255, 40)
		local xs = 32
		
		render.DrawSprite(self:GetPos() - self:GetForward() * 24, xs, xs, color)
		render.DrawSprite(self:GetPos() - self:GetForward() * 12, xs, xs, color)
		render.DrawSprite(self:GetPos(), xs, xs, color)
		render.DrawSprite(self:GetPos() + self:GetForward() * 12, xs, xs, color)
		render.DrawSprite(self:GetPos() + self:GetForward() * 24, xs, xs, color)

		self:DrawModel()
	end
end