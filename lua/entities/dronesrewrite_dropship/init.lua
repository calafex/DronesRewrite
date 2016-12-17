include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

ENT.Chairs = {
	Vector(85.768188, -122, -20),
	Vector(25.768188, -122, -20),

	Vector(85.768188, 122, -20),
	Vector(25.768188, 122, -20)
}

function ENT:AddChairs()
	self:DeletePart(self.ValidChairs)

	self.ValidChairs = { }

	for k, v in pairs(self.Chairs) do
		local e = ents.Create("prop_vehicle_prisoner_pod")
		e:SetModel("models/vehicles/prisoner_pod_inner.mdl")
		e:SetPos(self:LocalToWorld(v))
		e:SetAngles(self:LocalToWorldAngles(Angle(90, 0, 0)))
		e:Spawn()
		e:Activate()

		e:SetKeyValue("limitview", "0")
		e:SetVehicleClass("Pod")
		
		e:SetParent(self)
		--e:PhysicsDestroy()

		e.dronesrewrite_dropship = true

		self.ValidChairs[#self.ValidChairs + 1] = e
	end
end

function ENT:Think()
	self.BaseClass.Think(self)

	for k, v in pairs(self.ValidChairs) do
		if IsValid(v) then
			local driver = v:GetDriver()

			if driver:IsValid() then
				if driver:KeyPressed(IN_RELOAD) then
					self:SetDriver(driver)
				end
			end
		end
	end

	self:NextThink(CurTime())
	return true
end

function ENT:Initialize()
	self.BaseClass.Initialize(self)
	self:AddChairs()
end

hook.Add("PlayerEnteredVehicle", "dronesrewrite_dropship_pods", function(ply, vehicle)
	if vehicle:GetVehicleClass() == "Pod" and vehicle.dronesrewrite_dropship then
		ply:ChatPrint("[Drones] Press [Reload Key] to drive dropship drone")
	end
end)