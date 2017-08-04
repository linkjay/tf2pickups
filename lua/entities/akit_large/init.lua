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
    if IsValid(ply) and ply:IsPlayer() and IsValid(ply:GetActiveWeapon()) then
        local plwep = ply:GetActiveWeapon() --Variable | Player's Weapon
        local plwepa = ply:GetActiveWeapon():GetPrimaryAmmoType() --Variable | Player's equipped weapon ammo type

        if plwep:GetHoldType() == "pistol" then --Pistol Detection
            ply:EmitSound("items/gunpickup2.wav", Vector(0, 0, 0), 1, CHAN_AUTO, 1, 75, 0, 100)
            ply:GiveAmmo(36, plwepa, false) --Ammo Ammounts
            self:Remove()
        elseif plwep:GetHoldType() == "revolver" then --Revolver Detection
            ply:EmitSound("items/gunpickup2.wav", Vector(0, 0, 0), 1, CHAN_AUTO, 1, 75, 0, 100)
            ply:GiveAmmo(32, plwepa, false)
            self:Remove()
        elseif plwep:GetHoldType() == "shotgun" then --Shotgun Detection
            ply:EmitSound("items/gunpickup2.wav", Vector(0, 0, 0), 1, CHAN_AUTO, 1, 75, 0, 100)
            ply:GiveAmmo(32, plwepa, false)
            self:Remove()
        elseif plwep:GetHoldType() == "smg" then --SMG Detection
            ply:EmitSound("items/gunpickup2.wav", Vector(0, 0, 0), 1, CHAN_AUTO, 1, 75, 0, 100)
            ply:GiveAmmo(180, plwepa, false)
            self:Remove()
        elseif plwep:GetHoldType() == "ar2" then --Rifle Detection
            ply:EmitSound("items/gunpickup2.wav", Vector(0, 0, 0), 1, CHAN_AUTO, 1, 75, 0, 100)
            ply:GiveAmmo(180, plwepa, false)
            self:Remove()
        elseif plwep:GetHoldType() == "duel" then --Dual Wield Detection
            ply:EmitSound("items/gunpickup2.wav", Vector(0, 0, 0), 1, CHAN_AUTO, 1, 75, 0, 100)
            ply:GiveAmmo(72, plwepa, false)
        end
    end
end
