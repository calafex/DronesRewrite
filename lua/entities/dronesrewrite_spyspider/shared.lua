ENT.Base = "dronesrewrite_base"
ENT.DrrBaseType = "walker"
ENT.Type = "anim"
ENT.PrintName = "Spider Drone"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UseSpiderPhysics = true

ENT.DoExplosionEffect = "splode_drone_sparks"

ENT.UNIT = "SPD"

ENT.Model = "models/dronesrewrite/spider/spider.mdl"

ENT.SpawnHeight = 16
ENT.Weight = 32

ENT.OverlayName = "Red"
ENT.HUD_hudName = "White Box"

ENT.FirstPersonCam_pos = Vector(7, 0, 1)
ENT.ThirdPersonCam_distance = 100
ENT.RenderCam = false

ENT.Speed = 2500
ENT.UpSpeed = 0
ENT.SprintCoefficient = 1
ENT.RotateSpeed = 50
ENT.PitchOffset = 0
ENT.Hover = 12

ENT.HackValue = 2

ENT.AngSlip = 0.1

ENT.ExplosionForce = 2
ENT.ExplosionAngForce = 0.03

ENT.AllowPitchRestrictions = true
ENT.PitchMin = -70
ENT.PitchMax = 70

ENT.AllowYawRestrictions = true
ENT.YawMin = -40
ENT.YawMax = 40

ENT.NoiseCoefficient = 0

ENT.WaitForSound = 0.1

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.HealthAmount = 50
ENT.DefaultHealth = 50

ENT.Fuel = 20
ENT.MaxFuel = 20
ENT.FuelReduction = 0.2

ENT.UseFlashlight = false

ENT.AI_DistanceEnemy = 30

ENT.AI_CustomEnemyChecker = function(drone, v)
	return drone:GetPos():Distance(v:GetPos()) < 40
end

ENT.Sounds = {
	ExplosionSound = {
		Name = "ambient/explosions/explode_1.wav",
		Level = 82
	},

	FootSound = {
		Sounds = {
			"physics/concrete/rock_impact_hard1.wav",
			"physics/concrete/rock_impact_hard2.wav",
			"physics/concrete/rock_impact_hard3.wav",
			"physics/concrete/rock_impact_hard4.wav"
		},

		Pitch = 250,
		Volume = 52
	}
}

ENT.Corners = {
	Vector(-10, -4, 0),
	Vector(-10, 4, 0),

	Vector(8, 4, 0),
	Vector(8, -4, 0)
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()
ENT.Weapons = { ["Bite"] = { Name = "Spider Bite", Pos = Vector(8, 0, 2) } }
