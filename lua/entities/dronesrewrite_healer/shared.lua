ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
//ENT.PrintName = "REP 'Repairer'"
ENT.PrintName = "Repairer"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.DoExplosionEffect = true

ENT.UNIT = "REP"

ENT.Weight = 150

ENT.Model = "models/dronesrewrite/repairer/repairer.mdl"

ENT.FirstPersonCam_pos = Vector(14, 0, 0)
ENT.RenderCam = false

ENT.NoiseCoefficient = 0
ENT.NoiseCoefficientAng = 0.6
ENT.NoiseCoefficientPos = 8
ENT.AngOffset = 4

ENT.Speed = 3000
ENT.UpSpeed = 15000
ENT.RotateSpeed = 8
ENT.Alignment = 2

ENT.Fuel = 90
ENT.MaxFuel = 90
ENT.FuelReduction = 0.2

ENT.HackValue = 2

ENT.HealthAmount = 90
ENT.DefaultHealth = 90

ENT.PitchMin = -35

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.AI_ReverseCheck = true
ENT.AI_CustomEnemyChecker = function(drone, v)
	return v.IS_DRR and v:GetHealth() < v:GetDefaultHealth()
end

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/manhack/mh_engine_loop2.wav",
		Pitch = 150,
		Level = 68,
		Volume = 0.75
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_1.wav",
		Level = 80
	}
}

ENT.Propellers = {
	Scale = 1.05,
	Damage = 1,
	Health = 40,
	HitRange = 15,
	Model = "models/dronesrewrite/propellers/propeller2_3.mdl",

	Info = {
		Vector(-0.7, 26.8, 4.5),
		Vector(-0.7, -26.8, 4.5)
	}
}

ENT.Attachments = {
	["Repairer"] = { 
		Pos = Vector(0, 0, -4)
	}
}

ENT.Weapons = {
	["Repairer"] = {
		Name = "Repairer",
		Attachment = "Repairer"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()