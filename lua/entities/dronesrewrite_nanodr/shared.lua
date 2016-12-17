ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Nano Drone"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "NANO"

ENT.HUD_hudName = "Simple"

ENT.Model = "models/dronesrewrite/nanonew/nanodr.mdl"

ENT.Weight = 20

ENT.DoExplosionEffect = false
ENT.ExplosionForce = 0
ENT.ExplosionAngForce = 0

ENT.Speed = 180
ENT.UpSpeed = 500
ENT.RotateSpeed = 4
ENT.AngOffset = 2
ENT.NoiseCoefficient = 0.3
ENT.Alignment = 3

ENT.Fuel = 5
ENT.MaxFuel = 5
ENT.FuelReduction = 0.004

ENT.FirstPersonCam_pos = Vector(0, 0, -1)
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