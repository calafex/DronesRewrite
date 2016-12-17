include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

function ENT:Initialize()
	self.BaseClass.Initialize(self)
	
	self:AddHook("DroneDestroyed", "drone_destroyed", function()		
		local e = ents.Create("prop_physics")
		e:SetPos(self:GetPos())
		e:SetModel("models/props_junk/watermelon01.mdl")
		e:Spawn()

		e:Fire("break")

		self:Remove()
	end)

	for k, v in pairs(self.ValidWeapons) do
		v.SetPrimaryAmmo = function() end
	end

	self:AddHook("Think", "drone_think", function()
		if math.random(1, 300) == 1 then
			self:EmitSound(table.Random(self.Sounds.Wind), 120)
		end
	end)

	
end