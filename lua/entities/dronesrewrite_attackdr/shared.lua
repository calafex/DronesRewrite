ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Laser Commando"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "ATT"
ENT.HUD_hudName = "Sci Fi"
ENT.OverlayName = "Sci Fi"

ENT.Weight = 500

ENT.Model = "models/dronesrewrite/attdr/attdr.mdl"

ENT.FirstPersonCam_pos = Vector(82, 0, 65)
ENT.ThirdPersonCam_pos = Vector(0, -40, 60)
ENT.ThirdPersonCam_distance = 300
ENT.RenderCam = false

ENT.DoExplosionEffect = "splode_big_drone_main"
ENT.ExplosionForce = 16
ENT.ExplosionAngForce = 1.7

ENT.Alignment = 0 --1.6
ENT.AlignmentRoll = 0.5
ENT.AlignmentPitch = 1.2

ENT.NoiseCoefficient = 0
ENT.NoiseCoefficientPos = 5
ENT.NoiseCoefficientAng = 0.15
ENT.AngOffset = 1.5

ENT.HackValue = 4

ENT.Speed = 12000
ENT.UpSpeed = 50000
ENT.RotateSpeed = 5

ENT.PitchOffset = 0.05

ENT.AllowYawRestrictions = true
ENT.YawMin = -60
ENT.YawMax = 60

ENT.PitchMin = -70
ENT.PitchMax = 70

ENT.Fuel = 250
ENT.MaxFuel = 250
ENT.FuelReduction = 0.2

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.HealthAmount = 400
ENT.DefaultHealth = 400

ENT.Sounds = {
	PropellerSound = {
		Name = "hl1/ambience/alien_blipper.wav",
		Pitch = 254,
		NoPitchChanges = true,
		Level = 52
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_7.wav",
		Level = 88
	}
}

ENT.NoPropellers = true
ENT.Propellers = {
	Model = "models/props_junk/PopCan01a.mdl",
	Info = { Vector(0, 0, 0) }
}

ENT.Attachments = {
	["Minigun"] = {
		Pos = Vector(0, 0, 24)
	},

	["Shield"] = {
		Pos = Vector(-8, 15, 89),
		Angle = Angle(0, 0, 180)
	},

	["Shield Right"] = {
		Pos = Vector(-8, -15, 89),
		Angle = Angle(0, 0, 180)
	}
}

ENT.Weapons = {
	["Laser Minigun"] = {
		Name = "Laser Minigun",
		Attachment = "Minigun"
	},

	["Shield"] = {
		Name = "Shield",
		Attachment = "Shield"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()