ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
//ENT.PrintName = "RCKT 'Rocketeer'"
ENT.PrintName = "Rocketeer"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "RCKT"

ENT.Model = "models/dronesrewrite/artillerydr/artillerydr.mdl"

ENT.Weight = 500

ENT.Speed = 5000
ENT.UpSpeed = 20000
ENT.SprintCoefficient = 1.5
ENT.AngOffset = 4
ENT.PitchOffset = 0.8
ENT.RotateSpeed = 3
ENT.Alignment = 0.7

ENT.FirstPersonCam_pos = Vector(27, 0, 0)
ENT.RenderCam = false

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.AllowYawRestrictions = true

ENT.YawMin = -75
ENT.YawMax = 75

ENT.PitchMin = -25

ENT.HackValue = 2

ENT.HealthAmount = 400
ENT.DefaultHealth = 400

ENT.Fuel = 90
ENT.MaxFuel = 90
ENT.FuelReduction = 0.2

ENT.Slots = {
	["Weapon"] = 1
}

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/manhack/mh_engine_loop1.wav",
		Pitch = 120,
		Level = 70,
		Volume = 0.7
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_1.wav",
		Pitch = 100,
		Level = 82
	}
}


ENT.Propellers = {
	Damage = 1,
	Health = 40,
	HitRange = 15,
	Scale = 1.1,
	Model = "models/dronesrewrite/propellers/propeller2_3.mdl",

	Info = {
		Vector(-4, 40.9, 2.3),
		Vector(-4, -40.9, 2.3)
	}
}

ENT.Attachments = {
	["Left"] = {
		Pos = Vector(-4, 18, -7.5),
		Angle = Angle(0, 0, 0)
	},

	["Right"] = {
		Pos = Vector(-4, -18, -7.5),
		Angle = Angle(0, 0, 0)
	},

	["Up"] = {
		Pos = Vector(0, 0, 5.5),
		Angle = Angle(0, 0, 180)
	}
}

ENT.Weapons = {
	["Rocket Launcher"] = {
		Name = "Rocket Launcher",
		Attachment = "Left"
	},

	["Homing Missile Launcher"] = {
		Name = "Homing Missile Launcher",
		Attachment = "Right"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()