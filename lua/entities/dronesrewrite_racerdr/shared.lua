ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Racing Drone"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "RD"

ENT.Model = "models/dronesrewrite/racerdr/racerdr.mdl"

ENT.HUD_hudName = "Camera"
ENT.OverlayName = "No Overlay"

ENT.FirstPersonCam_pos = Vector(9, 0, 2)
ENT.ThirdPersonCam_distance = 50
ENT.RenderCam = false

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.PitchMin = -30
ENT.PitchMax = 30

ENT.AllowYawRestrictions = true
ENT.YawMin = -50
ENT.YawMax = 50

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

ENT.DoExplosionEffect = "splode_drone_sparks"

ENT.Weight = 30

ENT.AngOffset = 4
ENT.PitchOffset = 4

ENT.Fuel = 40
ENT.MaxFuel = 40

ENT.NoiseCoefficient = 0
ENT.NoiseCoefficientAng = 0.4
ENT.NoiseCoefficientPos = 0.2

--[[ENT.Speed = 900
ENT.UpSpeed = 4700
ENT.SprintCoefficient = 3
ENT.RotateSpeed = 6]]--

ENT.Alignment = 0.3
ENT.AngOffset = 3

ENT.RotateSpeed = 6
ENT.UpSpeed = 5000
ENT.Speed = 1000

ENT.SprintCoefficient = 2

ENT.AngYawDamping = 0.5

ENT.HealthAmount = 15
ENT.DefaultHealth = 15

ENT.Propellers = {
	Damage = 1,
	Scale = 0.8,
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
		Vector(4.5, 7.2, 1.5),
		Vector(-5.5, -7.2, 1.5),
		Vector(-5.5, 7.2, 1.5),
		Vector(4.5, -7.2, 1.5)
	}
}

ENT.UseFlashlight = false
ENT.UseNightVision = false

//ENT.Weapons = { ["Camera"] = { Name = "Camera" } }

ENT.Modules = DRONES_REWRITE.GetBaseModules()
DRONES_REWRITE.CopyModule(ENT.Modules, "Nightvision")
DRONES_REWRITE.CopyModule(ENT.Modules, "Flashlight")
