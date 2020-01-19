local oldUnit = Unit
Unit = Class(oldUnit) {
    GetUnitTechLvl = function(self)
        if self.techCategory and StringStartsWith(self.techCategory, "TECH") then
            return self.techCategory
        else
            return 'TECH1'
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
}
