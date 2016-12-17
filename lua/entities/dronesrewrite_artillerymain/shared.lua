ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Artillery Drone"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.AdminOnly = true
ENT.UNIT = "ARTM"

ENT.SpawnHeight = 150
ENT.Weight = 6000

ENT.HackValue = 5

ENT.Model = "models/dronesrewrite/artillerymain/artillerymain.mdl"

ENT.HealthAmount = 2000
ENT.DefaultHealth = 2000

ENT.ExplosionForce = 100
ENT.ExplosionAngForce = 0.01
ENT.DoExplosionEffect = "splode_big_drone_main"

ENT.FirstPersonCam_pos = Vector(215, 0, 20)
ENT.ThirdPersonCam_distance = 400
ENT.RenderCam = false

ENT.NoiseCoefficient = 0.1

ENT.Alignment = 0 --1.6
ENT.AlignmentRoll = 0.4
ENT.AlignmentPitch = 2

ENT.AngOffset = 1.3

ENT.SprintCoefficient = 2
ENT.Speed = 90000
ENT.UpSpeed = 500000
ENT.RotateSpeed = 2

ENT.Fuel = 800
ENT.MaxFuel = 800
ENT.FuelReduction = 0.6

ENT.PitchOffset = 0.01

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.AllowYawRestrictions = true
ENT.YawMin = -80
ENT.YawMax = 80
ENT.PitchMin = -60

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

ENT.NoPropellers = true
ENT.Propellers = {
	Model = "models/props_junk/PopCan01a.mdl",
	Info = { Vector(0, 0, 0) }
}

ENT.Attachments = {
	["Cannon"] = {
		Pos = Vector(0, 0, -35)
	}
}

ENT.Weapons = {
	["Artillery Cannon"] = {
		Name = "Artillery Cannon",
		Attachment = "Cannon"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()