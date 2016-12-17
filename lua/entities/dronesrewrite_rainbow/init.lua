include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

function ENT:Initialize()
	self.BaseClass.Initialize(self)

	--self:SetMaterial("models/debug/debugwhite")
	
	self:AddWeapon("Rainbow", {
		Initialize = function(self)
			return DRONES_REWRITE.Weapons["Template"].InitializeNoDraw(self)
		end,

		Attack = function(self, gun)
			if CurTime() > gun.NextShoot then
				if math.random(1, 20) == 1 then
					gun:EmitSound("vo/npc/male01/hacks01.wav", 82, 130)
				end

				gun:EmitSound("garrysmod/save_load" .. math.random(1, 4) .. ".wav", 72)
				gun.NextShoot = CurTime() + math.Rand(0.05, 0.3)
			end
		end,

		Attack2 = function(self, gun) end,
		Think = function(self, gun) end
	})

	self:SelectNextWeapon()
end