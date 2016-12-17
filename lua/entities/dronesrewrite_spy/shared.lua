ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Spy Drone"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "SPY"

ENT.HUD_hudName = "White Box"

ENT.Model = "models/dronesrewrite/spydr/spydr.mdl"

ENT.Weight = 90

ENT.Speed = 650
ENT.UpSpeed = 3300
ENT.RotateSpeed = 5
ENT.AngOffset = 4
ENT.NoiseCoefficient = 0.8
ENT.Alignment = 3

ENT.Damping = 1
ENT.AngDamping = 0
ENT.AngPitchDamping = 1
ENT.AngYawDamping = 0.4
ENT.AngRollDamping = 1

ENT.HackValue = 3

ENT.FirstPersonCam_pos = Vector(20.5, 0, 0)
ENT.ThirdPersonCam_distance = 50
ENT.RenderCam = false

ENT.AllowYawRestrictions = true
ENT.YawMin = -80
ENT.YawMax = 80

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.AllowPitchRestrictions = false

ENT.HealthAmount = 50
ENT.DefaultHealth = 50

ENT.Fuel = 50
ENT.MaxFuel = 50
ENT.FuelReduction = 0.1

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/manhack/mh_engine_loop1.wav",
		Pitch = 200,
		Volume = 0.2,
		Level = 65
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_1.wav",
		Level = 69
	}
}

ENT.Propellers = {
	Damage = 1,
	Scale = 1.3,
	Health = 30,
	HitRange = 14,
	Model = "models/dronesrewrite/propellers/propeller1_2.mdl",

	Info = {
		Vector(0, 0, 1)
	}
}

ENT.Weapons = {
	["User & Invisible"] = { 
		Name = "User", 
		Sync = { ["1"] = { fire1 = "fire2" } } 
	},

	["1"] = { 
		Name = "Invisible",
		Select = false
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()