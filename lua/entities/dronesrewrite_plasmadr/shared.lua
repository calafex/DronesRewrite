ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Plasmatic Melter"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "PLM"

ENT.Weight = 350

ENT.Model = "models/dronesrewrite/plasmadr/plasmadr.mdl"

ENT.FirstPersonCam_pos = Vector(36, 0, 0)
ENT.RenderCam = false

ENT.Alignment = 0.5
ENT.PitchOffset = 0.6
ENT.NoiseCoefficient = 0.05
ENT.AngOffset = 3

ENT.Speed = 3000
ENT.UpSpeed = 16000
ENT.RotateSpeed = 5

ENT.Fuel = 220
ENT.MaxFuel = 220
ENT.FuelReduction = 0.4

ENT.AllowYawRestrictions = true
ENT.YawMin = -60
ENT.YawMax = 60

ENT.HackValue = 3

ENT.PitchMin = -24
ENT.PitchMax = 80

ENT.HealthAmount = 200
ENT.DefaultHealth = 200

ENT.HUD_hudName = "Drones 2"

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/manhack/mh_engine_loop1.wav",
		Pitch = 120,
		Level = 74,
		Volume = 0.83
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_1.wav",
		Level = 80
	}
}

ENT.Propellers = {
	Damage = 5,
	Health = 20,
	HitRange = 18,
	Scale = 1.2,
	Model = "models/dronesrewrite/propellers/propeller2_3.mdl",

	Info = {
		Vector(-20, 38, 2),
		Vector(-20, -38, 2),
		Vector(20, 40.6, 2),
		Vector(20, -40.6, 2)
	}
}

ENT.Attachments = {
	["PlasmaRifle"] = {
		Pos = Vector(20, 0, -7)
	}
}

ENT.Weapons = {
	["Plasma Rifle"] = {
		Name = "Plasma Rifle",
		Attachment = "PlasmaRifle"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()