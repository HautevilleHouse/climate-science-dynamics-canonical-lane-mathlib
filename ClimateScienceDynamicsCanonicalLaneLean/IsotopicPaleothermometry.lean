import ClimateScienceDynamicsCanonicalLaneLean.ProxyMeasurement

namespace HautevilleHouse
namespace ClimateScienceDynamicsCanonicalLaneLean

structure IsotopicPaleothermometryPackage where
  deltaO18 : ℝ
  deltaD : ℝ
  temperatureProxy : ℝ
  calibrationEquationValid : Prop

structure IsotopicPaleothermometryEvidence (I : IsotopicPaleothermometryPackage) where
  deltaO18Measured : I.deltaO18 ∈ Set.Ioo (-30 : ℝ) 0
  deltaDMeasured : I.deltaD ∈ Set.Ioo (-250 : ℝ) 0
  temperatureProxyComputed : I.temperatureProxy > -50
  calibrationEquationValidClosed : I.calibrationEquationValid

def IsotopicPaleothermometryClosed (I : IsotopicPaleothermometryPackage) : Prop :=
  I.deltaO18 ∈ Set.Ioo (-30 : ℝ) 0 ∧
  I.deltaD ∈ Set.Ioo (-250 : ℝ) 0 ∧
  I.temperatureProxy > -50 ∧
  I.calibrationEquationValid

theorem isotopic_paleothermometry_closed_from_evidence
    (I : IsotopicPaleothermometryPackage) (E : IsotopicPaleothermometryEvidence I) :
    IsotopicPaleothermometryClosed I := by
  exact And.intro E.deltaO18Measured
    (And.intro E.deltaDMeasured
      (And.intro E.temperatureProxyComputed
        E.calibrationEquationValidClosed))

end ClimateScienceDynamicsCanonicalLaneLean
end HautevilleHouse