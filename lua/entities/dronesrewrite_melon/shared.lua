ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Melon True Drone"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"
ENT.AdminOnly = true

ENT.UNIT = "MELOON"
ENT.HUD_hudName = "Simple"

ENT.Weight = 5000

ENT.HackValue = 5

ENT.Model = "models/props_junk/watermelon01.mdl"

ENT.FirstPersonCam_pos = Vector(0, 0, 0)
ENT.RenderCam = false

ENT.DoExplosionEffect = "splode_big_drone_main"
ENT.ExplosionForce = 420
ENT.ExplosionAngForce = 228

ENT.Alignment = 6

ENT.NoiseCoefficient = 0
ENT.AngOffset = 0

ENT.Speed = 300000
ENT.UpSpeed = 600000
ENT.RotateSpeed = 8
ENT.SprintCoefficient = 10

ENT.PitchOffset = 0

ENT.AllowPitchRestrictions = false

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.HealthAmount = 999
ENT.DefaultHealth = 999

ENT.Sounds = {
	ExplosionSound = {
		Name = "ambient/explosions/citadel_end_explosion2.wav",
		Level = 100
	},

	ShutdownSound = {
		Name = "vo/npc/male01/ohno.wav",
		Level = 100
	},

	Wind = {
		"ambient/wind/wind_hit2.wav",
		"ambient/wind/wind_moan1.wav",
		"ambient/wind/wind_moan2.wav",
		"ambient/wind/wind_moan4.wav",
		"ambient/wind/wind_hit3.wav",
		"ambient/wind/wind_snippet3.wav",
		"ambient/wind/wind_snippet4.wav"
	}
}

ENT.Propellers = {
	Damage = 1,
	Health = 100500,
	Scale = 0.5,
	HitRange = 40,
	Model = "models/props_c17/TrapPropeller_Blade.mdl",

	Info = { Vector(0, 0, 16) }
}

ENT.Fuel = 9999
ENT.MaxFuel = 9999

ENT.Attachments = {
	["Melon"] = {
		Pos = Vector(0, -8, -12)
	}
}

ENT.Weapons = {
	["Melon Thrower"] = {
		Name = "Melon Thrower",
		Attachment = "Melon"
	}
}

ENT.Modules = DRONES_REWRITE.GetAIModules()

ENT.Modules["ANNOYING VOICE"] = {
	Slot = "Body",

	Initialize = function(drone)
		drone.Buffer.Voice = {
			"vo/k_lab2/kl_aweekago01.wav",
			"vo/k_lab2/kl_comeoutlamarr.wav",
			"vo/gman_misc/gman_04.wav",
			"vo/gman_misc/gman_riseshine.wav",
			"vo/k_lab/kl_ohdear.wav",
			"vo/k_lab/kl_plugusin.wav",
			"vo/k_lab/kl_slipin01.wav",
			"vo/k_lab/kl_debeaked.wav",
			"vo/k_lab/kl_ensconced.wav",
			"vo/k_lab/kl_dearme.wav",
			"vo/k_lab/kl_delaydanger.wav",
			"npc/zombie_poison/pz_throw3.wav",
			"vo/k_lab/ba_nottoosoon01.wav",
			"vo/k_lab/kl_gordongo.wav",
			"vo/novaprospekt/kl_await.wav",
			"vo/novaprospekt/kl_stopwho.wav"
		}
	end,

	OnRemove = function(drone)
		
	end,

	Think = function(drone)
		if math.random(1, 230) == 1 then
			drone:EmitSound(table.Random(drone.Buffer.Voice), 80, 150)
		end
	end
}
