ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "AR Drone Light"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "AR"

ENT.Model = "models/dronesrewrite/ardrone2/ardrone.mdl"

ENT.HUD_hudName = "Camera"
ENT.OverlayName = "No Overlay"

ENT.FirstPersonCam_pos = Vector(18, 0, -2)
ENT.ThirdPersonCam_distance = 50
ENT.RenderCam = false

ENT.DoExplosionEffect = "splode_drone_sparks"

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.PitchMin = -20
ENT.PitchMax = 20

ENT.AllowYawRestrictions = true
ENT.YawMin = -20
ENT.YawMax = 20

ENT.Sounds = {
	PropellerSound = {
		Name = "drones/ardr.wav",
		Pitch = 90,
		Level = 65,
		Volume = 0.2,
		PitchCoef = 0.015
	},

	ExplosionSound = {
		Name = "ambient/energy/spark3.wav",
		Level = 100,
		Pitch = 150
	}
}

ENT.Weight = 90

ENT.HealthAmount = 60
ENT.DefaultHealth = 60

ENT.Fuel = 40
ENT.MaxFuel = 40

ENT.Alignment = 0.3
ENT.AngOffset = 3
ENT.RotateSpeed = 5

ENT.SprintCoefficient = 1.5

ENT.AngYawDamping = 0.5

ENT.Propellers = {
	Damage = 1,
	Scale = 1.5,
	Health = 20,
	HitRange = 9,
	Model = "models/dronesrewrite/flower_propeller/flower_propeller.mdl",

	HitPitch = 255,
	HitLevel = 60,
	RandomHitSounds = { "physics/metal/metal_box_impact_bullet2.wav", "physics/metal/metal_box_impact_bullet2.wav", "physics/metal/metal_box_impact_bullet2.wav" },
	RandomLoseSounds = { "physics/glass/glass_cup_break1.wav", "physics/glass/glass_cup_break2.wav" },

	LosePitch = 255,
	LoseLevel = 65,

	Info = {
		Vector(10.33, 10.33, -2.7),
		Vector(-10.33, -10.33, -2.7),
		Vector(-10.33, 10.33, -2.7),
		Vector(10.33, -10.33, -2.7)
	}
}

ENT.UseFlashlight = false
ENT.UseNightVision = false

ENT.Weapons = { ["Camera"] = { Name = "Camera" } }

ENT.Modules = DRONES_REWRITE.GetBaseModules()
DRONES_REWRITE.CopyModule(ENT.Modules, "Nightvision")
DRONES_REWRITE.CopyModule(ENT.Modules, "Flashlight")
