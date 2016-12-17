include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

ENT.Gibs = {
	"models/gibs/helicopter_brokenpiece_06_body.mdl",
	"models/gibs/helicopter_brokenpiece_05_tailfan.mdl",
	--"models/gibs/helicopter_brokenpiece_04_cockpit.mdl",
	"models/gibs/helicopter_brokenpiece_03.mdl",
	"models/gibs/helicopter_brokenpiece_02.mdl",
	"models/gibs/helicopter_brokenpiece_01.mdl"
}

function ENT:Initialize()
	self.BaseClass.Initialize(self)
	
	self:AddHook("DroneDestroyed", "drone_destroyed", function()	
		self:GetPhysicsObject():AddAngleVelocity(Vector(15, 40, 50))

		for k, v in pairs(self.Gibs) do
			local e = ents.Create("prop_physics")
			e:SetPos(self:GetPos())
			e:SetModel(v)
			e:Spawn()

			local phys = e:GetPhysicsObject()
			phys:ApplyForceCenter(VectorRand() * 500 * phys:GetMass())
			phys:AddAngleVelocity(VectorRand() * 2000)

			if math.random(1, 3) == 1 then e:Ignite(30) end
		end

		util.ScreenShake(self:GetPos(), 30, 2, 5, 20000) 
		self:EmitSound("ambient/explosions/explode_2.wav", 120)
			
		self:Remove()
	end)

	self:AddHook("Physics", "drone_phys", function(phys)
		phys:AddAngleVelocity(Vector(0.7, 0.3, 0.15) * math.sin(CurTime()))
		phys:ApplyForceCenter(Vector(0, 800, 1420) * math.sin(CurTime()))
	end)

	self:AddHook("Think", "drone_think", function()
		if self:WaterLevel() >= 3 then
			self:Destroy()
		end

		self:SetEnabled(true)

		local bone = self:LookupBone("Chopper.Rotor_Blur")
		self:ManipulateBoneAngles(bone, Angle(CurTime() * 3000, 0, 0))

		local bone = self:LookupBone("Chopper.Blade_Hull")
		self:ManipulateBoneAngles(bone, Angle(0, 0, CurTime() * 3000))

		local bone = self:LookupBone("Chopper.Blade_Tail")
		self:ManipulateBoneAngles(bone, Angle(0, 0, CurTime() * 3000))
	end)
end