ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Capacitor"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "CAP"

ENT.HUD_hudName = "White Box"

ENT.Model = "models/dronesrewrite/nanodr/nano.mdl"

ENT.Weight = 20

ENT.DoExplosionEffect = "splode_drone_sparks"
ENT.ExplosionForce = 0
ENT.ExplosionAngForce = 0

ENT.Speed = 300
ENT.UpSpeed = 1500
ENT.RotateSpeed = 6
ENT.AngOffset = 2
ENT.NoiseCoefficient = 0.3
ENT.Alignment = 3

ENT.Fuel = 5
ENT.MaxFuel = 5
ENT.FuelReduction = 0.004

/*ENT.Damping = 0.7
ENT.AngDamping = 0
ENT.AngPitchDamping = 1
ENT.AngYawDamping = 0.5
ENT.AngRollDamping = 1*/

ENT.FirstPersonCam_pos = Vector(2, 0, 0)
ENT.ThirdPersonCam_distance = 30
ENT.RenderCam = false

ENT.AllowYawRestrictions = true
ENT.YawMin = -60
ENT.YawMax = 60

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.AllowPitchRestrictions = false
ENT.UseFlashlight = false

ENT.HealthAmount = 25
ENT.DefaultHealth = 25

ENT.Sounds = {
	ExplosionSound = {
		Name = "ambient/energy/spark3.wav",
		Level = 80,
		Pitch = 150
	}
}

ENT.NoPropellers = true
ENT.Propellers = {
	Model = "models/props_junk/PopCan01a.mdl",
	Info = { Vector(0, 0, 0) }
}

ENT.Weapons = { }

ENT.Modules = DRONES_REWRITE.GetBaseModules()

ENT.AI_AirZ = -50
ENT.AI_DistanceEnemy = 5