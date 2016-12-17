ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Steel Warrior"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "SW"

ENT.HUD_hudName = "White Box"

ENT.Model = "models/dronesrewrite/warriordr/warriordr.mdl"

ENT.Weight = 650
ENT.SpawnHeight = 40

ENT.Speed = 7000
ENT.UpSpeed = 35000
ENT.AngOffset = 4
ENT.RotateSpeed = 3
ENT.Alignment = 1
ENT.PitchOffset = 0.4

ENT.NoiseCoefficient = 0
ENT.NoiseCoefficientAng = 0.2
ENT.NoiseCoefficientPos = 20

ENT.HackValue = 3

ENT.ThirdPersonCam_distance = 120
ENT.FirstPersonCam_pos = Vector(28, 0, 22)
ENT.RenderCam = false

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.UseFlashlight = false

ENT.AllowYawRestrictions = true
ENT.YawMin = -68
ENT.YawMax = 68

ENT.PitchMin = -60
ENT.PitchMax = 70

ENT.HealthAmount = 650
ENT.DefaultHealth = 650
//ENT.DoExplosionEffect = "splode_big_drone_main"

ENT.Fuel = 200
ENT.MaxFuel = 200
ENT.FuelReduction = 0.4

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/attack_helicopter/aheli_rotor_loop1.wav",
		Pitch = 160,
		Level = 74,
		Volume = 0.45
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_1.wav",
		Level = 80
	}
}

ENT.Propellers = {
	Scale = 0.97,
	Damage = 2,
	Health = 60,
	HitRange = 18,
	Model = "models/dronesrewrite/propellers/propeller1_4.mdl",

	Info = {
		Vector(-3.3, 23.8, 35),
		Vector(-3.3, -23.8, 35)
	},

	InfoAng = {
		Angle(0, 0, -5),
		Angle(0, 0, 5)
	}
}

ENT.Attachments = {
	["Minigun1"] = {
		Pos = Vector(0, -3, 0),
		Angle = Angle(0, 0, -90)
	},

	["Minigun2"] = {
		Pos = Vector(0, 3, 0),
		Angle = Angle(0, 0, 90)
	}
}

ENT.Weapons = {
	["Miniguns"] = {
		Name = "3-barrel Minigun",
		Sync = { 
			["1"] = { fire1 = "fire1" }
		},
		Attachment = "Minigun1"
	},

	["1"] = {
		Name = "3-barrel Minigun",
		Select = false,
		Attachment = "Minigun2"
	},
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()