ENT.Base = "dronesrewrite_base"
ENT.DrrBaseType = "walker"
ENT.Type = "anim"
ENT.PrintName = "Walking Tank"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "WT"

ENT.Model = "models/dronesrewrite/walkerart/walkerart.mdl"

ENT.SpawnHeight = 64
ENT.Weight = 3000

ENT.OverlayName = "Drones 2"
ENT.HUD_hudName = "White Box"

ENT.FirstPersonCam_pos = Vector(47, 0, 0)
ENT.ThirdPersonCam_pos = Vector(0, 0, 100)
ENT.ThirdPersonCam_distance = 250
ENT.RenderCam = false

ENT.Speed = 50000
ENT.SprintCoefficient = 1
ENT.RotateSpeed = 60
ENT.Hover = 60
ENT.PitchOffset = 0
ENT.AngOffset = 0

ENT.HackValue = 4

ENT.ExplosionForce = 2
ENT.ExplosionAngForce = 0.1
ENT.DoExplosionEffect = "ssplode_big_drone_main"

ENT.AllowPitchRestrictions = true
ENT.PitchMin = -90
ENT.PitchMax = 50

ENT.AllowYawRestrictions = true
ENT.YawMin = -140
ENT.YawMax = 140

ENT.Fuel = 700
ENT.MaxFuel = 700
ENT.FuelReduction = 8

ENT.NoiseCoefficient = 0
ENT.NoiseCoefficientAng = 6
ENT.NoiseCoefficientPos = 0

ENT.WaitForSound = 0.28

ENT.Slip = 100
ENT.AngSlip = 0.1

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()
ENT.KeysFuncs.Physics["Up"] = function(self)
end

ENT.KeysFuncs.Physics["Down"] = function(self)
end

ENT.HealthAmount = 1500
ENT.DefaultHealth = 1500

ENT.Sounds = {
	ExplosionSound = {
		Name = "ambient/explosions/explode_1.wav",
		Level = 82
	},

	FootSound = {
		Sounds = {
			"physics/flesh/flesh_strider_impact_bullet1.wav",
			"physics/flesh/flesh_strider_impact_bullet2.wav",
			--"physics/flesh/flesh_strider_impact_bullet3.wav"
		},

		Pitch = 60,
		Volume = 81
	}
}

ENT.Corners = {
	Vector(-50, -44, 0),
	Vector(-50, 44, 0),
	Vector(44, 44, 0),
	Vector(44, -44, 0)
}

ENT.Legs = {
	["Rmain"] = { --Back
		model = "models/dronesrewrite/legs/legartp1.mdl", 
		rel = nil, 
		pos = Vector(-48, -64, -3), 
		ang = Angle(0, 135, 0), 
		scale = Vector(1, 1, 1), 
		pitch = 0,
		yaw = 1 
	},

	["Lmain"] = { --Forward
		model = "models/dronesrewrite/legs/legartp1.mdl", 
		rel = nil, 
		pos = Vector(48, -64, -3), 
		ang = Angle(0, 45, 0), 
		scale = Vector(1, 1, 1), 
		pitch = 0, 
		yaw = -1  
	},

	["Bmain"] = { --Back
		model = "models/dronesrewrite/legs/legartp1.mdl",
		rel = nil, 
		pos = Vector(-48, 64, -3), 
		ang = Angle(0, -135, 0), 
		scale = Vector(1, 1, 1), 
		pitch = 0, 
		yaw = 1
	},

	["Wmain"] = { --Forward
		model = "models/dronesrewrite/legs/legartp1.mdl", 
		rel = nil, 
		pos = Vector(48, 64, -3), 
		ang = Angle(0, -45, 0), 
		scale = Vector(1, 1, 1), 
		pitch = 0, 
		yaw = -1
	},

	["_1"] = {
		model = "models/dronesrewrite/legs/legartp2.mdl", 
		rel = "Rmain", 
		pos = Vector(53, 0, 11), 
		ang = Angle(0, 0, 0), 
		scale = Vector(1, 1, 1), 
		pitch = -1, 
		yaw = 0
	},

	["_2"] = {
		model = "models/dronesrewrite/legs/legartp2.mdl", 
		rel = "Lmain", 
		pos = Vector(53, 0, 11), 
		ang = Angle(0, 0, 0), 
		scale = Vector(1, 1, 1), 
		pitch = 1, 
		yaw = 0
	},

	["_3"] = {
		model = "models/dronesrewrite/legs/legartp2.mdl", 
		rel = "Bmain", 
		pos = Vector(53, 0, 11), 
		ang = Angle(0, 0, 0), 
		scale = Vector(1, 1, 1), 
		pitch = 1, 
		yaw = 0
	},

	["_4"] = {
		model = "models/dronesrewrite/legs/legartp2.mdl", 
		rel = "Wmain", 
		pos = Vector(53, 0, 11), 
		ang = Angle(0, 0, 0), 
		scale = Vector(1, 1, 1), 
		pitch = -1, 
		yaw = 0
	}
}

ENT.Attachments = {
	["MissileLRight"] = {
		Pos = Vector(-15, -66, 22.5)
	},

	["MissileLLeft"] = {
		Pos = Vector(-15, 66, 22.5)
	},

	["MinigunRight"] = {
		Pos = Vector(48, -18, -16)
	},

	["MinigunLeft"] = {
		Pos = Vector(48, 18, -16)
	}
}

ENT.Weapons = {
	["Missile Battery"] = {
		Name = "Missile Battery",
		Sync = {
			["Missile Battery 2"] = { fire1 = "fire1" }
		},
		Attachment = "MissileLRight"
	},

	["Missile Battery 2"] = {
		Name = "Missile Battery",
		Select = false,
		Attachment = "MissileLLeft"
	},

	["Heavy Miniguns"] = {
		Name = "Heavy Minigun",
		Sync = {
			["Minigun 2"] = { fire1 = "fire1" }
		},
		Attachment = "MinigunRight"
	},

	["Minigun 2"] = {
		Name = "Heavy Minigun",
		Select = false,
		Attachment = "MinigunLeft"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()