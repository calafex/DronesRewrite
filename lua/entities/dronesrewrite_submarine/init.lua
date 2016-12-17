include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

function ENT:Initialize()
	self.BaseClass.Initialize(self)

	local weptab = {
		Initialize = function(self, pos, ang)
			local ent = DRONES_REWRITE.Weapons["Template"].InitializeNoDraw(self)
			ent.NoSelecting = true

			ent.RespawnRocket = function()
				if IsValid(ent.Rocket) then return end

				if not ent:HasPrimaryAmmo() then
					ent.WaitForAmmo = true
					return
				end

				local e = ents.Create("prop_physics")
				e:SetModel("models/dronesrewrite/hrocket_cl/hrocket_cl.mdl")
				e:SetPos(self:GetPos() - self:GetUp() * 27 - ent:GetForward() * 5 + self:GetRight() * 9 * 1)
				e:SetAngles(ent:GetAngles())
				e:Spawn()
				e:Activate()
				e:SetParent(ent)
				e:SetNotSolid(true)
				e:PhysicsDestroy()

				ent.Rocket = e
			end

			ent:RespawnRocket()

			ent.PrimaryAmmo = 25
			ent.PrimaryAmmoMax = 25
			ent.PrimaryAmmoType = { DRONES_REWRITE.AmmoTypes.Rockets }

			return ent
		end,

		Think = function(self, gun)
			if IsValid(gun.Missile) then
				local enemy = gun.Missile.Enemy

				if IsValid(enemy) then
					if enemy == gun.Missile then gun.Missile.Enemy = NULL return end

					local tang = (enemy:GetPos() - gun.Missile:GetPos()):GetNormal():Angle()
					local sang = gun.Missile:GetAngles()

					local p = math.NormalizeAngle(tang.p - sang.p)
					local y = math.NormalizeAngle(tang.y - sang.y)
					local r = -math.NormalizeAngle(sang.r)

					local phys = gun.Missile:GetPhysicsObject()
					phys:AddAngleVelocity(Vector(r, p, y) * 8)
					phys:AddAngleVelocity(-phys:GetAngleVelocity() * 0.4)

					if gun.Missile:GetPos():Distance(enemy:GetPos()) <= 150 then 
						gun.Missile:Boom()
					end
				elseif gun.Missile.Enabled then
					local tang = (gun.Missile.AimPos - gun.Missile:GetPos()):GetNormal():Angle()
					local sang = gun.Missile:GetAngles()

					local p = math.NormalizeAngle(tang.p - sang.p)
					local y = math.NormalizeAngle(tang.y - sang.y)
					local r = -math.NormalizeAngle(sang.r)

					local phys = gun.Missile:GetPhysicsObject()
					phys:AddAngleVelocity(Vector(r, p, y) * 8)
					phys:AddAngleVelocity(-phys:GetAngleVelocity() * 0.3)

					if gun.Missile:GetPos():Distance(gun.Missile.AimPos) <= 40 then 
						gun.Missile:Boom()
					end
				end
			end

			if gun.WaitForAmmo and gun:HasPrimaryAmmo() then
				gun:RespawnRocket()
				gun.WaitForAmmo = false
			end

			if not IsValid(gun.Rocket) and CurTime() > gun.NextShoot then
				gun:RespawnRocket()
			end
		end,

		Attack = function(self, gun)
			if CurTime() > gun.NextShoot and gun:HasPrimaryAmmo() then
				if not IsValid(gun.Rocket) then return end
				if IsValid(gun.Missile) then gun.Missile.Follow = true end

				local ammo = ents.Create("dronesrewrite_rocketbig")
				local tr = self:GetCameraTraceLine()
				ammo.Enemy = tr.Entity
				ammo.AimPos = tr.HitPos
				ammo.Owner = self:GetDriver():IsValid() and self:GetDriver() or self
				ammo:SetPos(gun.Rocket:GetPos())
				ammo:SetAngles(gun:GetAngles())
				ammo:Spawn()
				ammo:EmitSound("weapons/rpg/rocketfire1.wav", 75, 100, 1, CHAN_WEAPON)
				constraint.NoCollide(ammo, self, 0, 0)

				local physamm = ammo:GetPhysicsObject()
				if IsValid(physamm) then physamm:ApplyForceCenter(ammo:GetForward() * 12000) end 
				gun.Missile = ammo

				SafeRemoveEntity(gun.Rocket)

				gun:SetPrimaryAmmo(-1)
				gun.NextShoot = CurTime() + 1
			end
		end
	}

	self:AddWeapon("Rocket1", weptab)
	weptab.Initialize = function(self, pos, ang)
		local ent = DRONES_REWRITE.Weapons["Template"].InitializeNoDraw(self)
		ent.NoSelecting = true

		ent.RespawnRocket = function()
			if IsValid(ent.Rocket) then return end

			if not ent:HasPrimaryAmmo() then
				ent.WaitForAmmo = true
				return
			end

			local e = ents.Create("prop_physics")
			e:SetModel("models/dronesrewrite/hrocket_cl/hrocket_cl.mdl")
			e:SetPos(self:GetPos() - self:GetUp() * 27 - ent:GetForward() * 5 + self:GetRight() * 9 * -1)
			e:SetAngles(ent:GetAngles())
			e:Spawn()
			e:Activate()
			e:SetParent(ent)
			e:SetNotSolid(true)
			e:PhysicsDestroy()

			ent.Rocket = e
		end

		ent:RespawnRocket()

		ent.PrimaryAmmo = 25
		ent.PrimaryAmmoMax = 25
		ent.PrimaryAmmoType = { DRONES_REWRITE.AmmoTypes.Rockets }

		return ent
	end

	self:AddWeapon("Rocket2", weptab)

	self:FastAddWeapon("Rockets", "Empty", nil, {
		["Rocket1"] = { fire1 = "fire2" },
		["Rocket2"] = { fire1 = "fire1" }
	})

	self:SelectNextWeapon()
end