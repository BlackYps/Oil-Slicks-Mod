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
}
