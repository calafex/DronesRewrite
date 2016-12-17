include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

local sin = math.sin
local cos = math.cos
local clamp = math.Clamp
local approach = math.Approach
local trace = util.TraceLine

function ENT:Think()
	self.BaseClass.Think(self)

	local phys = self:GetPhysicsObject()
	local vel = phys:GetVelocity()
	vel.z = 0

	local vellen = vel:Length() + phys:GetAngleVelocity():Length()

	local pos = self:GetPos() + self:GetUp() * 120
	local tr = trace({
		start = pos,
		endpos = self:GetPos() - self:GetUp() * 125,
		filter = self
	})

	local dist = clamp(tr.HitPos:Distance(pos) - 115, -65, 45)

	if not self.byaw then self.byaw = 0 end

	if self.IsRotating then 
		self:ClickKey("Forward") 
		self.byaw = Lerp(0.05, self.byaw, -self.RotateDir * 12) --approach(self.byaw, -self.RotateDir * 10, 0.2)
	else
		self.byaw = Lerp(0.15, self.byaw, 0)
	end

	if self.IsMoving then
		self:SwitchLoopSound("Walk", true, "vehicles/tank_turret_loop1.wav", 60, 1, 76)
	else
		self:SwitchLoopSound("Walk", false)
	end


	-- Animation

	local x = CurTime() * 6

	local pitch = -(cos(x)) * clamp(vellen * 0.2, 0, 20) * self.MoveDir
	if vellen < 15 then pitch = 0 end 

	self:ManipulateBoneAngles(1, Angle(0, -self.byaw, pitch - dist))
	self:ManipulateBoneAngles(4, Angle(0, -self.byaw, -pitch - dist))

	local pitch = (sin(x)) * clamp(vellen * 0.2, 0, 20)
	if vellen < 20 then pitch = 0 end

	self:ManipulateBoneAngles(2, Angle(0, 0, clamp(pitch, -15, -5) + dist))
	self:ManipulateBoneAngles(5, Angle(0, 0, clamp(-pitch, -15, -5) + dist))

	local pitch = (cos(x)) * clamp(vellen * 0.2, 0, 20) * self.MoveDir
	if vellen < 20 then pitch = 0 end

	self:ManipulateBoneAngles(3, Angle(0, 0, pitch + 4 + clamp(dist, 0, dist)))
	self:ManipulateBoneAngles(6, Angle(0, 0, -pitch + 4 + clamp(dist, 0, dist)))
	

	self:NextThink(CurTime())
	return true
end