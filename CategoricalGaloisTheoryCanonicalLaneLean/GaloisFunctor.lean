import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

structure GaloisFunctorPackage where
  categoryC : Type u
  categoryD : Type v
  functorF : Type w
  fullyFaithful : Prop
  essentiallySurjective : Prop
  equivalenceOfCategories : Prop
  preservesLimits : Prop
  preservesColimits : Prop
  reflectsIsomorphisms : Prop

structure GaloisFunctorEvidence (G : GaloisFunctorPackage) where
  fullyFaithfulClosed : G.fullyFaithful
  essentiallySurjectiveClosed : G.essentiallySurjective
  equivalenceOfCategoriesClosed : G.equivalenceOfCategories
  preservesLimitsClosed : G.preservesLimits
  preservesColimitsClosed : G.preservesColimits
  reflectsIsomorphismsClosed : G.reflectsIsomorphisms

def GaloisFunctorClosed (G : GaloisFunctorPackage) : Prop :=
  G.fullyFaithful ∧ G.essentiallySurjective ∧ G.equivalenceOfCategories ∧
  G.preservesLimits ∧ G.preservesColimits ∧ G.reflectsIsomorphisms

theorem galois_functor_closed_from_evidence (G : GaloisFunctorPackage)
    (E : GaloisFunctorEvidence G) : GaloisFunctorClosed G := by
  exact And.intro E.fullyFaithfulClosed
    (And.intro E.essentiallySurjectiveClosed
      (And.intro E.equivalenceOfCategoriesClosed
        (And.intro E.preservesLimitsClosed
          (And.intro E.preservesColimitsClosed E.reflectsIsomorphismsClosed))))

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse