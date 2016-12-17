include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

function ENT:Initialize()
	self.BaseClass.Initialize(self)

	self:AddHook("Physics", "drone_phys", function(phys)
		if self.IsMoving then
			phys:AddAngleVelocity(Vector(1, 0, 0) * math.sin(CurTime() * 5) * 5)
		end
	end)
end


local bones = {
	"rf_leg",
	"lb_leg",
	"lf_leg",
	"rb_leg"
}

local vals = {
	-1,
	1,
	-1,
	1
}

-- Something went wrong with left (l*_leg) legs
local vals2 = {
	1,
	-1,
	-1,
	1
}

function ENT:Think()
	self.BaseClass.Think(self)

	local phys = self:GetPhysicsObject()
	local len = phys:GetVelocity():Length() + phys:GetAngleVelocity():Length()

	for k, v in pairs(bones) do
		local val = vals[k]

		local pitch = -math.cos(CurTime() * 4) * math.Clamp(len * 0.16, 0, 30) * val
		local dir = self.MoveDir != 0 and self.MoveDir or 1
		local yaw = math.Clamp(math.sin(CurTime() * 4) * math.Clamp(len * 0.16, 0, 65), -30, 30) * dir * val

		if len < 10 then 
			pitch = 0
			yaw = 0 
		end 

		local pos = self:GetPos()
		local tr = util.TraceLine({
			start = pos,
			endpos = pos - self:GetUp() * 200,
			filter = self
		})

		local dist = math.Clamp(tr.HitPos:Distance(pos) - 60, -60, 0) * vals2[k]

		pitch = pitch + dist

		if self.IsRotating and not self.IsMoving then
			yaw = yaw * 5
		end

		self:ManipulateBoneAngles(self:LookupBone(v), Angle(yaw, 0, 0))
		self:ManipulateBoneAngles(self:LookupBone(v .. "_2"), Angle(0, 0, pitch))
	end

	self:NextThink(CurTime())
	return true
end