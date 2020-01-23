local SDEffectTemplate = import('/mods/oil_slicks/lua/SDEffectTemplates.lua')
local toggle = import('/mods/oil_slicks/lua/Togglestuff.lua').toggle

local oldUnit = Unit
Unit = Class(oldUnit) {
    GetUnitTechLvl = function(self)
        if self.techCategory then
            return self.techCategory
        else
            return 'techCategory not set'
        end
    end,
    
    GetNumberByTechLvl = function(self, UnitTechLvl)
        if UnitTechLvl == 'TECH1' then
            return 0.425
        elseif UnitTechLvl == 'TECH2' then
            return 0.76/1.075
        elseif UnitTechLvl == 'TECH3' then
            return 1.025/1.175
        else
            return 1
        end
    end,
    
    GetFaction = function(self)
        return self.factionCategory
    end,

    OnCreate = function(self)
        oldUnit.OnCreate(self)
        local Faction = self:GetFaction()
        local UnitTechLvl = self:GetUnitTechLvl()
        LOG('*** ')
        LOG('*** self.techCategory is: ', self.techCategory)
        LOG('*** self.FactionCategory is: ', self:GetFaction())
        LOG('*** self.FxDamageScale is: ', self.FxDamageScale)
        LOG('*** self.FxDamage3Amount is: ', self.FxDamage3Amount)

        local SDFactionalSmoke = SDEffectTemplate['UnitSmoke'..Faction]
        local SDFactionalFire = SDEffectTemplate['UnitFire'..Faction]
        local SDFactionalFireSmoke = SDEffectTemplate['UnitFireSmoke'..Faction]

        if toggle == 1 then
            -- Factional-specific damage effects and smoke
            self.FxDamage1 = {SDFactionalSmoke, EffectTemplate.DamageSparks01} -- 75% HP
            self.FxDamage2 = {SDFactionalFire, EffectTemplate.DamageFireSmoke01,
                              EffectTemplate.DamageSparks01} -- 50% HP
            self.FxDamage3 = {SDFactionalFireSmoke, EffectTemplate.DamageFire01} -- 25% HP
        end
    end,
}
