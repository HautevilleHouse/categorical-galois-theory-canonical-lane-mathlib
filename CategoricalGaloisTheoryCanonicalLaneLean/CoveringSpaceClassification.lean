import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoricalGaloisTheoryCanonicalLaneLean.GaloisFibration

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

structure CoveringSpaceClassificationPackage {G : GaloisFibrationPackage} (C : GaloisFibrationClosed G) where
  monodromyAction : G.fiberType -> G.baseType -> G.fiberType
  groupOfDeckTransformations : Type u
  galoisCorrespondence : Prop
  isomorphismWithFundamentalGroup : Prop
  classificationTheorem : Prop

structure CoveringSpaceClassificationEvidence {G : GaloisFibrationPackage} {C : GaloisFibrationClosed G}
    (P : CoveringSpaceClassificationPackage C) where
  galoisCorrespondenceClosed : P.galoisCorrespondence
  isomorphismWithFundamentalGroupClosed : P.isomorphismWithFundamentalGroup
  classificationTheoremClosed : P.classificationTheorem

def CoveringSpaceClassificationClosed {G : GaloisFibrationPackage} {C : GaloisFibrationClosed G}
    (P : CoveringSpaceClassificationPackage C) : Prop :=
  P.galoisCorrespondence ∧ P.isomorphismWithFundamentalGroup ∧ P.classificationTheorem

theorem covering_space_classification_closed_from_evidence
    {G : GaloisFibrationPackage} {C : GaloisFibrationClosed G}
    (P : CoveringSpaceClassificationPackage C) (E : CoveringSpaceClassificationEvidence P) :
    CoveringSpaceClassificationClosed P := by
  exact And.intro E.galoisCorrespondenceClosed
    (And.intro E.isomorphismWithFundamentalGroupClosed E.classificationTheoremClosed)

theorem covering_space_classification_supplies_monodromy
    {G : GaloisFibrationPackage} {C : GaloisFibrationClosed G}
    (P : CoveringSpaceClassificationPackage C) (x : G.fiberType) (b : G.baseType) : G.fiberType :=
  P.monodromyAction x b

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse