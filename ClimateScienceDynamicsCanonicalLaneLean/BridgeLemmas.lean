import ClimateScienceDynamicsCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace ClimateScienceDynamicsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ClimateWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ClimateScienceDynamicsCanonicalLaneLean
end HautevilleHouse