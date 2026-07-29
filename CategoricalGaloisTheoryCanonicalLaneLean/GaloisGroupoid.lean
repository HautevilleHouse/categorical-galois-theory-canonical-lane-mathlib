import CategoricalGaloisTheoryCanonicalLaneLean.GaloisFunctor

/-!
# Galois Groupoid Package
-/

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

structure GaloisGroupoidPackage {G : GaloisConnectionPackage}
    (F : GaloisFunctorPackage G) where
  objectSet : Type u
  morphism : objectSet → objectSet → Type v
  composition : ∀ (a b c : objectSet), morphism a b → morphism b c → morphism a c
  associativity : Prop
  identity : ∀ (a : objectSet), morphism a a
  inverses : ∀ (a b : objectSet), morphism a b → morphism b a
  groupoidLaws : Prop

structure GaloisGroupoidEvidence {G : GaloisConnectionPackage}
    {F : GaloisFunctorPackage G} (H : GaloisGroupoidPackage F) where
  associativityClosed : H.associativity
  groupoidLawsClosed : H.groupoidLaws

def GaloisGroupoidClosed {G : GaloisConnectionPackage}
    {F : GaloisFunctorPackage G} (H : GaloisGroupoidPackage F) : Prop :=
  H.associativity ∧ H.groupoidLaws

theorem galois_groupoid_closed_from_evidence {G : GaloisConnectionPackage}
    {F : GaloisFunctorPackage G} (H : GaloisGroupoidPackage F)
    (E : GaloisGroupoidEvidence H) : GaloisGroupoidClosed H := by
  exact And.intro E.associativityClosed E.groupoidLawsClosed

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse