ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Mine Dropper"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "MDR"

ENT.Weight = 440

ENT.Model = "models/dronesrewrite/minedr/minedr.mdl"

ENT.FirstPersonCam_pos = Vector(30, 0, 0)
ENT.RenderCam = false

ENT.ExplosionForce = 32
ENT.ExplosionAngForce = 2
ENT.DoExplosionEffect = "splode_big_drone_main"

ENT.Alignment = 0
ENT.AlignmentRoll = 1.3
ENT.AlignmentPitch = 1.6

ENT.NoiseCoefficient = 0.4
ENT.AngOffset = 4

ENT.HackValue = 3

ENT.Speed = 4500
ENT.UpSpeed = 19000
ENT.RotateSpeed = 5

ENT.Fuel = 150
ENT.MaxFuel = 150
ENT.FuelReduction = 0.4

ENT.PitchOffset = 0.4

ENT.AllowYawRestrictions = true
ENT.YawMin = -60
ENT.YawMax = 60

ENT.PitchMin = -30
ENT.PitchMax = 50

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.HealthAmount = 250
ENT.DefaultHealth = 250

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/manhack/mh_engine_loop1.wav",
		Pitch = 120,
		Level = 69,
		Volume = 0.6
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_7.wav",
		Level = 82
	}
}


ENT.Propellers = {
	Damage = 1,
	Health = 50,
	HitRange = 12,
	Model = "models/dronesrewrite/propellers/propeller2_3.mdl",

	Info = {
		Vector(22, 30.5, 1.4),
		Vector(-19.5, -30.5, 1.4),
		Vector(-19.5, 30.5, 1.4),
		Vector(22, -30.5, 1.4)
	}
}

ENT.Attachments = {
	["Minedropper"] = {
		Pos = Vector(0, 0, 2),
		Angle = Angle(0, -90, 0)
	}
}

ENT.Weapons = {
	["Minedropper"] = {
		Name = "Minedropper",
		Attachment = "Minedropper"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()