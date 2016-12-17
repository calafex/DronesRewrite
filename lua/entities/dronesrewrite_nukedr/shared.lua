ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Nuclear Winter"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.AdminOnly = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "NCL"

ENT.Weight = 1000
ENT.SpawnHeight = 64

ENT.Model = "models/dronesrewrite/nukedrone/nukedrone.mdl"

ENT.HealthAmount = 400
ENT.DefaultHealth = 400

ENT.HUD_hudName = "Drones 1"
ENT.OverlayName = "Red"

ENT.FirstPersonCam_pos = Vector(16, 0, 0)
ENT.ThirdPersonCam_distance = 300
ENT.RenderCam = false

ENT.ExplosionForce = 202
ENT.ExplosionAngForce = 0.1

ENT.NoiseCoefficient = 0

ENT.HackValue = 5

ENT.Speed = 7000
ENT.UpSpeed = 35000
ENT.SprintCoefficient = 1
ENT.RotateSpeed = 3
ENT.AngOffset = 2
ENT.PitchOffset = 0
ENT.Alignment = 3.5

ENT.Fuel = 300
ENT.MaxFuel = 300
ENT.FuelReduction = 0.8

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.PitchMin = -60
ENT.PitchMax = 60

ENT.AllowYawRestrictions = true
ENT.YawMin = -60
ENT.YawMax = 60

ENT.UseFlashlight = false

ENT.Sounds = {
	PropellerSound = {
		Name = "hl1/ambience/computalk2.wav",
		Pitch = 130,
		Level = 65,
		NoPitchChanges = true
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_1.wav",
		Pitch = 100,
		Level = 90
	}
}

ENT.NoPropellers = true
ENT.Propellers = {
	Model = "models/props_junk/PopCan01a.mdl",
	Info = { Vector(0, 0, 0) }
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()
ENT.Weapons = { ["Nuclear Bomb"] = { Name = "Nuclear Bomb" } }

ENT.AI_CustomEnemyChecker = function(drone, v)
	return drone:GetPos():Distance(v:GetPos()) < 150
end

ENT.AI_AirZ = -50
ENT.AI_DistanceEnemy = 20