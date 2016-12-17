ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "The Ball of Swiborg"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"
ENT.AdminOnly = true

ENT.RenderInCam = false
ENT.UNIT = "SWIBORG"
ENT.HUD_hudName = "Drones 1"

ENT.Weight = 2000

ENT.Model = "models/dronesrewrite/swiborg/swiborg.mdl"

ENT.FirstPersonCam_pos = Vector(16, 0, 4)
ENT.RenderCam = false

ENT.DoExplosionEffect = false
ENT.ExplosionForce = 228
ENT.ExplosionAngForce = 228

ENT.Alignment = 1.3

ENT.NoiseCoefficient = 0
ENT.AngOffset = 3

ENT.HackValue = 5

ENT.Speed = 80000
ENT.UpSpeed = 200000
ENT.RotateSpeed = 6
ENT.SprintCoefficient = 2

ENT.VelCoefficientOffset = 0.0015
ENT.VelCoefficientMax = 8
ENT.AngOffsetVel = 1

ENT.PitchOffset = 0.015

ENT.AllowPitchRestrictions = false
ENT.AllowYawRestrictions = true
ENT.YawMin = -60
ENT.YawMax = 60

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.HealthAmount = 100500
ENT.DefaultHealth = 100500

ENT.Sounds = {
	ExplosionSound = {
		Name = "ambient/explosions/citadel_end_explosion2.wav",
		Level = 100
	}
}

ENT.NoPropellers = true
ENT.Propellers = {
	Model = "models/props_junk/PopCan01a.mdl",
	Info = { Vector(0, 0, 0) }
}

ENT.Fuel = 2412341
ENT.MaxFuel = 2412341

ENT.UseFlashlight = false
ENT.UseNightVision = false

ENT.Weapons = { }

ENT.Modules = DRONES_REWRITE.GetAIModules()