AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Spawnable = false

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

	function ENT:PhysicsCollide(data,physobj)
		self:EmitSound("weapons/crossbow/hit1.wav", 80, 130)
		
		local ent = data.HitEntity
		if ent:IsValid() then
			local owner = self.Owner
			ent:TakeDamage(math.random(12,15) * DRONES_REWRITE.ServerCVars.DmgCoef:GetFloat(), owner, owner)
		end

		local tr = util.TraceLine({
			start = self:GetPos(),
			endpos = self:GetPos() + self:GetForward() * 1024,
			filter = self,
			mask = MASK_SOLID_BRUSHONLY
		})
		util.Decal("impact.concrete", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
		
		self:Remove()
	end
else
	function ENT:Draw()
		self:DrawModel()
	end
end