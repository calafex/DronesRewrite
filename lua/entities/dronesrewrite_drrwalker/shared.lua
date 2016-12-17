ENT.Base = "dronesrewrite_base"
ENT.DrrBaseType = "walker"
ENT.Type = "anim"
//ENT.PrintName = "DW 'Walker'"
ENT.PrintName = "Walker Drone"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "DW"

ENT.Model = "models/dronesrewrite/missiledrone/missiledrone.mdl" -- Totally not missile

ENT.Weight = 4000
ENT.SpawnHeight = 32

ENT.OverlayName = "No Overlay"
ENT.HUD_hudName = "White Box"

ENT.AI_AllowDown = false
ENT.AI_AllowUp = false

ENT.FirstPersonCam_pos = Vector(27, 0, 139)
ENT.ThirdPersonCam_pos = Vector(0, 0, 200)
ENT.ThirdPersonCam_distance = 260
ENT.RenderCam = false

ENT.Speed = 100000
ENT.SprintCoefficient = 1
ENT.RotateSpeed = 6
ENT.PitchOffset = 0
ENT.Hover = 116
ENT.AngOffset = 4

ENT.HackValue = 3

ENT.ExplosionForce = 2
ENT.ExplosionAngForce = 0
ENT.DoExplosionEffect = "splode_big_drone_main"

ENT.AllowPitchRestrictions = true
ENT.PitchMin = -90
ENT.PitchMax = 50

ENT.AllowYawRestrictions = true
ENT.YawMin = -70
ENT.YawMax = 70

ENT.NoiseCoefficient = 5

ENT.Fuel = 500
ENT.MaxFuel = 500
ENT.FuelReduction = 6

ENT.WaitForSound = 0.47

ENT.Slip = 170
ENT.AngSlip = 0.03

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()
ENT.KeysFuncs.Physics["Up"] = function(self)
	if self:IsDroneOnGround() then
		local up = self:GetUp()
		local phys = self:GetPhysicsObject()

		if not self.JumpPower then self.JumpPower = 0 end
		self.JumpPower = math.Approach(self.JumpPower, 700, 10)

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
		phys:AddAngleVelocity(Vector(angr, angp, 0) * self.JumpPower * 0.01)

		self.JumpPower = 0
	end
end

ENT.KeysFuncs.Physics["Down"] = function(self)
	local up = self:GetUp()
	local phys = self:GetPhysicsObject()

	phys:ApplyForceCenter(-up * phys:GetMass() * 21)
end

ENT.HealthAmount = 1200
ENT.DefaultHealth = 1200

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

		Pitch = 40,
		Volume = 70
	}
}

ENT.Corners = {
	Vector(-47.25, -48, 100),
	Vector(-47.25, 49, 100),
	Vector(14, 47, 100),
	Vector(14, -48, 100)
}

ENT.Attachments = {
	["Minigun1"] = {
		Pos = Vector(0, -25, 126),
		Angle = Angle(0, 0, -97)
	},

	["Minigun2"] = {
		Pos = Vector(0, 25, 126),
		Angle = Angle(0, 0, 97)
	},

	["BackwardLeftUp"] = {
		Pos = Vector(-58, 12, 130),
		Angle = Angle(84, 0, 0)
	},

	["BackwardRightUp"] = {
		Pos = Vector(-58, -12, 130),
		Angle = Angle(84, 0, 0)
	}
}

ENT.Weapons = {
	["Heavy Miniguns"] = {
		Name = "Heavy Minigun",
		Sync = { ["2"] = { fire1 = "fire1" } },
		Attachment = "Minigun1"
	},

	["2"] = {
		Name = "Heavy Minigun",
		Select = false,
		Attachment = "Minigun2"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()