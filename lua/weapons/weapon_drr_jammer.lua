AddCSLuaFile()

SWEP.PrintName	= "Signal Jammer"
SWEP.Category = "Drones Rewrite Tools"
SWEP.Purpose = "Tool that allows you to jam drones"

SWEP.Spawnable	= true 
SWEP.UseHands	= true
SWEP.DrawAmmo	= false

SWEP.ViewModelFOV	= 55
SWEP.Slot			= 0
SWEP.SlotPos		= 6

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.UseDelay 	            = 2
SWEP.Range                  = 5000
SWEP.IsInDirectMode         = false
SWEP.AreaModeDelayMult      = 1.5
SWEP.AreaModeRangeMult      = 1/5

SWEP.ViewModel = "models/dronesrewrite/jammer/c_jammer.mdl"
SWEP.WorldModel = "models/dronesrewrite/jammer/w_jammer.mdl"

SWEP.TURNON = "buttons/button17.wav"

function SWEP:Initialize()
	self:SetHoldType("pistol")
	self:SetNWBool("IsInDirectMode", self.IsInDirectMode)
end

function SWEP:Stun(drone)
	if not IsValid(drone) or not drone.IS_DRONE or drone.ImmuneToJammer then return end

	local phys = drone:GetPhysicsObject()
	if not phys:IsValid() then return end

	phys:SetVelocity((drone:GetPos() - self:GetPos()):GetNormal() * 150)
	phys:AddAngleVelocity(VectorRand() * 500)
	
	drone:TakeDamage(math.random(45, 60) * DRONES_REWRITE.ServerCVars.DmgCoef:GetFloat(), self.Owner, self)

	if drone.IS_DRR then
		drone:SetEnabled(false)
		timer.Simple(self.UseDelay, function()
			if drone:IsValid() then 
				drone:SetEnabled(true)
			end
		end)
	end

	ParticleEffect("vapor_collapse_drr", drone:GetPos(), Angle(0, 0, 0))
	drone:TakeDamage(math.random(10, 15) * DRONES_REWRITE.ServerCVars.DmgCoef:GetFloat(), self.Owner, self)
	drone:EmitSound("drones/nio_dissolve.wav", 100, 90)
end

function SWEP:PrimaryAttack()
	self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK)

	timer.Simple(self:SequenceDuration(), function()
		if not IsValid(self) or not IsValid(self.Owner) then return end

		local range = self.Range
		if not self.IsInDirectMode then range = range * self.AreaModeRangeMult end

		local ignoreList = {}
		table.insert(game:GetWorld())
		table.insert(self.Owner)

		if self.IsInDirectMode then
			local tr = util.TraceHull({
				start = self.Owner:GetShootPos(),
				endpos = self.Owner:GetShootPos() + (self.Owner:GetAimVector() * range),
				filter = ignoreList,
				mins = Vector(-20, -20, -20),
				maxs = Vector(20, 20, 20)
			})
			print(tr.Entity)
			self:Stun(tr.Entity)
		else 
			local entsInSphere = ents.FindInSphere(self:GetPos(), range)
			for k, v in pairs(entsInSphere) do
				if v == self then continue end

				self:Stun(v)
			end
		end
	end)

	local useDelay = self.UseDelay
	if not self.IsInDirectMode then useDelay = useDelay * self.AreaModeDelayMult end
	timer.Simple(self:SequenceDuration() / 2, function()
		if not IsValid(self) then return end
		self:EmitSound("buttons/button14.wav", 50, 90)
	end)

	self:SetNextPrimaryFire(CurTime() + useDelay)
	self:SetNWBool("WasInDirectMode", self.IsInDirectMode)
end

function SWEP:SecondaryAttack()
	self.Weapon:SendWeaponAnim(ACT_VM_SECONDARYATTACK)

	self.IsInDirectMode = not self.IsInDirectMode
	self:SetNWBool("IsInDirectMode", self.IsInDirectMode)

	self:SetNextSecondaryFire(CurTime() + self:SequenceDuration())
