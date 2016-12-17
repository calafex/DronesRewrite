ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
//ENT.PrintName = "CR 'Core'"
ENT.PrintName = "Core"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.RenderInCam = false
ENT.UNIT = "CR"

ENT.Model = "models/maxofs2d/hover_rings.mdl"

ENT.Weight = 80

ENT.Speed = 600
ENT.UpSpeed = 3000
ENT.SprintCoefficient = 3
ENT.RotateSpeed = 4
ENT.AngOffset = 0
ENT.NoiseCoefficient = 0
ENT.Alignment = 3
ENT.PitchOffset = 0

ENT.DoExplosionEffect = "splode_drone_sparks"

ENT.FirstPersonCam_pos = Vector(12, 0, 0)
ENT.ThirdPersonCam_distance = 50
ENT.RenderCam = false

ENT.HUD_shouldDrawWeps = false
ENT.HUD_hudName = "No HUD"

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.AllowPitchRestrictions = false

ENT.HealthAmount = 50
ENT.DefaultHealth = 50

ENT.Sounds = { }

ENT.UseFlashlight = false
ENT.UseNightVision = false

ENT.NoPropellers = true
ENT.Propellers = {
	Model = "models/props_junk/PopCan01a.mdl",
	Info = { Vector(0, 0, 0) }
}

ENT.Weapons = { ["Invisible"] = { Name = "Invisible" } }

ENT.Modules = DRONES_REWRITE.GetBaseModules()