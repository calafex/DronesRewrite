ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Plasma Bomb Drone"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "PB"

ENT.Weight = 120

ENT.Model = "models/dronesrewrite/plasmabomb/plasmabomb.mdl"

ENT.DoExplosionEffect = false

ENT.HealthAmount = 50
ENT.DefaultHealth = 50

ENT.HUD_hudName = "Drones 1"
ENT.OverlayName = "Red"

ENT.FirstPersonCam_pos = Vector(17, 0, 0)
ENT.ThirdPersonCam_distance = 50
ENT.RenderCam = false

ENT.NoiseCoefficient = 0

ENT.HUD_shouldDrawWeps = false

ENT.Speed = 1800
ENT.RotateSpeed = 9
ENT.AngOffset = 2
ENT.PitchOffset = 0.4
ENT.Alignment = 3.5

ENT.Fuel = 120
ENT.MaxFuel = 120
ENT.FuelReduction = 0.5

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.AllowPitchRestrictions = false
ENT.AllowYawRestrictions = true
ENT.YawMin = -60
ENT.YawMax = 60

ENT.UseFlashlight = false

ENT.AI_NoSkipZ = true
ENT.AI_AirZ = -50
ENT.AI_DistanceEnemy = 20
ENT.AI_MaxDistance = 60

ENT.Sounds = {
	PropellerSound = {
		Name = "hl1/ambience/computalk2.wav",
		Pitch = 130,
		Level = 65,
		NoPitchChanges = true
	},

	ExplosionSound = {
		Name = "drones/eblade_shock_01.wav",
		Level = 85
	}
}

ENT.NoPropellers = true
ENT.Propellers = {
	Model = "models/props_junk/PopCan01a.mdl",
	Info = { Vector(0, 0, 0) }
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()
ENT.Weapons = { ["Plasma Bomb"] = { Name = "Plasma Bomb" } }