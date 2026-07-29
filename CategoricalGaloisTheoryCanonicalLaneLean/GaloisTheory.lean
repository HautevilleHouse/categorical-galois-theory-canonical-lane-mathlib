import CategoricalGaloisTheoryCanonicalLaneLean.GaloisConnection
import CategoricalGaloisTheoryCanonicalLaneLean.GaloisAdmittedObject

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

structure GaloisTheoryPackage (G : GaloisConnection C D) where
  fibreFunctor : C ⥤ Finset
  galoisGroupoid : Type u
  fundamentalTheorem : Prop
  intermediateExtensionsClassified : Prop

structure GaloisTheoryEvidence (P : GaloisTheoryPackage G) where
  fundamentalTheoremClosed : P.fundamentalTheorem
  intermediateExtensionsClassifiedClosed : P.intermediateExtensionsClassified

def GaloisTheoryClosed (P : GaloisTheoryPackage G) : Prop :=
  P.fundamentalTheorem ∧ P.intermediateExtensionsClassified

theorem galois_theory_closed_from_evidence
    (P : GaloisTheoryPackage G) (E : GaloisTheoryEvidence P) :
    GaloisTheoryClosed P := by
  exact And.intro E.fundamentalTheoremClosed E.intermediateExtensionsClassifiedClosed

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse