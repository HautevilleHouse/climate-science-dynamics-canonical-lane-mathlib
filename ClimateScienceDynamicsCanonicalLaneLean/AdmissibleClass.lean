import ClimateScienceDynamicsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ClimateScienceDynamicsCanonicalLaneLean

structure AdmissibleClass where
  object : ClimateAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ClimateWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ClimateScienceDynamicsCanonicalLaneLean
end HautevilleHouse