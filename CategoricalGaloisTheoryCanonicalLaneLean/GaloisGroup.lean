import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoricalGaloisTheoryCanonicalLaneLean.CoveringSpaceClassification

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

structure GaloisGroupPackage {G : GaloisFibrationPackage} {C : GaloisFibrationClosed G}
    (P : CoveringSpaceClassificationPackage C) where
  groupCarrier : Type u
  groupOperation : groupCarrier -> groupCarrier -> groupCarrier
  groupIdentity : groupCarrier
  groupInverse : groupCarrier -> groupCarrier
  groupAxioms : Prop
  actingOnFiber : groupCarrier -> G.fiberType -> G.fiberType
  transitiveAction : Prop
  freeAction : Prop

structure GaloisGroupEvidence {G : GaloisFibrationPackage} {C : GaloisFibrationClosed G}
    {P : CoveringSpaceClassificationPackage C} (H : GaloisGroupPackage P) where
  groupAxiomsClosed : H.groupAxioms
  transitiveActionClosed : H.transitiveAction
  freeActionClosed : H.freeAction

def GaloisGroupClosed {G : GaloisFibrationPackage} {C : GaloisFibrationClosed G}
    {P : CoveringSpaceClassificationPackage C} (H : GaloisGroupPackage P) : Prop :=
  H.groupAxioms ∧ H.transitiveAction ∧ H.freeAction

theorem galois_group_closed_from_evidence
    {G : GaloisFibrationPackage} {C : GaloisFibrationClosed G}
    {P : CoveringSpaceClassificationPackage C} (H : GaloisGroupPackage P) (E : GaloisGroupEvidence H) :
    GaloisGroupClosed H := by
  exact And.intro E.groupAxiomsClosed (And.intro E.transitiveActionClosed E.freeActionClosed)

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse