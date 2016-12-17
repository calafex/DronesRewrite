include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

function ENT:CanUsePhysicsKeys()
	local pos = self:LocalToWorld(self:OBBCenter())

	return util.TraceLine({
		start = pos,
		endpos = pos - vector_up * 32,
		filter = self
	}).Hit and not self.IsTurret
end

function ENT:PhysicsUpdate(phys)
	if self.IsTurret then
		phys:ApplyForceCenter((self.TurretPos - self:GetPos()):GetNormal() * self:GetPos():Distance(self.TurretPos) * 400)
		phys:ApplyForceCenter(-phys:GetVelocity() * 15)
		phys:AddAngleVelocity(-phys:GetAngleVelocity() * 0.09)

		local ang = phys:GetAngles()
		local angp = math.NormalizeAngle(ang.p)
		local angr = math.NormalizeAngle(ang.r)

		phys:AddAngleVelocity(-Vector(angr, angp, 0) * 0.5)

		for k, v in pairs(self.Lasers) do
			util.ParticleTracerEx("laser_beam_drr", self:LocalToWorld(self:OBBCenter()), v, false, self:EntIndex(), -1)
			--ParticleEffect("ember_hit_world", v, Angle(0, 0, 0))
		end
	else
		self.BaseClass.PhysicsUpdate(self, phys)
	end
end

function ENT:Initialize()
	self.BaseClass.Initialize(self)

	local function AddTurret()
		self:AddWeapon("Turret", {
			Initialize = function(self)
				return DRONES_REWRITE.Weapons["Template"].InitializeNoDraw(self)
			end,

			Attack = function(self, gun)
				if CurTime() > gun.NextShoot then
					if not self.IsTurret then
						local phys = self:GetPhysicsObject()
						phys:ApplyForceCenter(vector_up * 12000)

						timer.Create("dronesrewrite_balltur_becometur" .. self:EntIndex(), 0.3, 1, function()
							if IsValid(self) then
								local pos = self:LocalToWorld(self:OBBCenter())

								for i = 1, 6 do
									timer.Simple(math.Rand(0.05, 0.3), function()
										if IsValid(self) then
											local vec = VectorRand()
											vec.z = -math.abs(vec.z)
											local tr = util.TraceLine({
												start = pos,
												endpos = pos + Vector(math.cos(i) * 80, math.sin(i) * 80, -110),
												filter = self,
												mask = MASK_SOLID_BRUSHONLY
											})

											if tr.Hit then
												if not self.TurretPos then self.TurretPos = self:GetPos() end
												if not self.Lasers then self.Lasers = { } end
												self.IsTurret = true

												local ent = ents.Create("base_anim")
												ent:SetModel("models/Items/combine_rifle_ammo01.mdl")
												ent:SetPos(tr.HitPos - tr.HitNormal * 2)
												local ang = tr.HitNormal:Angle()
												ang:RotateAroundAxis(ang:Right(), -90)
												ent:SetAngles(ang)
												ent:Spawn()
												ent:SetNotSolid(true)
												ent:PhysicsDestroy()
												self:DeleteOnRemove(ent)

												--self:AddHook("DroneDestroyed", "")

												self:RemoveWeapon("Turret")
												self:FastAddWeapon("Turret", "Light Minigun", Vector(0, 0, 12), { }, Angle(0, 0, -180))
												self:SelectNextWeapon()

												self.TurretPos = self.TurretPos - (tr.HitPos - self:GetPos()):GetNormal() * 5

												self:EmitSound("drones/nightvisionon.wav", 75, 160)

												table.insert(self.Lasers, tr.HitPos + tr.HitNormal * 10)
											end
										end
									end)
								end
							end
						end)

						gun.NextShoot = CurTime() + 3
					end
				end
			end,

			Attack2 = function(self, gun) end
		})
	end

	AddTurret()

	self:AddHook("DroneDestroyed", "removeturpos", function()
		self.IsTurret = false
		self.TurretPos = nil
		self.Lasers = nil

		self:RemoveWeapon("Turret")
		AddTurret()
		self:SelectNextWeapon()
	end)

	self:SelectNextWeapon()
end