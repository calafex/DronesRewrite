include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

function ENT:ReturnToPump()
	if not IsValid(self.Station) then return end

	self:SetParent(NULL)

	self:SetPos(self.Station:LocalToWorld(Vector(0, -20, 50)))
	self:SetAngles(Angle(0, 0, 90) + self.Station:GetAngles())
	self:SetNWEntity("DronesRewriteDrone", NULL)

	constraint.Weld(self.Station, self, 0, 0, 1000)
	self:EmitSound("garrysmod/balloon_pop_cute.wav")
end

function ENT:SpawnFunction(ply, tr, class)
	if not tr.Hit then return end

	local pos = tr.HitPos + tr.HitNormal * 16

	self.Station = ents.Create("prop_physics")
	self.Station:SetPos(pos)
	self.Station:SetAngles(Angle(0, 0, 0))
	self.Station:SetModel("models/props_wasteland/gaspump001a.mdl")
	self.Station:Spawn()
	self.Station:Activate()

	local ent = ents.Create(class)
	ent:Spawn()
	ent:Activate()

	local constraint, rope = constraint.Rope(
		self.Station, 
		ent, 
		0, 
		0, 
		Vector(0, -18, 57), 
		Vector(0, 0, 0), 
		0,
		150, 
		0, 
		1, 
		"cable/cable2", 
		false)

	return ent
end

function ENT:Initialize()
	self.Entity:SetModel("models/props_wasteland/prison_pipefaucet001a.mdl")
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)

	self:ReturnToPump()
end

function ENT:Think()
	if not IsValid(self.Station) then SafeRemoveEntity(self) return end

	if self.Return then self:ReturnToPump() self.Return = false end

	local drone = self:GetNWEntity("DronesRewriteDrone")
	if drone:IsValid() then
		if self.Station:GetPos():Distance(drone:LocalToWorld(self.Pos)) > 200 then
			self.Return = true
		end

		drone:SetFuel(drone:GetFuel() + 0.3)
	end

	self:NextThink(CurTime() + 0.1)
	return true
end

function ENT:PhysicsCollide(data, phys)
	local ent = data.HitEntity

	if ent:IsValid() then
		if ent.IS_DRR and not self:GetNWEntity("DronesRewriteDrone"):IsValid() then
			self.Pos = ent:WorldToLocal(self:GetPos())
			self:SetNWEntity("DronesRewriteDrone", ent)
			self:SetParent(ent)
		end

		if ent == self.Station then
			self.Return = true
		end
	end
end

function ENT:OnRemove()
	SafeRemoveEntity(self.Station)
end