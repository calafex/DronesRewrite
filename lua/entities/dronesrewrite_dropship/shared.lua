ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
//ENT.PrintName = "DPS 'Dropship'"
ENT.PrintName = "Dropship"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "DPS"

ENT.Model = "models/dronesrewrite/dropship/dropship.mdl"

ENT.Weight = 2000
ENT.SpawnHeight = 128
ENT.DisableInWater = false

ENT.UseFlashlight = false

ENT.NoiseCoefficient = 0.1

ENT.ExplosionForce = 64
ENT.ExplosionAngForce = 0.06
ENT.DoExplosionEffect = "splode_big_drone_main"

ENT.HealthAmount = 1200
ENT.DefaultHealth = 1200

ENT.Speed = 46000
ENT.UpSpeed = 146000
ENT.RotateSpeed = 4
ENT.AngOffset = 1

ENT.HackValue = 4

ENT.Alignment = 0
ENT.AlignmentRoll = 1
ENT.AlignmentPitch = 2

ENT.Fuel = 600
ENT.MaxFuel = 600
ENT.FuelReduction = 0.8

ENT.PitchOffset = 0

ENT.FirstPersonCam_pos = Vector(-10, 0, -36)
ENT.ThirdPersonCam_distance = 300
ENT.RenderCam = false

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/attack_helicopter/aheli_wash_loop3.wav",
		Pitch = 180,
		Level = 75,
		Volume = 0.7
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_5.wav",
		Level = 90
	}
}

ENT.Attachments = {
	["Center"] = {
		Pos = Vector(0, 0, -23)
	},

	["Center+"] = {
		Pos = Vector(46, 0, -24)
	},

	["Center++"] = {
		Pos = Vector(92, 0, -24)
	},


	["CenterLeft"] = {
		Pos = Vector(0, 50, -12)
	},

	["CenterLeft+"] = {
		Pos = Vector(46, 50, -12)
	},

	["CenterLeft++"] = {
		Pos = Vector(92, 50, -12)
	},


	["CenterRight"] = {
		Pos = Vector(0, -50, -12)
	},

	["CenterRight+"] = {
		Pos = Vector(46, -50, -12)
	},

	["CenterRight++"] = {
		Pos = Vector(92, -50, -12)
	},


	["UpLeft"] = {
		Pos = Vector(0, 120, 24),
		Angle = Angle(0, 0, 180)
	},

	["UpRight"] = {
		Pos = Vector(0, -120, 24),
		Angle = Angle(0, 0, 180)
	},

	["UpLeft+"] = {
		Pos = Vector(46, 120, 21),
		Angle = Angle(0, 0, 180)
	},

	["UpRight+"] = {
		Pos = Vector(46, -120, 21),
		Angle = Angle(0, 0, 180)
	}
}

ENT.NoPropellers = true
ENT.Propellers = {
	Model = "models/props_junk/PopCan01a.mdl",
	Info = { Vector(0, 0, 0) }
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()