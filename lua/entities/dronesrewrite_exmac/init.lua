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
	
	self:AddWeapon("Death Beam", {
		Initialize = function(self)
			return DRONES_REWRITE.Weapons["Template"].InitializeNoDraw(self)
		end,

		Attack = function(self, gun)
			if not gun.StartedAttack then
				gun:EmitSound("ambient/machines/teleport3.wav", 85, 160)
				gun.StartedAttack = true

				timer.Simple(0.6, function()
					if IsValid(gun) then gun:EmitSound("ambient/machines/thumper_startup1.wav", 90, 140) end
				end)
			end

			local tr = util.TraceLine({
				start = gun:GetPos(),
				endpos = gun:GetPos() - self:GetUp() * 100000,
				filter = self
			})

			local ef = EffectData()
			ef:SetStart(Vector(0, 0, 0))
			ef:SetOrigin(tr.HitPos)
			ef:SetEntity(self)

			ef:SetAngles(Angle(255, 255, 255))
			for i = 1, 16 do
				local vec = Vector(math.sin(i) * 7, math.cos(i) * 7, 0)
				ef:SetStart(vec)
				ef:SetOrigin(tr.HitPos + vec)
				util.Effect("dronesrewrite_beam", ef)
			end

			ef:SetAngles(Angle(0, 160, 255))
			for i = 1, 16 do
				local vec = Vector(math.sin(i) * 10, math.cos(i) * 10, 0)
				ef:SetStart(vec)
				ef:SetOrigin(tr.HitPos + vec)
				util.Effect("dronesrewrite_beam", ef)
			end

			if CurTime() > gun.NextShoot then
				util.ScreenShake(tr.HitPos, 4, 16, 2, 4000) 

				ParticleEffect("stinger_explode_drr", tr.HitPos, Angle(0, 0, 0))

				for k, ent in pairs(ents.FindInSphere(tr.HitPos, 150)) do
					local phys = ent:GetPhysicsObject()
					if IsValid(phys) then phys:ApplyForceCenter(VectorRand() * 50 + vector_up * 60) end
					//ent:Ignite(4)
				end

				util.BlastDamage(self, IsValid(self:GetDriver()) and self:GetDriver() or self, tr.HitPos, 150, 120)
				util.Decal("Scorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)

				gun.NextShoot = CurTime() + math.Rand(0.03, 0.15)
			end

			self:SwitchLoopSound("Laser", true, "ambient/energy/force_field_loop1.wav", 90, 1, 100)
			self:SwitchLoopSound("Laser2", true, "ambient/energy/force_field_loop1.wav", 120, 1, 100)
			self:SwitchLoopSound("Laser3", true, "hl1/ambience/alien_minddrill.wav", 90, 1, 85)
		end,

		OnAttackStopped = function(self, gun)
			self:SwitchLoopSound("Laser", false)
			self:SwitchLoopSound("Laser2", false)
			self:SwitchLoopSound("Laser3", false)
			gun:EmitSound("ambient/machines/teleport4.wav", 80, 160)
			gun.StartedAttack = false
		end,

		Holster = function(self, gun)
			self:SwitchLoopSound("Laser", false)
			self:SwitchLoopSound("Laser2", false)
			self:SwitchLoopSound("Laser3", false)
			gun:EmitSound("ambient/machines/teleport4.wav", 80, 160)
			gun.StartedAttack = false
		end,

		OnRemove = function(self, gun)
			self:SwitchLoopSound("Laser", false)
			self:SwitchLoopSound("Laser2", false)
			self:SwitchLoopSound("Laser3", false)
		end,

		Attack2 = function(self, gun) end,
		Think = function(self, gun) end
	})

	self:SelectNextWeapon()
end