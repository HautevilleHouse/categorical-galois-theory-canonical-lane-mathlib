import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

structure DescentDataPackage where
  cover : Type u
  fiberedCategory : Type v
  descentCondition : Prop
  effectiveDescent : Prop
  monadicDescent : Prop
  galoisDescent : Prop

structure DescentDataEvidence (D : DescentDataPackage) where
  descentConditionClosed : D.descentCondition
  effectiveDescentClosed : D.effectiveDescent
  monadicDescentClosed : D.monadicDescent
  galoisDescentClosed : D.galoisDescent

def DescentDataClosed (D : DescentDataPackage) : Prop :=
  D.descentCondition ∧ D.effectiveDescent ∧ D.monadicDescent ∧ D.galoisDescent

theorem descent_data_closed_from_evidence
    (D : DescentDataPackage) (E : DescentDataEvidence D) :
    DescentDataClosed D := by
  exact And.intro E.descentConditionClosed
    (And.intro E.effectiveDescentClosed
      (And.intro E.monadicDescentClosed E.galoisDescentClosed))

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse