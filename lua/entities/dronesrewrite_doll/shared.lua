ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Doll Drone"
ENT.Spawnable = false
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.RenderInCam = false
ENT.UNIT = "DOLL"
ENT.HUD_hudName = "No HUD"
ENT.OverlayName = "No Overlay"

ENT.Weight = 30

ENT.Model = "models/props_c17/doll01.mdl"

ENT.FirstPersonCam_pos = Vector(0, 0, 6)
ENT.RenderCam = false

ENT.DoExplosionEffect = false
ENT.ExplosionForce = 0
ENT.ExplosionAngForce = 0

ENT.Alignment = 5

ENT.NoiseCoefficient = 0
ENT.AngOffset = 6

ENT.Speed = 150
ENT.UpSpeed = 600
ENT.RotateSpeed = 7

ENT.PitchOffset = 0

ENT.AllowPitchRestrictions = false

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.ShouldConsumeFuel = false
ENT.Fuel = 1
ENT.MaxFuel = 1

ENT.HealthAmount = 60
ENT.DefaultHealth = 60

ENT.UseFlashlight = false
ENT.UseNightVision = false

ENT.Sounds = {}

ENT.NoPropellers = true
ENT.Propellers = {
	Model = "models/props_junk/PopCan01a.mdl",
	Info = { Vector(0, 0, 0) }
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()