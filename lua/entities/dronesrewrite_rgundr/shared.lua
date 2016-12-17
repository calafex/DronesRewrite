ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Rail Accelerator"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "RLAC"
ENT.HUD_hudName = "White Box"

ENT.Weight = 800

ENT.Model = "models/dronesrewrite/railgundr/railgundr.mdl"

ENT.FirstPersonCam_pos = Vector(30, 0, 1)
ENT.RenderCam = false

ENT.ExplosionForce = 20
ENT.ExplosionAngForce = 1.7

ENT.Alignment = 0 --1.6
ENT.AlignmentRoll = 1.4
ENT.AlignmentPitch = 3

ENT.NoiseCoefficient = 0.2
ENT.AngOffset = 1

ENT.SprintCoefficient = 3
ENT.Speed = 5000
ENT.UpSpeed = 25000
ENT.RotateSpeed = 5

ENT.HackValue = 3

ENT.PitchOffset = 0.1

ENT.AllowYawRestrictions = true
ENT.YawMin = -60
ENT.YawMax = 60

ENT.PitchMin = -30
ENT.PitchMax = 50

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.HealthAmount = 200
ENT.DefaultHealth = 200

ENT.Fuel = 180
ENT.MaxFuel = 180
ENT.FuelReduction = 0.3

ENT.Sounds = {
	PropellerSound = {
		Name = "ambient/atmosphere/noise2.wav",
		Pitch = 120,
		Level = 75
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_7.wav",
		Level = 85
	}
}

ENT.NoPropellers = true
ENT.Propellers = {
	Model = "models/props_junk/PopCan01a.mdl",
	Info = { Vector(0, 0, 0) }
}

ENT.Attachments = {
	["Railgun1"] = {
		Pos = Vector(5, 14, -9)
	},

	["Railgun2"] = {
		Pos = Vector(5, -14, -9)
	}
}

ENT.Weapons = {
	["Railgun"] = {
		Name = "Railgun",
		Sync = {
			["Railgun 2"] = { fire1 = "fire1" }
		},
		Attachment = "Railgun1"
	},

	["Railgun 2"] = {
		Name = "Railgun",
		Select = false,
		Attachment = "Railgun2"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()

