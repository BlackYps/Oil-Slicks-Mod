local oldUnit = Unit
Unit = Class(oldUnit) {
    GetUnitTechLvl = function(self)
        if self.techCategory and StringStartsWith(self.techCategory, "TECH") then
            return self.techCategory
        else
            return 'TECH1'
        end
    end,
}
