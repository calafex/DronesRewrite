ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Scout"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "SCT"
ENT.HUD_hudName = "Sci Fi 2"

ENT.Weight = 120

ENT.Model = "models/dronesrewrite/scout/scout.mdl"

ENT.FirstPersonCam_pos = Vector(20, 0, 4)
ENT.RenderCam = false

ENT.Alignment = 0
ENT.AlignmentRoll = 0.7
ENT.AlignmentPitch = 1.6

ENT.NoiseCoefficient = 0.15
ENT.AngOffset = 3

ENT.Speed = 2500
ENT.UpSpeed = 14000
ENT.RotateSpeed = 6

ENT.PitchOffset = 0.45

ENT.HackValue = 2

ENT.AllowYawRestrictions = true
ENT.YawMin = -60
ENT.YawMax = 60

ENT.PitchMin = -30
ENT.PitchMax = 50

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.HealthAmount = 120
ENT.DefaultHealth = 120

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/manhack/mh_engine_loop1.wav",
		Pitch = 120,
		Level = 60
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_7.wav",
		Level = 80
	}
}


ENT.Propellers = {
	Damage = 1,
	Health = 30,
	HitRange = 12,
	Model = "models/dronesrewrite/propellers/propeller2_3.mdl",

	Info = {
		Vector(0, 33.5, 6),
		Vector(0, -33.5, 6),
	}
}

ENT.Attachments = {
	["Pistol"] = {
		Pos = Vector(0, 0, -2)
	}
}	

ENT.Weapons = {
	["Pistol"] = {
		Name = "Pistol",
		Attachment = "Pistol"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()
