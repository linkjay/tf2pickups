include("shared.lua")

function ENT:Initialize()
    self.csModel = ClientsideModel("models/items/medkit_small.mdl")
    self.csModel:SetModelScale(1, 0)
end

function ENT:Draw()
    if IsValid(self.csModel) then --Debug
        local hpAngle = (CurTime() * 90) % 360 -- Rotation

        self.csModel:SetPos(self:GetPos() + Vector(0, 0, 0))
        self.csModel:SetAngles(Angle(0, hpAngle, 0))
    end
end

function ENT:OnRemove()
    self.csModel:Remove()
end
