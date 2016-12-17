include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

function ENT:Think()
	if IsValid(self.Drone) then
		if self.Drone:IsFarFarAway(self, self.DistanceMaxDRR) or self.Drone:IsDroneDestroyed() then self:SetDrone(NULL) end
	end
end

function ENT:SetDrone(drone)
	if drone:IsValid() then
		if drone:IsDroneDestroyed() then return end
		if drone:IsFarFarAway(self, self.DistanceMaxDRR) then return end
	end

	self.Drone = drone
	self:SetNWEntity("DronesRewriteDrone", drone)
end

function ENT:SetDistance(dist)
	self.DistanceMaxDRR = dist
	self:SetNWInt("Distance", dist * DRONES_REWRITE.ServerCVars.SignalCoef:GetFloat())
end

function ENT:Initialize()
    self:SetModel("models/dronesrewrite/misc/controller.mdl")
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)

    self:SetDrone(NULL)
    self:SetDistance(20000)
end

function ENT:Use(activator, caller)
	if not activator:IsPlayer() then return end
	if activator:GetNWEntity("DronesRewriteDrone"):IsValid() then return end

	net.Start("dronesrewrite_opencontroller")
		net.WriteEntity(self)
	net.Send(activator)
end
