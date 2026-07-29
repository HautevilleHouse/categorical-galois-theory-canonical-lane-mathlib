import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

structure GaloisFibrationPackage where
  baseCategory : Type u
  fiberCategory : Type v
  projectionFunctor : Type w
  cartesianLift : Prop
  cleavage : Prop
  fiberedCategory : Prop
  galoisFibration : Prop

structure GaloisFibrationEvidence (F : GaloisFibrationPackage) where
  cartesianLiftClosed : F.cartesianLift
  cleavageClosed : F.cleavage
  fiberedCategoryClosed : F.fiberedCategory
  galoisFibrationClosed : F.galoisFibration

def GaloisFibrationClosed (F : GaloisFibrationPackage) : Prop :=
  F.cartesianLift ∧ F.cleavage ∧ F.fiberedCategory ∧ F.galoisFibration

theorem galois_fibration_closed_from_evidence (F : GaloisFibrationPackage)
    (E : GaloisFibrationEvidence F) : GaloisFibrationClosed F := by
  exact And.intro E.cartesianLiftClosed
    (And.intro E.cleavageClosed
      (And.intro E.fiberedCategoryClosed E.galoisFibrationClosed))

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse