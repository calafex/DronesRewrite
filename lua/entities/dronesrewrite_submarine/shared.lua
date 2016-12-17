ENT.Base = "dronesrewrite_base"
ENT.DrrBaseType = "underwater"
ENT.Type = "anim"
ENT.PrintName = "Submarine"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "SBM"

ENT.Weight = 250

ENT.Model = "models/dronesrewrite/submarine/submarine.mdl"

ENT.FirstPersonCam_pos = Vector(0, 0, 33)
ENT.ThirdPersonCam_pos = Vector(0, -30, 120)
ENT.ThirdPersonCam_distance = 130
ENT.RenderCam = false

ENT.DoExplosionEffect = "splode_big_drone_main"

ENT.NoiseCoefficient = 0.1
ENT.AngOffset = 3

ENT.PitchMin = -65

ENT.HealthAmount = 500
ENT.DefaultHealth = 500

ENT.HackValue = 3

ENT.Alignment = 3
ENT.Speed = 2600
ENT.UpSpeed = 14000
ENT.RotateSpeed = 7
ENT.PitchOffset = 0
ENT.AngOffset = 3

ENT.Fuel = 400
ENT.MaxFuel = 400
ENT.FuelReduction = 1.3

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/manhack/mh_engine_loop1.wav",
		Pitch = 120,
		Level = 76
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_1.wav",
		Level = 80
	}
}

ENT.UseFlashlight = false

ENT.Weapons = { }
ENT.Modules = DRONES_REWRITE.GetBaseModules()