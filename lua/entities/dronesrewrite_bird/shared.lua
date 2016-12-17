ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
//ENT.PrintName = "BIR 'Bird'"
ENT.PrintName = "Bird Drone"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "BIR"

ENT.Model = "models/dronesrewrite/birddr/birddr.mdl"

ENT.FirstPersonCam_pos = Vector(0, 0, -5)
ENT.ThirdPersonCam_distance = 60

ENT.DoExplosionEffect = "splode_drone_sparks"

ENT.Weight = 30

ENT.AngOffset = 4
ENT.PitchOffset = 4

ENT.Fuel = 40
ENT.MaxFuel = 40

ENT.Speed = 900
ENT.UpSpeed = 4700
ENT.SprintCoefficient = 3
ENT.RotateSpeed = 6

ENT.HealthAmount = 30
ENT.DefaultHealth = 30

ENT.HUD_hudName = "Camera"
ENT.OverlayName = "No Overlay"

ENT.UseNightVision = false
ENT.UseFlashlight = false

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.AllowPitchRestrictions = false

ENT.Slots = {
	["Camera"] = 1
}

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/manhack/mh_engine_loop1.wav",
		Pitch = 200,
		Level = 72,
		Volume = 0.2
	},
	ExplosionSound = {
		Name = "ambient/energy/spark3.wav",
		Level = 100,
		Pitch = 150
	}
}


ENT.Propellers = {
	Scale = 1.5,
	Damage = 1,
	Health = 10,
	HitRange = 7,
	Model = "models/dronesrewrite/flower_propeller/flower_propeller.mdl",

	Info = {
		Vector(12.5, 11.4, 3.5),
		Vector(-12.5, -11.4, 3.5),
		Vector(-12.5, 11.4, 3.5),
		Vector(12.5, -11.4, 3.5)
	}
}

ENT.Weapons = { ["Camera"] = { Name = "Camera" } }

ENT.Modules = DRONES_REWRITE.GetBaseModules()
DRONES_REWRITE.CopyModule(ENT.Modules, "Nightvision")
DRONES_REWRITE.CopyModule(ENT.Modules, "Flashlight")
