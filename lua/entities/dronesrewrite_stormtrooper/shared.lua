ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Stormtrooper"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "STR"
ENT.HUD_hudName = "White Box"
ENT.OverlayName = "Sci Fi"

ENT.Weight = 400

ENT.Model = "models/dronesrewrite/stormtrooper/stormtrooper.mdl"

ENT.FirstPersonCam_pos = Vector(74, 0, 2)
ENT.RenderCam = false

ENT.DoExplosionEffect = false
ENT.ExplosionForce = 16
ENT.ExplosionAngForce = 1.7

ENT.Alignment = 0 --1.6
ENT.AlignmentRoll = 0.5
ENT.AlignmentPitch = 1.2

ENT.NoiseCoefficient = 0
ENT.NoiseCoefficientPos = 32
ENT.NoiseCoefficientAng = 0.3
ENT.AngOffset = 3.5

ENT.HackValue = 3

ENT.Speed = 7000
ENT.UpSpeed = 25000
ENT.RotateSpeed = 5

ENT.PitchOffset = 0.7

ENT.AllowYawRestrictions = true
ENT.YawMin = -80
ENT.YawMax = 80

ENT.PitchMin = -40
ENT.PitchMax = 60

ENT.Fuel = 200
ENT.MaxFuel = 200
ENT.FuelReduction = 0.17

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.HealthAmount = 400
ENT.DefaultHealth = 400

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/attack_helicopter/aheli_rotor_loop1.wav",
		Pitch = 130,
		NoPitchChanges = true,
		Level = 75,
		Volume = 0.72
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_7.wav",
		Level = 88
	}
}


ENT.Propellers = {
	Scale = 1.1,
	Damage = 2,
	Health = 120,
	HitRange = 20,
	Model = "models/dronesrewrite/propellers/propeller1_4.mdl",

	Info = {
		Vector(0, 0, 0)
	}
}

ENT.Attachments = {
	["Minigun"] = {
		Pos = Vector(54, 0, -4)
	}
}

ENT.Weapons = {
	["Light Minigun"] = {
		Name = "Light Minigun",
		Attachment = "Minigun"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()