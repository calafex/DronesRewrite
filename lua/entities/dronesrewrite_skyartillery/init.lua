include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

function ENT:SpawnDebris(mdl)
	local e = ents.Create("prop_physics")
	e:SetPos(self:GetPos() + VectorRand() * 150)
	e:SetModel(mdl)
	e:Spawn()

	local phys = e:GetPhysicsObject()
	phys:ApplyForceCenter(VectorRand() * 320000)
	phys:AddAngleVelocity(VectorRand() * 2000)

	if math.random(1, 3) == 1 then e:Ignite(30) end

	return e
end

function ENT:Initialize()
	self.BaseClass.Initialize(self)
	
	self:AddHook("DroneDestroyed", "drone_destroyed", function()
		local ef = EffectData()
		ef:SetOrigin(self:GetPos())
		util.Effect("dronesrewrite_explosionbig", ef)

		for i = 1, 4 do
			local e = self:SpawnDebris("models/dronesrewrite/skyartillery/deb1/deb1.mdl")
			e:SetAngles(Angle(0, 90 * i, 0))
		end

		self:SpawnDebris("models/dronesrewrite/skyartillery/deb2/deb1.mdl")
		self:SpawnDebris("models/dronesrewrite/skyartillery/deb3/deb1.mdl")
		self:SpawnDebris("models/dronesrewrite/skyartillery/deb4/deb1.mdl")
		self:SpawnDebris("models/dronesrewrite/skyartillery/deb5/deb1.mdl")

		util.ScreenShake(self:GetPos(), 30, 2, 5, 20000) 

		self:Remove()
	end)
end