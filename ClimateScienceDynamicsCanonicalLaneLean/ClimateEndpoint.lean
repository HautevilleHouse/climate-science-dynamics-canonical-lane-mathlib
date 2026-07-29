import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClimateScienceDynamicsCanonicalLaneLean.MilankovitchCycles
import HautevilleHouse.ClimateScienceDynamicsCanonicalLaneLean.DansgaardOeschgerEvents

namespace HautevilleHouse
namespace ClimateScienceDynamicsCanonicalLaneLean

structure ClimateEndpointPackage where
  milankovitch : MilankovitchCycleClosed ✓?
  doEvents : DOSequencePackage
  paleotemp : PaleotemperaturePackage
  energyBalance : EnergyBalancePackage
  iceCore : IceCorePackage
  orbitalForcingConverges : Prop
  temperatureConstrained : Prop

def ClimateEndpointClosed (C : ClimateEndpointPackage) : Prop :=
  C.orbitalForcingConverges ∧ C.temperatureConstrained

end ClimateScienceDynamicsCanonicalLaneLean
end HautevilleHouse