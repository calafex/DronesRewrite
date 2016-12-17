include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

function ENT:Initialize()
	self.BaseClass.Initialize(self)

	self:AddHook("DroneDestroyed", "drone_destroyed", function()
		for i = 1, 6 do
			self:EmitSound("ambient/explosions/explode_" .. math.random(1, 3) .. ".wav", math.random(80, 100), math.random(90, 120))
		end
	end)
	
	self:AddWeapon("Turrets", {
		Initialize = function(self, pos, ang)
			pos = Vector(40, 44, 63)
			local ent = DRONES_REWRITE.Weapons["Template"].Initialize(self, "models/props_junk/PopCan01a.mdl", pos, ang)
			
			ent:SetNoDraw(true)
			ent:DrawShadow(false)
			ent.Handler:Remove()

			ent.NoDrawWeapon = true

			local e1 = DRONES_REWRITE.Weapons["Template"].SpawnSource(ent, Vector(18, 0, 0))
			e1:SetParent(self)
			local e2 = DRONES_REWRITE.Weapons["Template"].SpawnSource(ent, Vector(18, -88, 0))
			e2:SetParent(self)

			ent.PrimaryAmmo = 500
			ent.PrimaryAmmoMax = 500
			ent.PrimaryAmmoType = { DRONES_REWRITE.AmmoTypes.Blaster }

			return ent
		end,

		Think = function(self, gun)
			DRONES_REWRITE.Weapons["Template"].Think(self, gun)
		end,

		Attack = function(self, gun)
			if CurTime() > gun.NextShoot and gun:HasPrimaryAmmo() then
				-- Firsr
				do
					local src = gun.Source:GetPos()

					local ammo = ents.Create("dronesrewrite_gr_laser_sm")
					ammo:SetPos(src)
					ammo:SetAngles(gun.Source:GetAngles() + AngleRand() * 0.004)
					ammo:Spawn()
					ammo.Owner = self:GetDriver()
					
					constraint.NoCollide(ammo, self, 0, 0)

					ammo:EmitSound("drones/alien_fire.wav", 85, 100, 1, CHAN_WEAPON)

					local ef = EffectData()
					ef:SetOrigin(src - gun.Source:GetForward() * 20)
					ef:SetNormal(gun.Source:GetForward())
					util.Effect("dronesrewrite_muzzleflashblaster3", ef)
				end

				-- Second
				do
					local src = gun.Source2:GetPos()

					local ammo = ents.Create("dronesrewrite_gr_laser_sm")
					ammo:SetPos(src)
					ammo:SetAngles(gun.Source2:GetAngles() + AngleRand() * 0.004)
					ammo:Spawn()
					ammo.Owner = self:GetDriver()
					
					constraint.NoCollide(ammo, self, 0, 0)

					ammo:EmitSound("drones/alien_fire.wav", 85, 100, 1, CHAN_WEAPON)

					local ef = EffectData()
					ef:SetOrigin(src - gun.Source2:GetForward() * 20)
					ef:SetNormal(gun.Source2:GetForward())
					util.Effect("dronesrewrite_muzzleflashblaster3", ef)
				end

				gun:SetPrimaryAmmo(-1)
				gun.NextShoot = CurTime() + 0.03
			end
		end,

		Attack2 = function() end
	})

	--self:SelectNextWeapon()
end