ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
//ENT.PrintName = "DF 'Defender'"
ENT.PrintName = "Defender"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "DF"
ENT.Weight = 350

ENT.Model = "models/dronesrewrite/defender/defender.mdl"

ENT.FirstPersonCam_pos = Vector(34, 0, 3)
ENT.RenderCam = false

ENT.ExplosionForce = 16
ENT.ExplosionAngForce = 1.7
ENT.DoExplosionEffect = "stinger_explode_drr"

ENT.HackValue = 3

ENT.Alignment = 0 --1.6
ENT.AlignmentRoll = 0.7
ENT.AlignmentPitch = 1.6

ENT.NoiseCoefficient = 0.4
ENT.AngOffset = 3

ENT.Speed = 7800
ENT.UpSpeed = 40000
ENT.RotateSpeed = 6

ENT.PitchOffset = 0.4

ENT.AllowYawRestrictions = true
ENT.YawMin = -60
ENT.YawMax = 60

ENT.PitchMin = -30
ENT.PitchMax = 50

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.Fuel = 120
ENT.MaxFuel = 120

ENT.HealthAmount = 110
ENT.DefaultHealth = 110

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/manhack/mh_engine_loop1.wav",
		Pitch = 120,
		Level = 71,
		Volume = 0.65
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_7.wav",
		Level = 85
	}
}


ENT.Propellers = {
	Damage = 1,
	Health = 50,
	HitRange = 18,
	Scale = 0.9,
	Model = "models/dronesrewrite/propellers/propeller2_4.mdl",

	Info = {
		Vector(-0.2, 48, 10),
		Vector(-0.2, -48, 10),
		Vector(-24.5, 0, 10)
	}
}

ENT.Attachments = {
	["Blaster"] = {
		Pos = Vector(6, 13, -5)
	},

	["Shield"] = {
		Pos = Vector(6, -13, -5)
	}
}

ENT.Weapons = {
	["Electric Blaster"] = {
		Name = "Electric Blaster",
		Attachment = "Blaster"
	},

	["Shield"] = {
		Name = "Shield",
		Attachment = "Shield"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()
