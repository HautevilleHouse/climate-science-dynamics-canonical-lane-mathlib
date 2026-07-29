import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceDynamicsCanonicalLaneLean

structure DansgaardOeschgerEvent where
  iceCoreRecord : Type
  temperatureProxy : Type
  rapidWarmingEvent : Prop
  slowCoolingPhase : Prop
  bipolarSeesawPattern : Prop
  rapidWarmingEventTerm : rapidWarmingEvent
  slowCoolingPhaseTerm : slowCoolingPhase
  bipolarSeesawPatternTerm : bipolarSeesawPattern

structure DansgaardOeschgerEventEvidence (D : DansgaardOeschgerEvent) where
  rapidWarmingEventClosed : D.rapidWarmingEvent
  slowCoolingPhaseClosed : D.slowCoolingPhase
  bipolarSeesawPatternClosed : D.bipolarSeesawPattern

def DansgaardOeschgerEventClosed (D : DansgaardOeschgerEvent) : Prop :=
  D.rapidWarmingEvent ∧ D.slowCoolingPhase ∧ D.bipolarSeesawPattern

theorem dansgaard_oeschger_event_closed_from_evidence (D : DansgaardOeschgerEvent) (Ev : DansgaardOeschgerEventEvidence D) :
    DansgaardOeschgerEventClosed D := by
  exact And.intro Ev.rapidWarmingEventClosed (And.intro Ev.slowCoolingPhaseClosed Ev.bipolarSeesawPatternClosed)

end ClimateScienceDynamicsCanonicalLaneLean
end HautevilleHouse