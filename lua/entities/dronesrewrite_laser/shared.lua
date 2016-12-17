ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Laser Drone"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "LSR"

ENT.Weight = 200

ENT.Model = "models/dronesrewrite/laserdr/laserdr.mdl"

ENT.FirstPersonCam_pos = Vector(20, 0, 0)
ENT.ThirdPersonCam_distance = 86
ENT.ThirdPersonCam_pos = Vector(-16, 0, 1)
ENT.RenderCam = false

ENT.NoiseCoefficient = 0.2
ENT.AngOffset = 5
ENT.Alignment = 1.2

ENT.Speed = 2300
ENT.UpSpeed = 10000
ENT.RotateSpeed = 6

ENT.HackValue = 2

ENT.Fuel = 80
ENT.MaxFuel = 80
ENT.FuelReduction = 0.3

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.AllowYawRestrictions = true
ENT.YawMin = -60
ENT.YawMax = 60

ENT.PitchMin = -30
ENT.PitchMax = 70

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/manhack/mh_engine_loop2.wav",
		Pitch = 150,
		Level = 70,
		Volume = 0.6
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_1.wav",
		Level = 80
	}
}


ENT.Propellers = {
	Scale = 0.8,
	Damage = 1,
	Health = 17,
	HitRange = 10,
	Model = "models/dronesrewrite/propellers/propeller2_2.mdl",

	Info = {
		Vector(13.8, 13.8, 0.8),
		Vector(-13.8, -13.8, 0.8),
		Vector(-13.8, 13.8, 0.8),
		Vector(13.8, -13.8, 0.8)
	}
}

ENT.Attachments = {
	["Laser"] = {
		Pos = Vector(0, 0, -2)
	}
}

ENT.Weapons = {
	["Laser"] = {
		Name = "Laser",
		Attachment = "Laser"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()