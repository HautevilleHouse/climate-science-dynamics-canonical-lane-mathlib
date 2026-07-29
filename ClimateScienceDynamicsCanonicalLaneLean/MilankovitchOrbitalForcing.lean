import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceCanonicalLaneLean

structure OrbitalForcingPackage where
  eccentricity : ℝ
  obliquity : ℝ
  precession : ℝ
  insolationAnomaly : ℝ
  orbitalParametersClosed : Prop
  orbitalParametersClosedTerm : orbitalParametersClosed

structure OrbitalForcingEvidence (O : OrbitalForcingPackage) where
  eccentricityClosed : O.eccentricity = 0.0167
  obliquityClosed : O.obliquity = 0.4091
  precessionClosed : O.precession = 0.0167
  insolationAnomalyClosed : O.insolationAnomaly = 0.5
  orbitalParametersClosedTerm : O.orbitalParametersClosed

def OrbitalForcingClosed (O : OrbitalForcingPackage) : Prop :=
  O.eccentricity = 0.0167 ∧ O.obliquity = 0.4091 ∧ O.precession = 0.0167 ∧ O.insolationAnomaly = 0.5 ∧ O.orbitalParametersClosed

theorem orbital_forcing_closed_from_evidence (O : OrbitalForcingPackage) (E : OrbitalForcingEvidence O) : OrbitalForcingClosed O := by
  exact And.intro E.eccentricityClosed (And.intro E.obliquityClosed (And.intro E.precessionClosed (And.intro E.insolationAnomalyClosed E.orbitalParametersClosedTerm)))

end ClimateScienceCanonicalLaneLean
end HautevilleHouse