import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

structure GaloisCategoryPackage where
  category : Type u
  fiberFunctor : Type v
  connectedObjects : Type w
  strictGaloisProperty : Prop
  proRepresentability : Prop
  equivalenceToGaloisGroup : Prop

structure GaloisCategoryEvidence (G : GaloisCategoryPackage) where
  strictGaloisPropertyClosed : G.strictGaloisProperty
  proRepresentabilityClosed : G.proRepresentability
  equivalenceToGaloisGroupClosed : G.equivalenceToGaloisGroup

def GaloisCategoryClosed (G : GaloisCategoryPackage) : Prop :=
  G.strictGaloisProperty ∧ G.proRepresentability ∧ G.equivalenceToGaloisGroup

theorem galois_category_closed_from_evidence
    (G : GaloisCategoryPackage) (E : GaloisCategoryEvidence G) :
    GaloisCategoryClosed G := by
  exact And.intro E.strictGaloisPropertyClosed
    (And.intro E.proRepresentabilityClosed E.equivalenceToGaloisGroupClosed)

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse