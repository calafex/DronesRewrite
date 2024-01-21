AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Spawnable = false
ENT.ToRemove = false

if SERVER then
	function ENT:Initialize()
	    self:SetModel("models/dronesrewrite/railbolt/rail.mdl")
	    self:SetMoveType(MOVETYPE_VPHYSICS)
	    self:SetSolid(SOLID_VPHYSICS)
	    self:PhysicsInit(SOLID_VPHYSICS)

	    local phys = self:GetPhysicsObject()

		phys:EnableDrag(false)
	    if IsValid(phys) then phys:Wake() end
	end

	function ENT:PhysicsCollide(data, physobj)
		local cos = data.OurOldVelocity:Dot(data.HitNormal) / data.OurOldVelocity:Length()
		local oldVelLength = data.OurOldVelocity:LengthSqr()

		local ent = data.HitEntity
		if ent:IsValid() then
			local velocityMult = oldVelLength / 25000000
			if cos <= 0.35 then velocityMult = velocityMult / 3 end

			local damage = 15 * velocityMult * DRONES_REWRITE.ServerCVars.DmgCoef:GetFloat()
			local owner = self.Owner
			ent:TakeDamage(damage, owner, owner)
		end
			
		if oldVelLength > 500000 then
			self:EmitSound("weapons/crossbow/hit1.wav", 80, 130)
			
			if cos > 0.35 then
				local tr = util.TraceLine({
					start = self:GetPos(),
					endpos = self:GetPos() + self:GetForward() * 100,
					filter = self,
					mask = MASK_SOLID_BRUSHONLY
				})
				util.Decal("impact.concrete", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)

				self:Remove()
			end
		end
	end

	function ENT:PhysicsUpdate(phys)
		if self.LastPhys == CurTime() then return end

		local velocityLen = self:GetPhysicsObject():GetVelocity():LengthSqr()
		if velocityLen < 2000000 then phys:EnableGravity(true) end
		if not self.ToRemove and velocityLen < 100 then
			self.ToRemove = true
			timer.Simple(3, function()
				if self:IsValid() then self:Remove() end
			end)
		end

		self.LastPhys = CurTime()
	end
else
	function ENT:Draw()
		self:DrawModel()
	end
end