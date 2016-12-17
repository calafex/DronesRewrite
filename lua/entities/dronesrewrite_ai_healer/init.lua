include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

ENT.NextHeal = 0
ENT.HealthAmount = 40

function ENT:OnRemove() 
	if self.Sound then self.Sound:Stop() self.Sound = nil end 
end

function ENT:Initialize()
	self.Entity:SetModel("models/dronesrewrite/aihealer/aihealer.mdl")
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_NONE)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity:SetCollisionGroup(COLLISION_GROUP_DEBRIS)

	self.gun = ents.Create("base_anim")
	self.gun:SetPos(self:LocalToWorld(Vector(0, -6, 0)))
	self.gun:SetAngles(self:GetAngles())
	self.gun:SetModelScale(0.4, 0)
	self.gun:SetModel("models/dronesrewrite/repairgun/repairgun.mdl")
	self.gun:Spawn()
	self.gun:Activate()
	self.gun:SetParent(self)
	self.gun:SetNotSolid(true)
	self.gun:PhysicsDestroy()

	self.Sound = nil
end

function ENT:OnTakeDamage(dmg)
	if self.Drone and self.Drone:IsValid() and self.Drone:IsDroneImmortal() then return end

	local dmgAmount = dmg:GetDamage()

	self.HealthAmount = self.HealthAmount - dmgAmount

	if self.HealthAmount <= 0 then
		self:EmitSound("ambient/explosions/explode_1.wav", 110, 100)

		local ef = EffectData()
		ef:SetOrigin(self:GetPos())
		util.Effect("dronesrewrite_explosion", ef)

		self.Drone:RemoveModule("Healer")
	end
end

function ENT:Think()
	if self.Drone and self.Drone:IsValid() then
		local pos = self.Drone:GetPos()
		local dist = self.Drone.ThirdPersonCam_distance

		local x = math.sin(CurTime()) + math.cos(CurTime()) ^ 3
		local y = math.sin(CurTime()) - math.cos(CurTime()) ^ 3
		local z = math.sin(CurTime() * 2) + math.cos(CurTime() * 2) ^ 3

		local maxs = self.Drone:OBBMaxs()
		
		local tr = util.TraceLine({
			start = pos,
			endpos = pos + Vector(x * maxs.x * 1.5, y * maxs.y * 1.5, z * maxs.z),
			mask = MASK_SOLID_BRUSHONLY 
		})

		self:SetPos(tr.HitPos + tr.HitNormal * 24)

		local ang = (self.Drone:GetPos() - self:GetPos()):Angle()
		self:SetAngles(Angle(math.sin(CurTime() * 2) * 6, ang.y, math.cos(CurTime() * 1.5) * 8))
		self.gun:SetAngles(ang)

		local needsound = false

		-- Healing drone
		if self.Drone:GetHealth() < self.Drone:GetDefaultHealth() then
			local tr = util.TraceLine({
				start = self.gun:LocalToWorld(Vector(5, -3, 0)),
				endpos = self.Drone:GetPos(),
				filter = self 
			})

			util.ParticleTracerEx("laser_beam_g_drr", self.gun:LocalToWorld(Vector(5, -3, 0)), tr.HitPos, false, self:EntIndex(), -1)
			ParticleEffect("laser_hit_g_drr", tr.HitPos, Angle(0, 0, 0))

			if CurTime() > self.NextHeal then self.Drone:SetHealthAmount(self.Drone:GetHealth() + 1) self.NextHeal = CurTime() + 0.2 end

			needsound = true
		elseif not self.Drone.NoPropellers then
			-- Healing drone's propellers
			for k, v in pairs(self.Drone.ValidPropellers) do
				if v:IsValid() and not v.IsDestroyed and v.HealthAmount < self.Drone.Propellers.Health then
					util.ParticleTracerEx("laser_beam_g_drr", self.gun:GetPos(), v:GetPos(), false, self:EntIndex(), -1)
					ParticleEffect("laser_hit_g_drr", v:GetPos(), Angle(0, 0, 0))

					local ang = (v:GetPos() - self:GetPos()):Angle()
					self:SetAngles(Angle(0, ang.y, 0))
					self.gun:SetAngles(ang)

					if CurTime() > self.NextHeal then 
						v.HealthAmount = v.HealthAmount + 1
						v:SetNWInt("HealthAmount", v.HealthAmount)

						self.NextHeal = CurTime() + 0.2 
					end

					needsound = true
				end
			end
		end

		if needsound then
			if not self.Sound then
				self.Sound = CreateSound(self, "ambient/energy/force_field_loop1.wav")
				self.Sound:Play()
				self.Sound:ChangePitch(150)
			end
		else
			if self.Sound then
				self.Sound:Stop()
				self.Sound = nil
			end
		end
	end

	self:NextThink(CurTime())
	return true
end