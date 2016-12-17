ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Deus Ex Machina"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.AdminOnly = true
ENT.UNIT = "DEM"

ENT.SpawnHeight = 300
ENT.Weight = 6000

ENT.HackValue = 5

ENT.Model = "models/dronesrewrite/exmac/exmac.mdl"

ENT.DoExplosionEffect = false

ENT.HealthAmount = 5000
ENT.DefaultHealth = 5000

ENT.ExplosionForce = 300
ENT.ExplosionAngForce = 0.03
ENT.DoExplosionEffect = "splode_big_drone_main"

ENT.FirstPersonCam_pos = Vector(150, 0, -90)
ENT.ThirdPersonCam_distance = 400
ENT.RenderCam = false

ENT.NoiseCoefficient = 0.1

ENT.Alignment = 0 --1.6
ENT.AlignmentRoll = 1.4
ENT.AlignmentPitch = 3

ENT.AngOffset = 1

ENT.SprintCoefficient = 1
ENT.Speed = 40000
ENT.UpSpeed = 200000
ENT.RotateSpeed = 2

ENT.Fuel = 1200
ENT.MaxFuel = 1200
ENT.FuelReduction = 0.6

ENT.PitchOffset = 0

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.AllowYawRestrictions = true
ENT.YawMin = -80
ENT.YawMax = 80

ENT.PitchMin = -60
ENT.AI_AirZ = 1000
ENT.AI_DistanceEnemy = 1
ENT.AI_MaxDistance = 400

ENT.Sounds = {
	PropellerSound = {
		Name = "ambient/machines/laundry_machine1_amb.wav",
		Pitch = 85,
		Level = 90,
		NoPitchChanges = true
	},
	
	ExplosionSound = {
		Name = "ambient/explosions/explode_8.wav",
		Level = 100,
		Pitch = 90
	}
}

ENT.Attachments = {
	["DownBack"] = {
		Pos = Vector(-187, -187, -73)
	},

	["DownForward"] = {
		Pos = Vector(187, 187, -73)
	},

	["UpRight"] = {
		Pos = Vector(260, -260, 33),
		Angle = Angle(0, 0, 180)
	},

	["UpLeft"] = {
		Pos = Vector(-260, 260, 33),
		Angle = Angle(0, 0, 180)
	}
}

ENT.NoPropellers = true
ENT.Propellers = {
	Model = "models/props_junk/PopCan01a.mdl",
	Info = { Vector(0, 0, 0) }
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()