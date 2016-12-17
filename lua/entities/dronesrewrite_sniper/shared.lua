ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Sniper Drone"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "SNP"
ENT.HUD_hudName = "Sci Fi 2"

ENT.Weight = 120

ENT.Model = "models/dronesrewrite/sniperdr/sniper.mdl"

ENT.FirstPersonCam_pos = Vector(26, 0, 4)
ENT.RenderCam = false

ENT.ExplosionForce = 16
ENT.ExplosionAngForce = 1.7

ENT.Alignment = 0 --1.6
ENT.AlignmentRoll = 0.4
ENT.AlignmentPitch = 1.2

ENT.NoiseCoefficient = 0.06
ENT.AngOffset = 3

ENT.Speed = 1000
ENT.UpSpeed = 6000
ENT.RotateSpeed = 6

ENT.HackValue = 4

ENT.PitchOffset = 0.6

ENT.AllowYawRestrictions = true
ENT.YawMin = -60
ENT.YawMax = 60

ENT.Fuel = 120
ENT.MaxFuel = 120
ENT.FuelReduction = 0.3

ENT.PitchMin = -80
ENT.PitchMax = 80

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.HealthAmount = 150
ENT.DefaultHealth = 150

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/manhack/mh_engine_loop1.wav",
		Pitch = 90,
		Level = 60
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_7.wav",
		Level = 76
	}
}

ENT.Propellers = {
	Damage = 1,
	Health = 20,
	Scale = 1.5,
	HitRange = 8,
	Model = "models/dronesrewrite/propellers/propeller1_1.mdl",

	Info = {
		Vector(-11.5, 15.4, 0),
		Vector(-11.5, -15.4, 0),
		Vector(6.7, 15.4, 0),
		Vector(6.7, -15.4, 0)
	},

	InfoAng = {
		Angle(0, 0, -16),
		Angle(0, 0, 16),

		Angle(0, 0, -16),
		Angle(0, 0, 16)
	}
}

ENT.Attachments = {
	["Rifle"] = {
		Pos = Vector(-4, 0, -9)
	},

	["Deployer"] = {
		Pos = Vector(-12, 0, -5)
	}
}

ENT.Weapons = {
	["Sniper Rifle"] = {
		Name = "Sniper Rifle",
		Attachment = "Rifle"
	},

	["Spy Drone Deployer"] = {
		Name = "Spy Drone Deployer",
		Attachment = "Deployer"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()