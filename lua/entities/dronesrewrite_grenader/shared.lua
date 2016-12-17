ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
//ENT.PrintName = "EXS 'Explostorm'"
ENT.PrintName = "SIS Drone"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "SIS"

ENT.Model = "models/dronesrewrite/sisdr/sisdr.mdl"

ENT.Weight = 700

ENT.Speed = 5000
ENT.UpSpeed = 25000
ENT.RotateSpeed = 5
ENT.SprintCoefficient = 1.5

ENT.AngOffset = 2.4
ENT.PitchOffset = 0.2

ENT.Alignment = 0.45

ENT.ExplosionForce = 40
ENT.ExplosionAngForce = 0.7

ENT.FirstPersonCam_pos = Vector(19, 0, 2)
ENT.ThirdPersonCam_distance = 80
ENT.RenderCam = false

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.PitchMin = -46
ENT.AllowYawRestrictions = true
ENT.YawMin = -60
ENT.YawMax = 60

ENT.HackValue = 3

ENT.HealthAmount = 450
ENT.DefaultHealth = 450

ENT.Fuel = 300
ENT.MaxFuel = 300
ENT.FuelReduction = 0.9

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/manhack/mh_engine_loop1.wav",
		Pitch = 120,
		Level = 75,
		Volume = 0.6
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_1.wav",
		Pitch = 100,
		Level = 80
	}
}


ENT.Propellers = {
	Damage = 1,
	Health = 20,
	HitRange = 20,
	Scale = 1.15,
	Model = "models/dronesrewrite/propellers/propeller2_3.mdl",

	Info = {
		Vector(36.5, 35.5, 5),
		Vector(-36.5, -35.5, 5),
		Vector(-36.5, 35.5, 5),
		Vector(36.5, -35.5, 5)
	}
}

ENT.Attachments = {
	["GrenadeL"] = {
		Pos = Vector(0, 0, -2)
	}
}

ENT.Weapons = {
	["Grenade Launcher"] = {
		Name = "Grenade Launcher",
		Attachment = "GrenadeL"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()