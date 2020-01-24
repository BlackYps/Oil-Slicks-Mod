ModPath = '/mods/oil_slicks/effects/emitters/'
EmtBpPath = '/effects/emitters/'

OilSlick = {
       ModPath .. 'OilSlick.bp',
}

--##########################--
--Damaged Units             --
--##########################--

UnitSmokeUEF = {
        EmtBpPath .. 'destruction_damaged_smoke_01_emit.bp',
}

UnitSmokeCYBRAN = {
        ModPath .. 'CybranUnitLightDmgSmokeTrail.bp',
        ModPath .. 'CybranUnitLightDmgFire.bp',
}

UnitSmokeAEON = {
        ModPath .. 'AeonUnitLightDmgSmokeTrail.bp',
}

UnitSmokeSERAPHIM = {
        ModPath .. 'AeonUnitLightDmgSmokeTrail.bp',
}

UnitFireUEF = {
        EmtBpPath .. 'destruction_damaged_fire_01_emit.bp',
        EmtBpPath .. 'destruction_damaged_fire_distort_01_emit.bp',
}

UnitFireCYBRAN = {
        ModPath .. 'CybranUnitMediumDmgFire.bp',
        ModPath .. 'CybranUnitMediumDmgSmokeTrail.bp',
}

UnitFireAEON = {
        ModPath .. 'AeonUnitMediumDmgFire.bp',
        ModPath .. 'AeonUnitMediumDmgSmokeTrail.bp',
}

UnitFireSERAPHIM = {
        ModPath .. 'SeraUnitMediumDmgFire.bp',
        ModPath .. 'AeonUnitMediumDmgSmokeTrail.bp',
}

UnitFireSmokeUEF = {
        EmtBpPath .. 'destruction_damaged_smoke_01_emit.bp',
        EmtBpPath .. 'destruction_damaged_fire_01_emit.bp',
        EmtBpPath .. 'destruction_damaged_fire_distort_01_emit.bp',
}

UnitFireSmokeCYBRAN = {
        ModPath .. 'CybranUnitHeavyDmgFire.bp',
        ModPath .. 'CybranUnitHeavyDmgSmokeTrail.bp',
}

UnitFireSmokeAEON = {
        ModPath .. 'AeonUnitHeavyDmgFire.bp',
        ModPath .. 'AeonUnitHeavyDmgSmokeTrail.bp',
}

UnitFireSmokeSERAPHIM = {
        ModPath .. 'SeraUnitHeavyDmgFire.bp',
        ModPath .. 'AeonUnitHeavyDmgSmokeTrail.bp',
}

--##########################--
--Damaged Structures        --
--##########################--


StructureSmokeUEF = {
        EmtBpPath .. 'destruction_damaged_smoke_02_emit.bp',
}

StructureSmokeCYBRAN = {
        ModPath .. 'CybranAircraftLightDmgSmokeTrail.bp',
        ModPath .. 'CybranAircraftLightDmgFire.bp',
}

StructureSmokeAEON = {
        ModPath .. 'AeonAircraftLightDmgSmokeTrail.bp',
}

StructureSmokeSERAPHIM = {
        ModPath .. 'AeonAircraftLightDmgSmokeTrail.bp',
}

StructureFireUEF = {
        EmtBpPath .. 'destruction_damaged_fire_02_emit.bp',
        EmtBpPath .. 'destruction_damaged_fire_03_emit.bp',
        EmtBpPath .. 'destruction_damaged_fire_distort_02_emit.bp',
}

StructureFireCYBRAN = {
        ModPath .. 'CybranAircraftMediumDmgFire.bp',
        ModPath .. 'CybranAircraftMediumDmgSmokeTrail.bp',
}

StructureFireAEON = {
        ModPath .. 'AeonAircraftMediumDmgFire.bp',
        ModPath .. 'AeonAircraftMediumDmgSmokeTrail.bp',
}

StructureFireSERAPHIM = {
        ModPath .. 'SeraAircraftMediumDmgFire.bp',
        ModPath .. 'AeonAircraftMediumDmgSmokeTrail.bp',
}

StructureFireSmokeUEF = {
        EmtBpPath .. 'destruction_damaged_smoke_02_emit.bp',
        EmtBpPath .. 'destruction_damaged_fire_02_emit.bp',
        EmtBpPath .. 'destruction_damaged_fire_03_emit.bp',
        EmtBpPath .. 'destruction_damaged_fire_distort_02_emit.bp',
}

StructureFireSmokeCYBRAN = {
        ModPath .. 'CybranAircraftHeavyDmgFire.bp',
        ModPath .. 'CybranAircraftHeavyDmgSmokeTrail.bp',
}

StructureFireSmokeAEON = {
        ModPath .. 'AeonAircraftHeavyDmgFire.bp',
        ModPath .. 'AeonAircraftHeavyDmgSmokeTrail.bp',
}

StructureFireSmokeSERAPHIM = {
        ModPath .. 'SeraAircraftHeavyDmgFire.bp',
        ModPath .. 'AeonAircraftHeavyDmgSmokeTrail.bp',
}
