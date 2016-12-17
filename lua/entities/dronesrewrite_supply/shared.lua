ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Supply Drone"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "SUPP"
ENT.HUD_hudName = "Drones 1"

ENT.Weight = 250

ENT.Model = "models/dronesrewrite/supplydr/supplydrone.mdl"

ENT.FirstPersonCam_pos = Vector(25, -1.5, 3.5)
ENT.RenderCam = false

ENT.ExplosionForce = 228
ENT.ExplosionAngForce = 228

ENT.Alignment = 1.3

ENT.NoiseCoefficient = 0
ENT.AngOffset = 3

ENT.HackValue = 5

ENT.Speed = 2000
ENT.UpSpeed = 6000
ENT.RotateSpeed = 3
ENT.SprintCoefficient = 2

ENT.AngOffsetVel = 1

ENT.PitchOffset = 0.015

ENT.AllowPitchRestrictions = false
ENT.AllowYawRestrictions = true
ENT.YawMin = -60
ENT.YawMax = 60

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.HealthAmount = 400
ENT.DefaultHealth = 400

ENT.AutomaticFrameAdvance = true

ENT.Sounds = {
	ExplosionSound = {
		Name = "ambient/explosions/explode_7.wav",
		Level = 82
	}
}

ENT.NoPropellers = true
ENT.Propellers = {
	Model = "models/props_junk/PopCan01a.mdl",
	Info = { Vector(0, 0, 0) }
}

ENT.Fuel = 250
ENT.MaxFuel = 250

ENT.UseFlashlight = false

ENT.Weapons = { }

ENT.Modules = DRONES_REWRITE.GetBaseModules()