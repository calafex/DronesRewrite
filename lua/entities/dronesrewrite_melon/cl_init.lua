include("shared.lua")

function ENT:Draw()
	if self:IsDroneWorkable() and not DRONES_REWRITE.ClientCVars.NoGlows:GetBool() then
		render.SetMaterial(Material("particle/particle_glow_04_additive"))
		render.DrawSprite(self:GetPos(), 30, 30, Color(0, 255, 0))
	end

	self:DrawModel()
end