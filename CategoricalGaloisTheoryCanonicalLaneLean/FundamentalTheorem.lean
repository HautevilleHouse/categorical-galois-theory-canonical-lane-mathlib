import canonicalLaneMathlib.AdmissibleClass
import CategoricalGaloisTheoryCanonicalLaneLean.GaloisCategory

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

structure FundamentalTheoremPackage {C : GaloisConnectionPackage}
    {F : FiberFunctorPackage C} {G : GaloisGroupPackage}
    (GC : GaloisCategoryPackage F G) where
  equivalence : Type u → Type v
  preservesStructure : Prop
  fullyFaithful : Prop
  essentiallySurjective : Prop

structure FundamentalTheoremEvidence {C : GaloisConnectionPackage}
    {F : FiberFunctorPackage C} {G : GaloisGroupPackage}
    {GC : GaloisCategoryPackage F G}
    (FT : FundamentalTheoremPackage GC) where
  equivalenceClosed : FT.equivalence = FT.equivalence
  preservesStructureClosed : FT.preservesStructure
  fullyFaithfulClosed : FT.fullyFaithful
  essentiallySurjectiveClosed : FT.essentiallySurjective

def FundamentalTheoremClosed {C : GaloisConnectionPackage}
    {F : FiberFunctorPackage C} {G : GaloisGroupPackage}
    {GC : GaloisCategoryPackage F G}
    (FT : FundamentalTheoremPackage GC) : Prop :=
  FT.preservesStructure ∧ FT.fullyFaithful ∧ FT.essentiallySurjective

theorem fundamental_theorem_closed_from_evidence
    {C : GaloisConnectionPackage} {F : FiberFunctorPackage C} {G : GaloisGroupPackage}
    {GC : GaloisCategoryPackage F G} (FT : FundamentalTheoremPackage GC)
    (E : FundamentalTheoremEvidence FT) : FundamentalTheoremClosed FT := by
  exact And.intro E.preservesStructureClosed
    (And.intro E.fullyFaithfulClosed E.essentiallySurjectiveClosed)

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse