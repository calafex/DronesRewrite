ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Mothership"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"
ENT.AdminOnly = true

ENT.HackValue = 5

ENT.UNIT = "MSP"

ENT.Model = "models/dronesrewrite/mothership/mothership.mdl"
ENT.BlockRemoteController = true

ENT.Weight = 50000
ENT.SpawnHeight = 256
ENT.DisableInWater = false

ENT.HUD_hudName = "White Box"

ENT.UseNightVision = true
ENT.UseFlashlight = false

ENT.HackValue = 5

ENT.NoiseCoefficient = 0

ENT.HealthAmount = 25000
ENT.DefaultHealth = 25000

ENT.DoExplosionEffect = false

ENT.Speed = 600000
ENT.UpSpeed = 1200000
ENT.RotateSpeed = 1.2
ENT.AngOffset = 0
ENT.PitchOffset = 0
ENT.Alignment = 0.5

ENT.Fuel = 25000
ENT.MaxFuel = 25000
ENT.FuelReduction = 50

ENT.FirstPersonCam_pos = Vector(-550, 500, 710)
ENT.ThirdPersonCam_pos = Vector(300, 2200, 1310)
ENT.ThirdPersonCam_distance = 1800
ENT.CameraModel = "models/props_wasteland/light_spotlight01_lamp.mdl"

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.AllowPitchRestrictions = false

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/attack_helicopter/aheli_rotor_loop1.wav",
		Pitch = 80,
		Level = 100,
		NoPitchChanges = true
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_5.wav",
		Level = 120
	}
}

ENT.Propellers = {
	Immortal = true,
	Damage = 999999,
	Model = "models/dronesrewrite/ms_propeller/ms_propeller.mdl",
	HitRange = 300,

	UnFreeze = true,
	Force = true,
	ForceVal = 1000,

	Info = {
		Vector(-80, 740, 400),
		Vector(-80, -740, 400),

		Vector(650, 740, 400),
		Vector(650, -740, 400),

		Vector(-820, 740, 400),
		Vector(-820, -740, 400),
	}
}

ENT.Attachments = {
	["BottomLauncher1"] = {
		Pos = Vector(900, -74, 380),
		Angle = Angle(-15, 0, 180),
	},

	["BottomLauncher2"] = {
		Pos = Vector(900, 74, 380),
		Angle = Angle(-15, 0, 180),
	},

	["BottomLauncher3Center"] = {
		Pos = Vector(900, 0, 380),
		Angle = Angle(-15, 0, 180),
	},



	["SideLauncher1"] = {
		Pos = Vector(230, 500, 455)
	},

	["SideLauncher2"] = {
		Pos = Vector(230, 450, 455)
	},



	["RightBridge2"] = {
		Pos = Vector(-970, -410, 665)
	},

	["RightBridge3"] = {
		Pos = Vector(-630, -410, 665)
	},

	["RightBridge4"] = {
		Pos = Vector(-800, -410, 665)
	},

	["RightBridge1"] = {
		Pos = Vector(-490, -410, 665)
	},
}

ENT.Weapons = {
	-- Bottom launchers
	["Bottom launchers"] = {
		Name = "Missile Battery",
		Sync = {
			["launch2"] = { fire1 = "fire1" },
			["launchb2"] = { fire1 = "fire1" }
		},

		Attachment = "BottomLauncher1"
	},

	["launch2"] = {
		Name = "Missile Battery",
		Select = false,
		Attachment = "BottomLauncher2"
	},

	["launchb2"] = {
		Name = "Missile Battery",
		Select = false,
		Attachment = "BottomLauncher3Center"
	},


	-- Side launchers
	["Left top launchers"] = {
		Name = "Missile Battery",
		Sync = {
			["launch3"] = { fire1 = "fire1" }
		},
		Attachment = "SideLauncher1"
	},

	["launch3"] = {
		Name = "Missile Battery",
		Select = false,
		Attachment = "SideLauncher2"
	},


	-- Right back bridge launchers
	["Right top launchers"] = {
		Name = "Missile Battery",
		Sync = {
			["launch4"] = { fire1 = "fire1" },
			["launchb4"] = { fire1 = "fire1" },
			["launchc4"] = { fire1 = "fire1" }
		},

		Attachment = "RightBridge4"
	},

	["launchc4"] = {
		Name = "Missile Battery",
		Select = false,
		Attachment = "RightBridge1"
	},

	["launchb4"] = {
		Name = "Missile Battery",
		Select = false,
		Attachment = "RightBridge2"
	},

	["launch4"] = {
		Name = "Missile Battery",
		Select = false,
		Attachment = "RightBridge3"
	},


	["Orbital Strike"] = {
		Name = "Orbital Strike"
	},
}

ENT.Modules = { } -- we do not need modules on big drone