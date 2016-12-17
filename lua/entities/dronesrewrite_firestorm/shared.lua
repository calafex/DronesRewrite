ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
//ENT.PrintName = "FRS 'Firestorm'"
ENT.PrintName = "Firestorm"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "FRS"
ENT.HUD_hudName = "White Box"

ENT.Weight = 350

ENT.Model = "models/dronesrewrite/flamethrower/flamethrowerdr.mdl"

ENT.FirstPersonCam_pos = Vector(28, 6.8, 6)
ENT.ThirdPersonCam_distance = 140
ENT.RenderCam = false

ENT.ExplosionForce = 16
ENT.ExplosionAngForce = 1.7

ENT.Alignment = 0 --1.6
ENT.AlignmentRoll = 0.5
ENT.AlignmentPitch = 1

ENT.NoiseCoefficient = 0
ENT.NoiseCoefficientPos = 15
ENT.NoiseCoefficientAng = 0.2
ENT.AngOffset = 3

ENT.HackValue = 3

ENT.Speed = 4500
ENT.UpSpeed = 24000
ENT.RotateSpeed = 6

ENT.PitchOffset = 0.7

ENT.AllowYawRestrictions = true
ENT.YawMin = -60
ENT.YawMax = 60

ENT.PitchMin = -30
ENT.PitchMax = 50

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.Fuel = 200
ENT.MaxFuel = 200
ENT.FuelReduction = 0.3

ENT.HealthAmount = 300
ENT.DefaultHealth = 300

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/attack_helicopter/aheli_rotor_loop1.wav",
		Pitch = 120,
		Level = 72,
		Volume = 0.5
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_7.wav",
		Level = 80
	}
}


ENT.Propellers = {
	Damage = 1,
	Health = 50,
	HitRange = 19,
	Model = "models/dronesrewrite/propellers/propeller2_4.mdl",

	Info = {
		Vector(8, 41.5, 7),
		Vector(8, -41.5, 7),
	}
}

ENT.Attachments = {
	["Flamethrower"] = {
		Pos = Vector(-1, 0, -6)
	}
}

ENT.Weapons = {
	["Flamethrower"] = {
		Name = "Flamethrower",
		Attachment = "Flamethrower"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()