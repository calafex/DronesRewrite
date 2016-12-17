ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Ambulance"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "AMB"
ENT.Weight = 250

ENT.Model = "models/dronesrewrite/medic/medic.mdl"

ENT.FirstPersonCam_pos = Vector(13, 0, -10)
ENT.RenderCam = false

ENT.ExplosionForce = 16
ENT.ExplosionAngForce = 1.7

ENT.Alignment = 0 --1.6
ENT.AlignmentRoll = 0.7
ENT.AlignmentPitch = 1.6

ENT.NoiseCoefficient = 0.4
ENT.AngOffset = 4

ENT.Speed = 4800
ENT.UpSpeed = 24000
ENT.RotateSpeed = 7

ENT.HackValue = 2

ENT.Fuel = 100
ENT.MaxFuel = 100
ENT.FuelReduction = 0.3

ENT.PitchOffset = 0.8

ENT.AllowYawRestrictions = true
ENT.YawMin = -60
ENT.YawMax = 60

ENT.PitchMin = -40
ENT.PitchMax = 64

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.HealthAmount = 250
ENT.DefaultHealth = 250

ENT.AI_ReverseCheck = true
ENT.AI_CustomEnemyChecker = function(drone, v)
	return (not v.IS_DRR and not v.IS_DRONE) and v:Health() < v:GetMaxHealth()
end

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/manhack/mh_engine_loop1.wav",
		Pitch = 120,
		Level = 71,
		Volume = 0.75
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_7.wav",
		Level = 85
	}
}


ENT.Propellers = {
	Damage = 1,
	Health = 50,
	HitRange = 12,
	Model = "models/dronesrewrite/rotor_smb/rotor_smb.mdl",

	Info = {
		Vector(-18, 41, 11),
		Vector(-18, -41, 11),
		Vector(36.5, 0, 11)
	}
}

ENT.Attachments = {
	["Healer"] = {
		Pos = Vector(-10, 0, -6)
	}
}

ENT.Weapons = {
	["Healer"] = {
		Name = "Healer",
		Attachment = "Healer"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()
