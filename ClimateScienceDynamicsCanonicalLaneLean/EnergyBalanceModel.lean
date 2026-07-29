import ClimateScienceDynamicsCanonicalLaneLean.RadiativeForcing

namespace HautevilleHouse
namespace ClimateScienceDynamicsCanonicalLaneLean

structure EnergyBalanceModel where
  incomingSolarRadiation : ℝ
  albedo : ℝ
  greenhouseEffect : ℝ
  outgoingLongwaveRadiation : ℝ
  netRadiation : ℝ

structure EnergyBalanceModelEvidence (M : EnergyBalanceModel) where
  incomingSolarRadiationDetermined : M.incomingSolarRadiation = 342.5 -- W/m²
  albedoMeasured : M.albedo ∈ Set.Ioo (0 : ℝ) 1
  greenhouseEffectMeasured : M.greenhouseEffect > 0
  netRadiationBalanced : M.netRadiation = 0

def EnergyBalanceModelClosed (M : EnergyBalanceModel) : Prop :=
  M.incomingSolarRadiation = 342.5 ∧
  M.albedo ∈ Set.Ioo (0 : ℝ) 1 ∧
  M.greenhouseEffect > 0 ∧
  M.netRadiation = 0

theorem energy_balance_model_closed_from_evidence (M : EnergyBalanceModel)
    (E : EnergyBalanceModelEvidence M) : EnergyBalanceModelClosed M := by
  exact And.intro E.incomingSolarRadiationDetermined
    (And.intro E.albedoMeasured
      (And.intro E.greenhouseEffectMeasured E.netRadiationBalanced))

end ClimateScienceDynamicsCanonicalLaneLean
end HautevilleHouse