import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceDynamicsCanonicalLaneLean

structure IceCorePaleotemperaturePackage where
  isotopeRatio : Prop
  temperatureProxyCalibration : Prop
  depthAgeModel : Prop
  paleoTemperatureReconstruction : Prop

structure IceCorePaleotemperatureEvidence (I : IceCorePaleotemperaturePackage) where
  isotopeRatioClosed : I.isotopeRatio
  temperatureProxyCalibrationClosed : I.temperatureProxyCalibration
  depthAgeModelClosed : I.depthAgeModel
  paleoTemperatureReconstructionClosed : I.paleoTemperatureReconstruction

def IceCorePaleotemperatureClosed (I : IceCorePaleotemperaturePackage) : Prop :=
  I.isotopeRatio ∧ I.temperatureProxyCalibration ∧ I.depthAgeModel ∧ I.paleoTemperatureReconstruction

theorem ice_core_paleotemperature_closed_from_evidence (I : IceCorePaleotemperaturePackage)
    (Ev : IceCorePaleotemperatureEvidence I) : IceCorePaleotemperatureClosed I := by
  exact And.intro Ev.isotopeRatioClosed
    (And.intro Ev.temperatureProxyCalibrationClosed
      (And.intro Ev.depthAgeModelClosed Ev.paleoTemperatureReconstructionClosed))

end ClimateScienceDynamicsCanonicalLaneLean
end HautevilleHouse
