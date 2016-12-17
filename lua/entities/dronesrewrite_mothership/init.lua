include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

ENT.Gibs = {
	"models/props_debris/metal_panel01a.mdl",
	"models/props_debris/metal_panelchunk02e.mdl",
	"models/props_debris/metal_panelchunk01f.mdl",
	"models/props_debris/concrete_chunk04a.mdl",
	"models/props_debris/concrete_chunk01a.mdl",
	"models/props_combine/combine_intmonitor003.mdl",
}

for k, v in pairs(ENT.Gibs) do
	util.PrecacheModel(v)
end

ENT.Stuff = {
	--{ mdl = "models/mechanics/solid_steel/step_beam_16.mdl", pos = Vector(-290, -302, 570), ang = Angle(45, 0, 0) },
	{ mdl = "models/props_combine/combine_interface001.mdl", pos = Vector(-590, -75, 650), ang = Angle(0, 0, 0) },
	{ mdl = "models/props_wasteland/cargo_container01b.mdl", pos = Vector(-147, 242, 550), ang = Angle(0, 90, 0) },
	{ mdl = "models/props_wasteland/cargo_container01.mdl", pos = Vector(-147, 80, 550), ang = Angle(0, 85, 0) },
	{ mdl = "models/props_junk/wood_crate001a.mdl", pos = Vector(-320, -50, 510), ang = Angle(0, 25, 0) },
	{ mdl = "models/props_junk/wood_crate001a.mdl", pos = Vector(-250, -55, 510), ang = Angle(0, 73, 0) },
	{ mdl = "models/props_c17/concrete_barrier001a.mdl", pos = Vector(-100, -85, 490), ang = Angle(0, -10, 0) },
}

for k, v in pairs(ENT.Stuff) do
	util.PrecacheModel(v.mdl)
end

function ENT:AddChair()
	self:DeletePart(self.ValidChair)

	local e = ents.Create("prop_vehicle_prisoner_pod")
	e:SetModel("models/nova/chair_office02.mdl")
	e:SetPos(self:LocalToWorld(Vector(-511, 40, 667)))
	e:SetAngles(self:LocalToWorldAngles(Angle(0, -80, 0)))
	e:Spawn()
	e:Activate()
	e:SetParent(self)
	--e:PhysicsDestroy()

	e:SetKeyValue("limitview", "0")
	e:SetVehicleClass("Chair_Office2")

	self.ValidChair = e
end

function ENT:AddStuff()
	if DRONES_REWRITE.ServerCVars.MS_DontSpawnStuff:GetBool() then return end

	self:DeletePart(self.ValidStuff)

	self.ValidStuff = { }

	for k, v in pairs(self.Stuff) do
		local e = ents.Create("prop_physics")
		e:SetModel(v.mdl)
		e:SetPos(self:LocalToWorld(v.pos))
		e:SetAngles(self:LocalToWorldAngles(v.ang))
		e:Spawn()
		e:Activate()
		e:SetParent(self)
		--e:PhysicsDestroy()

		self.ValidStuff[k] = e
	end
end

function ENT:AddConsole()
	self:DeletePart(self.ValidConsole)

	local e = ents.Create("dronesrewrite_console")
	e:SetPos(self:LocalToWorld(Vector(-470, 40, 665)))
	e:SetAngles(self:GetAngles() + Angle(0, 180, 0))
	e:Spawn()
	e:Activate()
	e:SetParent(self)
	--e:PhysicsDestroy()

	timer.Simple(3, function()
		if IsValid(self) and IsValid(e) then
			e:AddLine("")
			e:AddLine("Found installed module: MothershipConsole")
			e:AddLine("Changing console type...")
			e:AddLine("Console type: Mothership - " .. self:GetUnit() .. " unit")
			e:AddLine("Mothership console initialized")
			e:AddLine("To control me type control " .. self:GetUnit())
			e:AddLine("")
		end
	end)

	self.ValidConsole = e
end

function ENT:Initialize()
	self.BaseClass.Initialize(self)
	
	self:AddChair()
	self:AddConsole()
	self:AddStuff()

	self:AddHook("TakeDamage", "fakeexplosions", function(dmg)
		if math.random(1, 15) == 1 then
			local ef = EffectData()
			local vec = VectorRand()
			vec.z = vec.z / 5
			ef:SetOrigin(self:GetPos() + self:GetUp() * 500 + vec * 500)
			util.Effect("Explosion", ef)
		end
	end)

	self:AddHook("DroneDestroyed", "drone_destroyed", function()
		util.ScreenShake(self:GetPos(), 30, 2, 5, 20000) 

		local name = "dronesrewrite_msexplo" .. self:EntIndex()
		hook.Add("Think", name, function()
			if IsValid(self) then
				if math.random(1, 20) == 1 then
					local vec = VectorRand()
					vec.z = vec.z / 3
					
					ParticleEffect("splode_big_drone_main", self:GetPos() + self:GetUp() * 500 + vec * 500, Angle(0, 0, 0))

					self:EmitSound("ambient/explosions/explode_1.wav", 135)
				end
			else
				hook.Remove("Think", name)
			end
		end)

		timer.Simple(2.3, function()
			if not IsValid(self) then return end

			self:EmitSound("ambient/explosions/citadel_end_explosion2.wav", 140)

			local ef = EffectData()
			ef:SetOrigin(self:GetPos())
			util.Effect("dronesrewrite_explosionms", ef)

			for i = 1, 200 do
				local e = ents.Create("prop_physics")
				e:SetPos(self:GetPos() + VectorRand() * 800)
				e:SetAngles(AngleRand())
				e:SetModel(table.Random(self.Gibs))
				e:Spawn()
				e:SetColor(Color(25, 10, 10))
				e:SetModelScale(2, 0)

				local phys = e:GetPhysicsObject()
				phys:SetMass(100)
				phys:ApplyForceCenter(VectorRand() * 99999)
				phys:AddAngleVelocity(VectorRand() * 99999)

				if math.random(1, 2) == 1 then e:Ignite(30) end
			end

			local ef = EffectData()
			ef:SetOrigin(self:GetPos())
			util.Effect("dronesrewrite_explosionbig", ef)

			local name = "dronesrewrite_msexplof" .. self:EntIndex()
			local pos = self:GetPos()
			
			for k, v in pairs(ents.FindInSphere(pos, 10000)) do
				local phys = v:GetPhysicsObject()
				if IsValid(phys) then
					local dist = pos:Distance(v:GetPos())
					phys:SetVelocity((v:GetPos() - pos):GetNormal() * phys:GetMass() * (10000 - dist) * 0.05)
				end
			end

			util.ScreenShake(self:GetPos(), 60, 20, 5, 30000) 
			self:Remove()
		end)
	end)
end