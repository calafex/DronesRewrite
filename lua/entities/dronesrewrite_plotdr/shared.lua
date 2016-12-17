ENT.Base = "dronesrewrite_base"
ENT.DrrBaseType = "walker"
ENT.Type = "anim"
ENT.PrintName = "PLOT-130"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"
ENT.AdminOnly = true

ENT.UNIT = "PLOT"

ENT.Model = "models/dronesrewrite/plotdr/plotdr.mdl"

ENT.Weight = 4000
ENT.SpawnHeight = 32

ENT.OverlayName = "Black and white"

ENT.FirstPersonCam_pos = Vector(80, 0, 195)
ENT.ThirdPersonCam_pos = Vector(0, 0, 300)
ENT.ThirdPersonCam_distance = 260
ENT.RenderCam = false

ENT.AI_AllowDown = false
ENT.AI_AllowUp = false

ENT.Speed = 100000
ENT.SprintCoefficient = 1
ENT.RotateSpeed = 5
ENT.PitchOffset = 0
ENT.Hover = 110
ENT.AngOffset = 1.6

ENT.HackValue = 4

ENT.Fuel = 700
ENT.MaxFuel = 700
ENT.FuelReduction = 6

ENT.ExplosionForce = 2
ENT.ExplosionAngForce = 0
ENT.DoExplosionEffect = "splode_big_drone_main"

ENT.AllowPitchRestrictions = true
ENT.PitchMin = -90
ENT.PitchMax = 35

ENT.AllowYawRestrictions = true
ENT.YawMin = -80
ENT.YawMax = 50

ENT.NoiseCoefficient = 2

ENT.WaitForSound = 0.54

ENT.Slip = 170
ENT.AngSlip = 0.03



ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()
ENT.KeysFuncs.Physics["Up"] = function(self)
	if self:IsDroneOnGround() then
		local up = self:GetUp()
		local phys = self:GetPhysicsObject()

		if not self.JumpPower then self.JumpPower = 0 end
		self.JumpPower = math.Approach(self.JumpPower, 1000, 10)

		phys:ApplyForceCenter(-up * phys:GetMass() * 18)
	end
end

ENT.KeysFuncs.UnPressed["Up"] = function(self)
	if self:IsDroneOnGround() then
		local forward = self:GetForward()
		local up = self:GetUp()
		local phys = self:GetPhysicsObject()

		local ang = self:GetAngles()
		local angp = math.NormalizeAngle(ang.p)
		local angr = math.NormalizeAngle(ang.r)

		phys:ApplyForceCenter((forward * 200 + up * self.JumpPower) * phys:GetMass())
		phys:AddAngleVelocity(Vector(angr, angp, 0) * self.JumpPower * 0.018)

		self.JumpPower = 0
	end
end

ENT.KeysFuncs.Physics["Down"] = function(self)
	local up = self:GetUp()
	local phys = self:GetPhysicsObject()

	phys:ApplyForceCenter(-up * phys:GetMass() * 30)
end

ENT.HealthAmount = 1500
ENT.DefaultHealth = 1500

ENT.Sounds = {
	ExplosionSound = {
		Name = "ambient/explosions/explode_1.wav",
		Level = 82
	},

	FootSound = {
		Sounds = {
			--"physics/metal/metal_barrel_impact_hard1.wav",
			"physics/metal/metal_barrel_impact_hard2.wav"
		},

		Pitch = 120,
		Volume = 72
	}
}

ENT.Corners = {
	Vector(-8, -69, 110),
	Vector(-8, 64, 110),
	Vector(68, 64, 110),
	Vector(68, -69, 110)
}

ENT.Attachments = {
	["Minigun1"] = {
		Pos = Vector(52, -76, 192),
		Angle = Angle(0, 0, -95)
	},

	["Minigun2"] = {
		Pos = Vector(52, -76, 170),
		Angle = Angle(0, 0, -90)
	},

	["MissileL"] = {
		Pos = Vector(0, 84, 180),
		Angle = Angle(0, 0, -90)
	},

	["BackwardUp"] = {
		Pos = Vector(0, 0, 219),
		Angle = Angle(0, 0, 180)
	},

	["HeadUp"] = {
		Pos = Vector(35, 0, 213),
		Angle = Angle(0, 0, 180)
	}
}

ENT.Weapons = {
	["3-barrel Miniguns & Missile Batteries"] = {
		Name = "3-barrel Minigun",
		Sync = { 
			["1"] = { fire1 = "fire1" },
			["2"] = { fire1 = "fire2" }
		},
		Attachment = "Minigun2"
	},

	["1"] = {
		Name = "3-barrel Minigun",
		Select = false,
		Attachment = "Minigun1"
	},

	["2"] = {
		Name = "Missile Battery",
		Select = false,
		PrimaryAsSecondary = true,
		Attachment = "MissileL"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()