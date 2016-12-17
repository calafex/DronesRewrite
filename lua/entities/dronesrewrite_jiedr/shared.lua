ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "JIE Drone"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "JIE"

ENT.HUD_hudName = "Drones 1"

ENT.Model = "models/dronesrewrite/jiedr/jiedr.mdl"

ENT.Weight = 700
ENT.SpawnHeight = 64

ENT.Speed = 4500
ENT.UpSpeed = 25000
ENT.AngOffset = 3
ENT.RotateSpeed = 3
ENT.Alignment = 1
ENT.PitchOffset = 0.4

ENT.HackValue = 4

ENT.Fuel = 500
ENT.MaxFuel = 500
ENT.FuelReduction = 0.9

ENT.NoiseCoefficient = 0
ENT.NoiseCoefficientAng = 0.1
ENT.NoiseCoefficientPos = 2

ENT.DoExplosionEffect = "splode_big_drone_main"

ENT.ThirdPersonCam_distance = 200
ENT.FirstPersonCam_pos = Vector(49, 0, 20)
ENT.RenderCam = false

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.AllowYawRestrictions = true
ENT.YawMin = -60
ENT.YawMax = 60

ENT.PitchMin = -30
ENT.PitchMax = 50

ENT.HealthAmount = 500
ENT.DefaultHealth = 500

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/manhack/mh_engine_loop1.wav",
		Pitch = 60,
		Level = 82
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_1.wav",
		Level = 80
	}
}


ENT.Propellers = {
	Damage = 2,
	Health = 60,
	HitRange = 14,
	Model = "models/dronesrewrite/propellers/propeller1_5.mdl",

	Info = {
		Vector(-5.2, 70.6, 26),
		Vector(-5.2, -70.6, 26)
	}
}

ENT.Attachments = {
	["Left"] = {
		Pos = Vector(-5, 32, -10)
	},

	["LeftUp"] = {
		Pos = Vector(-5, 32, -5),
		Angle = Angle(0, 0, 180)
	},

	["Right"] = {
		Pos = Vector(-5, -32, -10)
	},

	["RightUp"] = {
		Pos = Vector(-5, -32, -5),
		Angle = Angle(0, 0, 180)
	},
}

ENT.Weapons = {
	["Rocket Launcher & Gun"] = {
		Name = "Rocket Launcher",
		Sync = { 
			["1"] = { fire1 = "fire2" } 
		},

		Attachment = "Left"
	},

	["1"] = {
		Name = "Double Gun",
		Select = false,
		PrimaryAsSecondary = true,
		Attachment = "Right"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()