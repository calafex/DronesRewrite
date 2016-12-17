AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Spawnable = false

if SERVER then
	function ENT:Initialize()
	    self:SetModel("models/dronesrewrite/landmine/landmine.mdl")
	    self:SetMoveType(MOVETYPE_VPHYSICS)
	    self:SetSolid(SOLID_VPHYSICS)
	    self:PhysicsInit(SOLID_VPHYSICS)
	    self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)

	    local phys = self:GetPhysicsObject()

		phys:EnableDrag(false)
	    if IsValid(phys) then phys:Wake() end
	end

	function ENT:Boom()
		self.OnTakeDamage = function() end

		local owner = self.Owner
		if not IsValid(owner) then owner = self end

		util.BlastDamage(self, owner, self:GetPos(), 250, 120 * DRONES_REWRITE.ServerCVars.DmgCoef:GetFloat())

		ParticleEffect("splode_big_main", self:GetPos(), Angle(0, 0, 0))	
		
		self:EmitSound("ambient/explosions/explode_1.wav", 100, 100)
		
		self:Remove()
	end

	function ENT:Think()
		if self.Enabled then
			for k, v in pairs(ents.FindInSphere(self:GetPos(), 64)) do
				--if v:GetClass() == "dronesrewrite_mine" then continue end
				--if v:GetClass() == "dronesrewrite_minedr" then continue end

				if (v:IsPlayer() or v:IsNPC() or v.IS_DRR) and v != self.DroneOwner then
					local phys = v:GetPhysicsObject()

					if phys:IsValid() then
						self:Boom()
					end
				end
			end
		end

		self:NextThink(CurTime() + 0.4)
		return true
	end

	function ENT:PhysicsCollide(data, physobj)
		if self.Enabled then
			if not data.HitEntity:IsWorld() and data.HitEntity:GetVelocity():Length() > 50 then self:Boom() end
		else
			self.Enabled = true
			self:EmitSound("drones/alarm.wav", 60)
		end
	end

	function ENT:OnTakeDamage() self:Boom() end
else
	function ENT:Draw()
		self:DrawModel()
	end
end