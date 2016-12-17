ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Death from Above"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"
ENT.AdminOnly = true

ENT.UNIT = "DFA"

ENT.Model = "models/dronesrewrite/skyartillery/skyartillery.mdl"

ENT.Weight = 2000
ENT.SpawnHeight = 128

ENT.HUD_hudName = "Drones 1"
ENT.OverlayName = "Sci Fi"

ENT.UseNightVision = true
ENT.UseFlashlight = false

ENT.NoiseCoefficient = 0

ENT.HealthAmount = 3000
ENT.DefaultHealth = 3000

ENT.DoExplosionEffect = "splode_big_drone_main"

ENT.HackValue = 5

ENT.ExplosionForce = 0.4
ENT.ExplosionAngForce = 0.01

ENT.Speed = 20000
ENT.UpSpeed = 90000
ENT.RotateSpeed = 4
ENT.AngOffset = 3

ENT.Alignment = 0.3

ENT.PitchOffset = 0.05

ENT.FirstPersonCam_pos = Vector(60, 0, -8)
ENT.ThirdPersonCam_distance = 300
ENT.RenderCam = false

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.PitchMin = -25

ENT.Fuel = 800
ENT.MaxFuel = 800
ENT.FuelReduction = 0.4

ENT.AllowYawRestrictions = true
ENT.YawMin = -60
ENT.YawMax = 60

ENT.Slots = {
	["Weapon"] = 2
}

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/attack_helicopter/aheli_rotor_loop1.wav",
		NoPitchChanges = true,
		Level = 80
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_5.wav",
		Level = 140
	}
}

ENT.Propellers = {
	Immortal = true,
	Damage = 200,
	Scale = 2,
	HitRange = 40,
	Model = "models/dronesrewrite/propellers/propeller2_5.mdl",

	Info = {
		Vector(-76.5, 76.5, 23),
		Vector(-76.5, -76.5, 23),
		Vector(108.5, 76.5, 23),
		Vector(108.5, -76.5, 23)
	}
}

ENT.Attachments = {
	["RocketL1"] = {
		Pos = Vector(40, 28, -13)
	},

	["RocketL2"] = {
		Pos = Vector(-10, 28, -13)
	},

	["RocketL3"] = {
		Pos = Vector(-10, -28, -13)
	},

	["RocketL4"] = {
		Pos = Vector(40, -28, -13)
	},

	["Up"] = {
		Pos = Vector(-15, 0, 28),
		Angle = Angle(0, 0, 180)
	}
}

ENT.Weapons = {
	["Rocket Launcher"] = {
		Name = "Rocket Launcher",
		Sync = {
			["Rocket Launcher 2"] = { fire1 = "fire1" },
			["Rocket Launcher 3"] = { fire1 = "fire1" },
			["Rocket Launcher 4"] = { fire1 = "fire1" }
		},

		Attachment = "RocketL1"
	},

	["Rocket Launcher 2"] = {
		Name = "Rocket Launcher",
		Select = false,
		Attachment = "RocketL2"
	},

	["Rocket Launcher 3"] = {
		Name = "Rocket Launcher",
		Select = false,
		Attachment = "RocketL3"
	},

	["Rocket Launcher 4"] = {
		Name = "Rocket Launcher",
		Select = false,
		Attachment = "RocketL4"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()