include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

function ENT:Initialize()
	self.BaseClass.Initialize(self)
	
	self:AddHook("DroneDestroyed", "drone_destroyed", function()
		ParticleEffect("stinger_explode_drr", self:GetPos(), Angle(0, 0, 0))
	end)
end