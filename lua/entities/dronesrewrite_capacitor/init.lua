include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

ENT.DamageForceCoef = 0

function ENT:Initialize()
	self.BaseClass.Initialize(self)

	self:AddHook("Think", "drone_shock", function()
		if self:IsDroneWorkable() then self.DamageForceCoef = math.Approach(self.DamageForceCoef, 100, 0.00075) end
	end)
end

function ENT:PhysicsCollide(data, phys)
	self.BaseClass.PhysicsCollide(self, data, phys)

	if not self:IsDroneWorkable() then return end
	
	if data.DeltaTime > 0.2 then
		local ply = data.HitEntity

		if IsValid(ply) then
			ply:TakeDamage(10 * self.DamageForceCoef * DRONES_REWRITE.ServerCVars.DmgCoef:GetFloat())
			ParticleEffect("electrical_arc_01_system", data.HitPos, Angle(0, 0, 0))
			self:EmitSound("ambient/energy/zap" .. math.random(1, 3) .. ".wav", math.Clamp(50 * self.DamageForceCoef, 50, 75))

			self.DamageForceCoef = math.Approach(self.DamageForceCoef, 0, 0.5)
		end
	end
end