import CategoricalGaloisTheoryCanonicalLaneLean.GaloisGroupoid

/-!
# Covering Morphisms Package
-/

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

structure CoveringMorphismsPackage {G : GaloisConnectionPackage}
    {F : GaloisFunctorPackage G} {H : GaloisGroupoidPackage F} where
  coveringMap : Type u → Type v → Type w
  liftingProperty : Prop
  uniqueLifting : Prop
  compositionClosure : Prop

structure CoveringMorphismsEvidence {G : GaloisConnectionPackage}
    {F : GaloisFunctorPackage G} {H : GaloisGroupoidPackage F}
    (C : CoveringMorphismsPackage H) where
  liftingPropertyClosed : C.liftingProperty
  uniqueLiftingClosed : C.uniqueLifting
  compositionClosureClosed : C.compositionClosure

def CoveringMorphismsClosed {G : GaloisConnectionPackage}
    {F : GaloisFunctorPackage G} {H : GaloisGroupoidPackage F}
    (C : CoveringMorphismsPackage H) : Prop :=
  C.liftingProperty ∧ C.uniqueLifting ∧ C.compositionClosure

theorem covering_morphisms_closed_from_evidence {G : GaloisConnectionPackage}
    {F : GaloisFunctorPackage G} {H : GaloisGroupoidPackage F}
    (C : CoveringMorphismsPackage H) (E : CoveringMorphismsEvidence C) :
    CoveringMorphismsClosed C := by
  exact And.intro E.liftingPropertyClosed
    (And.intro E.uniqueLiftingClosed E.compositionClosureClosed)

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse