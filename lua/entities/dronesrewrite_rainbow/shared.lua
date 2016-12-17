ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Rainbow Drone"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.RenderInCam = false
ENT.UNIT = "RAINBOW"
ENT.HUD_hudName = "No HUD"
ENT.OverlayName = "No Overlay"

ENT.Weight = 1000

ENT.Model = "models/Combine_Helicopter/helicopter_bomb01.mdl"

ENT.FirstPersonCam_pos = Vector(6, 0, 0)
ENT.RenderCam = false

ENT.DoExplosionEffect = "splode_drone_sparks"
ENT.ExplosionForce = 0
ENT.ExplosionAngForce = 0

ENT.Alignment = 5

ENT.NoiseCoefficient = 0
ENT.AngOffset = 6

ENT.Speed = 15000
ENT.UpSpeed = 60000
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

ENT.Sounds = {
	PropellerSound = {
		Name = "ambient/water/drip_loop1.wav",
		Level = 76,
		Pitch = 140,
		NoPitchChanges = true
	}
}

ENT.NoPropellers = true
ENT.Propellers = {
	Model = "models/props_junk/PopCan01a.mdl",
	Info = { Vector(0, 0, 0) }
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()