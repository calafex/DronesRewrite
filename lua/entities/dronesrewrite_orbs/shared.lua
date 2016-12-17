ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Orbital Strike Marker"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "ORBS"

ENT.HUD_hudName = "Simple"

ENT.Model = "models/dronesrewrite/orbsdr/orbsdr.mdl"

ENT.Weight = 300

ENT.Speed = 5200
ENT.UpSpeed = 25000
ENT.AngOffset = 3
ENT.RotateSpeed = 3
ENT.Alignment = 1
ENT.PitchOffset = 0.6

ENT.NoiseCoefficient = 0
ENT.NoiseCoefficientAng = 0.1
ENT.NoiseCoefficientPos = 2

ENT.ThirdPersonCam_distance = 200
ENT.FirstPersonCam_pos = Vector(20, 0, 8)
ENT.RenderCam = false

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.AllowYawRestrictions = true
ENT.YawMin = -70
ENT.YawMax = 70

ENT.HackValue = 4

ENT.PitchMin = -60
ENT.PitchMax = 60

ENT.Fuel = 80
ENT.MaxFuel = 80
ENT.FuelReduction = 0.2

ENT.UseFlashlight = false

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/manhack/mh_engine_loop1.wav",
		Pitch = 60,
		Level = 72
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_1.wav",
		Level = 80
	}
}


ENT.Propellers = {
	Damage = 2,
	Health = 30,
	HitRange = 14,
	Model = "models/dronesrewrite/propellers/propeller2_3.mdl",

	Info = {
		Vector(7, 30.5, 19),
		Vector(7, -30.5, 19)
	}
}

ENT.Weapons = {
	["Orbital Strike"] = {
		Name = "Orbital Strike"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()