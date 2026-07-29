import HautevilleHouse.CategoricalGaloisTheoryCanonicalLaneLean.GaloisGroup
import HautevilleHouse.CategoricalGaloisTheoryCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

structure GrothendieckGaloisMain where
  baseScheme : Type u
  finiteEtaleCoverings : Type v
  fiberFunctor : FiberFunctor (finiteEtaleCoverings) (FinSet)
  galoisGroup : GaloisGroup (Aut fiberFunctor)
  equivalenceOfCategories : Prop
  galoisCorrespondence : Prop

structure GrothendieckGaloisEvidence (G : GrothendieckGaloisMain) where
  equivalenceOfCategoriesClosed : G.equivalenceOfCategories
  galoisCorrespondenceClosed : G.galoisCorrespondence

def GrothendieckGaloisClosed (G : GrothendieckGaloisMain) : Prop :=
  G.equivalenceOfCategories ∧ G.galoisCorrespondence

theorem grothendieck_galois_closed_from_evidence
    (G : GrothendieckGaloisMain) (E : GrothendieckGaloisEvidence G) :
    GrothendieckGaloisClosed G := by
  exact And.intro E.equivalenceOfCategoriesClosed E.galoisCorrespondenceClosed

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse