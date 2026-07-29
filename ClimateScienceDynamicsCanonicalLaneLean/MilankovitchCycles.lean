import ClimateScienceDynamicsCanonicalLaneLean.OrbitalParameters
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace ClimateScienceDynamicsCanonicalLaneLean

structure MilankovitchCyclesPackage where
  obliquity : ℝ
  eccentricity : ℝ
  precession : ℝ
  insolationAnomaly : ℝ
  orbitalConfigurationMapped : Prop

structure MilankovitchCyclesEvidence (M : MilankovitchCyclesPackage) where
  obliquityWithinBounds : M.obliquity ∈ Icc (22.1 : ℝ) 24.5
  eccentricityWithinBounds : M.eccentricity ∈ Icc (0.0005 : ℝ) 0.058
  precessionCycleDetected : Prop
  insolationAnomalyCalculated : M.insolationAnomaly > 0
  orbitalConfigurationMappedClosed : M.orbitalConfigurationMapped

def MilankovitchCyclesClosed (M : MilankovitchCyclesPackage) : Prop :=
  M.obliquity ∈ Icc (22.1 : ℝ) 24.5 ∧
  M.eccentricity ∈ Icc (0.0005 : ℝ) 0.058 ∧
  M.precessionCycleDetected ∧
  M.insolationAnomaly > 0 ∧
  M.orbitalConfigurationMapped

theorem milankovitch_cycles_closed_from_evidence
    (M : MilankovitchCyclesPackage) (E : MilankovitchCyclesEvidence M) :
    MilankovitchCyclesClosed M := by
  exact And.intro E.obliquityWithinBounds
    (And.intro E.eccentricityWithinBounds
      (And.intro E.precessionCycleDetected
        (And.intro E.insolationAnomalyCalculated
          E.orbitalConfigurationMappedClosed)))

end ClimateScienceDynamicsCanonicalLaneLean
end HautevilleHouse