enum ScrapEntityKind {
  wholeObject,
  component,
  looseMaterial,
  fitting,
  mixedPile,
  unknown,
}

enum NeutralMaterialFamily {
  copper,
  brass,
  aluminum,
  stainlessSteel,
  ferrous,
  lead,
  zinc,
  electronic,
  mixed,
  unknown,
}

enum NeutralScrapGrade {
  bareBrightCopper,
  numberOneCopper,
  numberTwoCopper,
  insulatedCopperWire,
  copperTubingClean,
  copperTubingSoldered,
  yellowBrass,
  redBrass,
  dirtyBrass,
  cleanAluminumExtrusion,
  paintedAluminumExtrusion,
  castAluminum,
  sheetAluminum,
  aluminumCopperRadiator,
  stainlessCandidate,
  shredSteel,
  castIron,
  lowGradeBoard,
  highGradeBoard,
  electricMotor,
  transformer,
  sealedUnit,
  mixedMaterial,
  unknown,
}

enum PreparationCondition {
  clean,
  painted,
  insulated,
  soldered,
  plated,
  attachedSteel,
  contaminated,
  corroded,
  sealed,
  mixed,
  unknown,
}

enum HazardKind {
  storedElectricalCharge,
  refrigerant,
  lithiumBattery,
  mercury,
  crtGlass,
  pressurizedCylinder,
  sharpEdges,
  heavyObject,
  oilOrFluid,
  explosiveOrUnknown,
}

enum EvidenceSource {
  visionModel,
  userConfirmation,
  deterministicRule,
  yardMapping,
  imageQualityCheck,
  unknown,
}
