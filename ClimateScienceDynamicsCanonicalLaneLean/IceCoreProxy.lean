import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceDynamicsCanonicalLaneLean

structure IceCoreLayer where
  depth : ℝ
  age : ℕ
  dustConcentration : ℝ
  conductivity : ℝ

def annualLayerCount (layers : List IceCoreLayer) : ℕ :=
  layers.length

structure IceCorePackage where
  layers : List IceCoreLayer
  timescale : ℕ
  resolvedSeasonality : Prop
  volcanicSignatures : List ℕ

def IceCoreClosed (I : IceCorePackage) : Prop :=
  I.resolvedSeasonality ∧ I.timescale > 1000

end ClimateScienceDynamicsCanonicalLaneLean
end HautevilleHouse