ENT.Base = "dronesrewrite_base"
ENT.DrrBaseType = "walker"
ENT.Type = "anim"
//ENT.PrintName = "CRC 'Crucifier'"
ENT.PrintName = "Crucifier"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "CRC"

ENT.Model = "models/dronesrewrite/walkertank/walkertank.mdl"

ENT.SpawnHeight = 128
ENT.Weight = 10000

ENT.OverlayName = "Drones 1"
ENT.HUD_hudName = "White Box"

ENT.FirstPersonCam_pos = Vector(145, 0, 110)
ENT.ThirdPersonCam_pos = Vector(0, 0, 100)
ENT.ThirdPersonCam_distance = 600
ENT.RenderCam = false

ENT.Speed = 200000
ENT.SprintCoefficient = 1
ENT.RotateSpeed = 4
ENT.PitchOffset = 0
ENT.Hover = 120
ENT.AngOffset = 0

ENT.HackValue = 4

ENT.ExplosionForce = 2
ENT.ExplosionAngForce = 0
ENT.DoExplosionEffect = "splode_big_drone_main"

ENT.Fuel = 2000
ENT.MaxFuel = 2000
ENT.FuelReduction = 10

ENT.AllowPitchRestrictions = true
ENT.PitchMin = -90
ENT.PitchMax = 50

ENT.AllowYawRestrictions = true
ENT.YawMin = -70
ENT.YawMax = 70

ENT.NoiseCoefficient = 5

ENT.WaitForSound = 0.7

ENT.Slip = 180
ENT.AngSlip = 0.03

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()
ENT.KeysFuncs.Physics["Up"] = function(self)
end

ENT.KeysFuncs.Physics["Down"] = function(self)
end

ENT.HealthAmount = 2000
ENT.DefaultHealth = 2000

ENT.Sounds = {
	ExplosionSound = {
		Name = "ambient/explosions/explode_1.wav",
		Level = 82
	},

	FootSound = {
		Sounds = {
			"physics/metal/metal_barrel_impact_hard1.wav",
			"physics/metal/metal_barrel_impact_hard2.wav",
			"physics/metal/metal_barrel_impact_hard3.wav"
		},

		Pitch = 40,
		Volume = 90
	}
}

ENT.Corners = {
	Vector(-110, -100, 0),
	Vector(-110, 100, 0),
	Vector(100, 100, 0),
	Vector(100, -100, 0)
}

ENT.Attachments = {
	["Minigun"] = {
		Pos = Vector(120, 0, 54.4)
	},

	["Shield"] = {
		Pos = Vector(60, 64, 62)
	},


	["UpRight"] = {
		Pos = Vector(80, 54, 113),
		Angle = Angle(0, 0, 180)
	},

	["UpRight+"] = {
		Pos = Vector(80, 84, 113),
		Angle = Angle(0, 0, 180)
	},

	["UpLeft"] = {
		Pos = Vector(80, -54, 113),
		Angle = Angle(0, 0, 180)
	},

	["UpLeft+"] = {
		Pos = Vector(80, -84, 113),
		Angle = Angle(0, 0, 180)
	},
}

ENT.Weapons = {
	["Heavy Minigun"] = {
		Name = "Heavy Minigun",
		Attachment = "Minigun"
	},

	["Shield"] = {
		Name = "Shield",
		Attachment = "Shield"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()