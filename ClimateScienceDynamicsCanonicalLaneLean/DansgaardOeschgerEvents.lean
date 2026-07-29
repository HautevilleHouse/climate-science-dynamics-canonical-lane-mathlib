import ClimateScienceDynamicsCanonicalLaneLean.IceCoreProxy

namespace HautevilleHouse
namespace ClimateScienceDynamicsCanonicalLaneLean

structure DansgaardOeschgerEventsPackage where
  abruptWarmingEpisodes : ℕ
  warmingAmplitude : ℝ
  durationYears : ℝ
  recurrenceInterval : ℝ
  proxyEvidenceValid : Prop

structure DansgaardOeschgerEventsEvidence (D : DansgaardOeschgerEventsPackage) where
  abruptWarmingEpisodesCounted : D.abruptWarmingEpisodes ≥ 1
  warmingAmplitudeMeasured : D.warmingAmplitude ≥ 5.0
  durationYearsMeasured : D.durationYears ∈ Icc (1 : ℝ) 100
  recurrenceIntervalMeasured : D.recurrenceInterval ∈ Icc (500 : ℝ) 3000
  proxyEvidenceValidClosed : D.proxyEvidenceValid

def DansgaardOeschgerEventsClosed (D : DansgaardOeschgerEventsPackage) : Prop :=
  D.abruptWarmingEpisodes ≥ 1 ∧
  D.warmingAmplitude ≥ 5.0 ∧
  D.durationYears ∈ Icc (1 : ℝ) 100 ∧
  D.recurrenceInterval ∈ Icc (500 : ℝ) 3000 ∧
  D.proxyEvidenceValid

theorem dansgaard_oeschger_events_closed_from_evidence
    (D : DansgaardOeschgerEventsPackage) (E : DansgaardOeschgerEventsEvidence D) :
    DansgaardOeschgerEventsClosed D := by
  exact And.intro E.abruptWarmingEpisodesCounted
    (And.intro E.warmingAmplitudeMeasured
      (And.intro E.durationYearsMeasured
        (And.intro E.recurrenceIntervalMeasured
          E.proxyEvidenceValidClosed)))

end ClimateScienceDynamicsCanonicalLaneLean
end HautevilleHouse