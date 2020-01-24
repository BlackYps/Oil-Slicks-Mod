local SDEffectTemplate = import('/mods/oil_slicks/lua/SDEffectTemplates.lua')
local EffectUtil = import('/lua/EffectUtilities.lua')
local NEffectTemplate = import('/mods/oil_slicks/lua/NEffectTemplates.lua')

local GlobalExplosionScaleValueMain = 1
local GlobalExplosionScaleValue = 1 * GlobalExplosionScaleValueMain

local toggle = import('/mods/oil_slicks/lua/Togglestuff.lua').toggle



-- local oldAirUnit = AirUnit
-- AirUnit = Class(oldAirUnit) {
--     OnCreate = function(self)
--         oldAirUnit.OnCreate(self)

local oldStructureUnit = StructureUnit
StructureUnit = Class(oldStructureUnit) {
    OnCreate = function(self)
        oldStructureUnit.OnCreate(self)

        local Faction = self:GetFaction()
        local UnitTechLvl = self:GetUnitTechLvl()
        LOG('*** StructureFaction: ', Faction)
        LOG('*** StructureTechLvl: ', UnitTechLvl)
        local SDFactionalSmoke = SDEffectTemplate['StructureSmoke'..Faction]
        local SDFactionalFire = SDEffectTemplate['StructureFire'..Faction]
        local SDFactionalFireSmoke = SDEffectTemplate['StructureFireSmoke'..Faction]

        if toggle == 1 then
            -- Mobile unit factional-specific damage effects and smoke
            self.FxDamage1 = {SDFactionalSmoke, EffectTemplate.DamageSparks01} -- 75% HP
            self.FxDamage2 = {SDFactionalFire, EffectTemplate.DamageStructureFireSmoke01,
                              EffectTemplate.DamageSparks01} -- 50% HP
            self.FxDamage3 = {SDFactionalFireSmoke, EffectTemplate.DamageStructureFire01} -- 25% HP
        end
    end,
}



Helperfunctions = Class() {

    -- Get explosion scale based off Tech number
    GetNumberByTechLvlShip = function(self, UnitTechLvl)
        if UnitTechLvl == 'TECH1' then
            return 1.5665
        elseif UnitTechLvl == 'TECH2' then
            return 1.9
        elseif UnitTechLvl == 'TECH3' then
            return 2.515
        else
            return 6.0
        end
    end,
    
    -- Get size of unit
    GetSizeOfUnit = function(self)
        local bp = self:GetBlueprint()
        return (math.abs(bp.SizeX or 0 + bp.SizeY or 0 + bp.SizeZ or 0))
    end,
    
    -- Needed for the custom booms
    CreateEffects = function(self, EffectTable, army, scale)
        for _, v in EffectTable do
            self.Trash:Add(CreateAttachedEmitter(self, -1, army, v):ScaleEmitter(scale))
        end
    end,
}

local oldSeaUnit = SeaUnit
SeaUnit = Class(oldSeaUnit, Helperfunctions) {
    
    OnKilled = function(self, instigator, type, overkillRatio)
        local Army = self:GetArmy()
        local UnitTechLvl = self:GetUnitTechLvl()
        local BoomScale = self:GetNumberByTechLvlShip(UnitTechLvl or 'TECH1')
        local BoomScale2 = self:GetSizeOfUnit()
        if self:GetFractionComplete() == 1 then
            if toggle == 1 then
                self.CreateEffects(self, SDEffectTemplate.OilSlick, Army, ((BoomScale)*((BoomScale2)/2)) *GlobalExplosionScaleValue)
            else
                self.CreateEffects(self, NEffectTemplate.OilSlick, Army, ((BoomScale)*((BoomScale2)/2)) *GlobalExplosionScaleValue)
            end
        end
       oldSeaUnit.OnKilled(self, instigator, type, overkillRatio)
    end
}

local oldAircraftCarrier = AircraftCarrier
AircraftCarrier = Class(oldAircraftCarrier, Helperfunctions) {}

local oldSubUnit = SubUnit
SubUnit = Class(oldSubUnit, Helperfunctions) {
    
    OnKilled = function(self, instigator, type, overkillRatio)
        local Army = self:GetArmy()
        local UnitTechLvl = self:GetUnitTechLvl()
        local Number = self:GetNumberByTechLvl(UnitTechLvl or 'TECH4')
    
        if self:GetFractionComplete() == 1 then
            if toggle == 1 then
                self.CreateEffects(self, SDEffectTemplate.OilSlick, Army, (Number*GlobalExplosionScaleValue))
            else
                self.CreateEffects(self, NEffectTemplate.OilSlick, Army, (Number*GlobalExplosionScaleValue))
            end
        end
        oldSubUnit.OnKilled(self, instigator, type, overkillRatio)
    end,
}

-- local oldStructureUnit = StructureUnit
-- StructureUnit = Class(oldStructureUnit) {
--     OnKilled = function(self)
--         LOG('***---*** StructureUnit OnKilled HOOK')
--         Unit.OnDestroy(self)
--         local orient = self.TarmacBag.Orientation
--         local currentBP = self.TarmacBag.CurrentBP
--         self:DestroyTarmac()
--         self:CreateTarmac(true, true, true, orient, currentBP, currentBP.DeathLifetime or 300)
--     end,
--
--     OnDestroy = function(self)
--         LOG('***---*** StructureUnit OnDestroy HOOK')
--         Unit.OnDestroy(self)
--     end,
-- }
