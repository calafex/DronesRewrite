include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

function ENT:Initialize()
	self.BaseClass.Initialize(self)
	
	self:AddWeapon("Eyes", {
		Initialize = function(self)
			return DRONES_REWRITE.Weapons["Template"].InitializeNoDraw(self)
		end,

		Attack = function(self, gun)
			local tr = self:GetCameraTraceLine()

			local ef = EffectData()
			ef:SetStart(Vector(1, -1, 5))
			ef:SetOrigin(tr.HitPos)
			ef:SetEntity(self)
			ef:SetAngles(Angle(255, 0, 0)) -- Color
			util.Effect("dronesrewrite_beam", ef)

			ef:SetStart(Vector(1, 1, 5))
			util.Effect("dronesrewrite_beam", ef)

			if CurTime() > gun.NextShoot then
				util.ScreenShake(tr.HitPos, 2, 2, 2, 100) 
				--ParticleEffect("skull_impact_fire", tr.HitPos, Angle(0, 0, 0))

				for k, ent in pairs(ents.FindInSphere(tr.HitPos, 100)) do
					local phys = ent:GetPhysicsObject()
					if IsValid(phys) then phys:ApplyForceCenter(VectorRand() * 50 + vector_up * 60) end
				end

				util.BlastDamage(self, IsValid(self:GetDriver()) and self:GetDriver() or self, tr.HitPos, 100, 8)

				--sound.Play("ambient/explosions/explode_" .. math.random(1, 4) .. ".wav", tr.HitPos, 90, 100, 1)

				gun.NextShoot = CurTime() + math.Rand(0.03, 0.15)
			end

			self:SwitchLoopSound("Laser", true, "ambient/energy/force_field_loop1.wav", 120, 1)
		end,

		OnAttackStopped = function(self, gun)
			self:SwitchLoopSound("Laser", false)
		end,

		Holster = function(self, gun)
			self:SwitchLoopSound("Laser", false)
		end,

		OnRemove = function(self, gun)
			self:SwitchLoopSound("Laser", false)
		end,

		Attack2 = function(self, gun) end,
		Think = function(self, gun) end
	})

	self:SelectNextWeapon()
end