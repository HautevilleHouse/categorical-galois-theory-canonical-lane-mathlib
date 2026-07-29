import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoricalGaloisTheoryCanonicalLaneLean.GaloisGroup

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

structure CategoricalGaloisCorrespondencePackage {G : GaloisFibrationPackage} {C : GaloisFibrationClosed G}
    {P : CoveringSpaceClassificationPackage C} {H : GaloisGroupPackage P} where
  intermediateCoverings : Type u
  subgroupLattice : Type v
  bijection : intermediateCoverings ≃ subgroupLattice
  galoisClosure : Prop
  fundamentalTheorem : Prop

structure CategoricalGaloisCorrespondenceEvidence
    {G : GaloisFibrationPackage} {C : GaloisFibrationClosed G}
    {P : CoveringSpaceClassificationPackage C} {H : GaloisGroupPackage P}
    (K : CategoricalGaloisCorrespondencePackage) where
  galoisClosureClosed : K.galoisClosure
  fundamentalTheoremClosed : K.fundamentalTheorem

def CategoricalGaloisCorrespondenceClosed
    {G : GaloisFibrationPackage} {C : GaloisFibrationClosed G}
    {P : CoveringSpaceClassificationPackage C} {H : GaloisGroupPackage P}
    (K : CategoricalGaloisCorrespondencePackage) : Prop :=
  K.galoisClosure ∧ K.fundamentalTheorem

theorem categorical_galois_correspondence_closed_from_evidence
    {G : GaloisFibrationPackage} {C : GaloisFibrationClosed G}
    {P : CoveringSpaceClassificationPackage C} {H : GaloisGroupPackage P}
    (K : CategoricalGaloisCorrespondencePackage) (E : CategoricalGaloisCorrespondenceEvidence K) :
    CategoricalGaloisCorrespondenceClosed K := by
  exact And.intro E.galoisClosureClosed E.fundamentalTheoremClosed

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse