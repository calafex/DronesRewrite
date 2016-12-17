ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
//ENT.PrintName = "LBL 'Limb of the Law'"
ENT.PrintName = "Limb of the Law"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "LBL"

ENT.Weight = 150

ENT.Model = "models/dronesrewrite/gunner/gunner.mdl"

ENT.FirstPersonCam_pos = Vector(29, 0, -3)
ENT.RenderCam = false

ENT.NoiseCoefficient = 0.1
ENT.AngOffset = 3

ENT.PitchMin = -12

ENT.AllowYawRestrictions = true
ENT.YawMin = -80
ENT.YawMax = 80

ENT.HackValue = 3

ENT.Speed = 1600
ENT.UpSpeed = 10000
ENT.RotateSpeed = 7

ENT.HealthAmount = 150
ENT.DefaultHealth = 150

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/manhack/mh_engine_loop1.wav",
		Pitch = 120,
		Level = 67
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_1.wav",
		Level = 80
	}
}

ENT.Propellers = {
	Damage = 1,
	Health = 40,
	HitRange = 12,
	Model = "models/dronesrewrite/propellers/propeller2_3.mdl",

	Info = {
		Vector(1, 28, 1),
		Vector(1, -28, 1)
	}
}

ENT.Attachments = {
	["Left"] = {
		Pos = Vector(0, 12, 0)
	},

	["Right"] = {
		Pos = Vector(0, -12, 0)
	}
}

ENT.Weapons = {
	["Assault Rifle"] = {
		Name = "Assault Rifle",
		Sync = { ["2"] = { fire1 = "fire1" } },
		Attachment = "Left"
	},

	["2"] = {
		Name = "Assault Rifle",
		Select = false,
		Attachment = "Right"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()