end

function SWEP:OnRemove()
	timer.Stop("weapon_drr_jammer_idle" .. self:EntIndex())
	timer.Stop("weapon_drr_jammer_active" .. self:EntIndex())

	self:SetNextPrimaryFire(CurTime() + self.UseDelay)
	self:SetNWBool("IsScreenActive", false)
end

function SWEP:Holster()
	self:OnRemove()
	
	return true
end

function SWEP:Deploy()
	self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
	self:DoIdle()
	self:SetDeploySpeed(1)

	timer.Create("weapon_drr_jammer_active" .. self:EntIndex(), self:SequenceDuration() - 0.8, 1, function()
		if not IsValid(self) then return end

		self:SetNWBool("IsScreenActive", true)
		self:EmitSound(self.TURNON, 65, 150)
	end)
	
	if CLIENT then
		self:DoIdle()
	end
	
	return true
end

function SWEP:DoIdle()
	timer.Create("weapon_drr_jammer_idle" .. self:EntIndex(), self:SequenceDuration(), 2, function() 
		if IsValid(self) then 
			self:SendWeaponAnim(ACT_VM_IDLE) 
			self:DoIdle()
		end 
	end)
end

if CLIENT then
	function SWEP:ViewModelDrawn()
		if not self:GetNWBool("IsScreenActive", false) then return end

		local vm = self.Owner:GetViewModel()
		local m = vm:GetBoneMatrix(vm:LookupBone("jammer_weapon"))
		if m then
			pos, ang = m:GetTranslation(), m:GetAngles()
		end

		if not pos or not ang then return end

		ang:RotateAroundAxis(ang:Up(), 180)

		--top left screen corner
		pos = pos - ang:Right() * 3.165
		pos = pos - ang:Forward() * 4.18
		pos = pos + ang:Up() * 0.95

		local isDirect = self:GetNWBool("IsInDirectMode")
		local wasInDirectMode = self:GetNWBool("WasInDirectMode")
		local useDelay = self.UseDelay
		if not wasInDirectMode then useDelay = useDelay * self.AreaModeDelayMult end

		cam.Start3D2D(pos, ang, 0.01)
			surface.SetDrawColor(Color(0, 255, 0, 100))

			local text = "Area"
			if isDirect then text = "Direct" end
			draw.SimpleText("Mode: ", "DronesRewrite_font5", 10, 10, Color(0, 255, 0, 200), TEXT_ALIGN_LEFT)
			draw.SimpleText(text, "DronesRewrite_font5", 60, 10, Color(0, 255, 0, 200), TEXT_ALIGN_LEFT)

			--surface.DrawRect(-10, -1, 20, 2)
			--surface.DrawRect(-1, -10, 2, 20)

			local timeRemaining = math.Clamp(self:GetNextPrimaryFire() - CurTime(), 0, useDelay)
			if timeRemaining == 0 then
				surface.SetDrawColor(Color(0, 255, 0, 200))
			end
			local percentage = (useDelay - timeRemaining) / useDelay
			surface.DrawRect(14, 44, 184 * percentage, 74)

			surface.SetDrawColor(Color(0, 255, 0, 100))
			surface.DrawRect(10, 40, 20, 2)
			surface.DrawRect(10, 40, 2, 20)

			surface.DrawRect(10, 120, 20, 2)
			surface.DrawRect(10, 120, 2, -20)

			surface.DrawRect(200, 120, -20, 2)
			surface.DrawRect(200, 122, 2, -42)

			surface.DrawRect(200, 40, -20, 2)
			surface.DrawRect(200, 40, 2, 40)

			surface.DrawRect(202, 66, 10, 30)
		cam.End3D2D()
	end

	function SWEP:Think()
		if IsValid(self) then
			
		end
	end
end