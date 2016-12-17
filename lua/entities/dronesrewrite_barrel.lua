AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Spawnable = false
ENT.PrintName = "Fuel Barrel"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite Tools"

ENT.AdminOnly = true

if SERVER then
	ENT.HP = 50
	
	function ENT:SpawnFunction(ply, tr, class)
		if not tr.Hit then return end

		local pos = tr.HitPos + tr.HitNormal * 16

		local ent = ents.Create(class)
		ent:SetPos(pos)
		ent:SetAngles(Angle(0, 0, 0))
		ent:Spawn()
		ent:Activate()

		return ent
	end

	function ENT:Initialize()
	    self:SetModel("models/props_c17/oildrum001_explosive.mdl")
	    self:SetMoveType(MOVETYPE_VPHYSICS)
	    self:SetSolid(SOLID_VPHYSICS)
	    self:PhysicsInit(SOLID_VPHYSICS)

	    local phys = self:GetPhysicsObject()
	    phys:Wake()
	end

	function ENT:OnTakeDamage(dmg)
		self:TakePhysicsDamage(dmg)
		self.HP = self.HP - dmg:GetDamage()

		if self.HP <= 0 then
			self.OnTakeDamage = function() end

			local ef = EffectData()
			ef:SetOrigin(self:GetPos())
			ef:SetStart(self:GetPos())
			util.Effect("Explosion", ef)

			util.BlastDamage(self, self, self:GetPos(), 100, 100)

			self:Remove()
		end
	end

	function ENT:PhysicsCollide(data, physobj)
		if data.DeltaTime > 0.1 then
			local ent = data.HitEntity
			if IsValid(ent) and ent.IS_DRR then
				ent:SetFuel(ent.MaxFuel)
			end
		end
	end
else
	function ENT:Draw()
		self:DrawModel()
	end
end