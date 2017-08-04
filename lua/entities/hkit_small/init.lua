AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
include("shared.lua")

function ENT:Initialize()

    self:SetModel("models/hunter/blocks/cube05x05x05.mdl") --Hitbox

    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_NONE)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
    self:GetPhysicsObject():Wake()

    self:SetTrigger(true)
    self:DrawShadow(false)
end

function ENT:StartTouch(ply)
    if IsValid(ply) then
        if ply:IsPlayer() then
            local hpm = ply:GetMaxHealth() --Variable | Player's Max Health

            if ply:Health() < hpm then -- Checking for a loss of health
                local hp = ply:GetMaxHealth() * 0.2 + ply:Health() -- Variable | 20% of The Player's Health
                ply:SetHealth(hp)
                ply:EmitSound("items/smallmedkit1.wav", Vector(0, 0, 0), 1, CHAN_AUTO, 1, 75, 0, 100)
                self:Remove()
            end

            if ply:Health() > hpm then --Preventing overhealing
                ply:SetHealth(hpm)
            end
        end
    end
end
