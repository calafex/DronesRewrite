ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
//ENT.PrintName = "FLW 'Flower'"
ENT.PrintName = "Flower Drone"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "FLW"

ENT.Model = "models/dronesrewrite/flower/flower.mdl"

ENT.FirstPersonCam_pos = Vector(8, 0, 2)
ENT.ThirdPersonCam_distance = 70
ENT.RenderCam = false

ENT.DoExplosionEffect = "splode_drone_sparks"

ENT.Weight = 50

ENT.Speed = 600
ENT.UpSpeed = 3000
ENT.SprintCoefficient = 3
ENT.Alignment = 0.7
ENT.RotateSpeed = 11
ENT.AngOffset = 3

ENT.HealthAmount = 50
ENT.DefaultHealth = 50

ENT.Fuel = 40
ENT.MaxFuel = 40

ENT.HUD_hudName = "Camera"

ENT.UseNightVision = false
ENT.UseFlashlight = false

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.AllowPitchRestrictions = false

ENT.Slots = {
	["Camera"] = 1
}

ENT.Sounds = {
	PropellerSound = {
		Name = "drones/ardr.wav",
		Pitch = 110,
		Level = 60,
		PitchCoef = 0.015,
		Volume = 0.2
	},

	ExplosionSound = {
		Name = "ambient/energy/spark3.wav",
		Level = 100,
		Pitch = 150
	}
}


ENT.Propellers = {
	Damage = 1,
	Health = 10,
	HitRange = 7,
	Model = "models/dronesrewrite/flower_propeller/flower_propeller.mdl",

	HitPitch = 255,
	HitLevel = 60,
	RandomHitSounds = { "physics/metal/metal_box_impact_bullet2.wav", "physics/metal/metal_box_impact_bullet2.wav", "physics/metal/metal_box_impact_bullet2.wav" },
	RandomLoseSounds = { "physics/glass/glass_cup_break1.wav", "physics/glass/glass_cup_break2.wav" },

	LosePitch = 255,
	LoseLevel = 65,

	Info = {
		Vector(8.65, 8.65, 3),
		Vector(-8.65, -8.65, 3),
		Vector(-8.65, 8.65, 3),
		Vector(8.65, -8.65, 3)
	}
}

ENT.Weapons = { ["Camera"] = { Name = "Camera" } }

ENT.Modules = DRONES_REWRITE.GetSystemModules()

ENT.Modules["Nightvision"] = {
	Slot = "Camera",

	Initialize = function(drone)
		drone.UseNightVision = true
	end,

	OnRemove = function(drone)
		drone.UseNightVision = false
		drone:SetNWBool("NightVision", false)
	end,

	Think = function(drone) end
}

ENT.Modules["Flashlight"] = {
	Slot = "Camera",

	Initialize = function(drone)
		drone.UseFlashlight = true
	end,

	OnRemove = function(drone)
		drone.UseFlashlight = false
		drone:SetNWBool("Flashlight", false)
	end,

	Think = function(drone) end
}