import canonicalLaneMathlib.AdmissibleClass
import ClimateScienceDynamicsCanonicalLaneLean.EnergyBalanceModel
import ClimateScienceDynamicsCanonicalLaneLean.MilankovitchCycles
import ClimateScienceDynamicsCanonicalLaneLean.DansgaardOeschgerEvent
import ClimateScienceDynamicsCanonicalLaneLean.IsotopicPaleothermometry

namespace HautevilleHouse
namespace ClimateScienceDynamicsCanonicalLaneLean

structure ClimateAdmittedObject where
  energyBalance : EnergyBalanceModel
  milankovitch : MilankovitchCycles
  dansgaardOeschger : DansgaardOeschgerEvent
  isotopicPaleo : IsotopicPaleothermometry
  allClosed : EnergyBalanceModelClosed energyBalance ∧ MilankovitchCyclesClosed milankovitch ∧
              DansgaardOeschgerEventClosed dansgaardOeschger ∧ IsotopicPaleothermometryClosed isotopicPaleo

def ClimateWitnessClosed (O : ClimateAdmittedObject) : Prop :=
  EnergyBalanceModelClosed O.energyBalance ∧ MilankovitchCyclesClosed O.milankovitch ∧
  DansgaardOeschgerEventClosed O.dansgaardOeschger ∧ IsotopicPaleothermometryClosed O.isotopicPaleo

def ClimateAdmittedObject.fromEvidence (E : EnergyBalanceModel) (EvE : EnergyBalanceModelEvidence E)
    (M : MilankovitchCycles) (EvM : MilankovitchCyclesEvidence M)
    (D : DansgaardOeschgerEvent) (EvD : DansgaardOeschgerEventEvidence D)
    (I : IsotopicPaleothermometry) (EvI : IsotopicPaleothermometryEvidence I) : ClimateAdmittedObject :=
  { energyBalance := E
    milankovitch := M
    dansgaardOeschger := D
    isotopicPaleo := I
    allClosed := And.intro (energy_balance_model_closed_from_evidence E EvE)
      (And.intro (milankovitch_cycles_closed_from_evidence M EvM)
        (And.intro (dansgaard_oeschger_event_closed_from_evidence D EvD)
          (isotopic_paleothermometry_closed_from_evidence I EvI)))
  }

end ClimateScienceDynamicsCanonicalLaneLean
end HautevilleHouse