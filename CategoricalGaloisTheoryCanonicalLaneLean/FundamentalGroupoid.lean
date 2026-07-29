import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

structure FundamentalGroupoidPackage where
  topologicalSpace : Type u
  basePoints : Type v
  pathGroupoid : Type w
  coveringSpaceCorrespondence : Prop
  monodromyAction : Prop
  classificationOfCoverings : Prop

structure FundamentalGroupoidEvidence (F : FundamentalGroupoidPackage) where
  coveringSpaceCorrespondenceClosed : F.coveringSpaceCorrespondence
  monodromyActionClosed : F.monodromyAction
  classificationOfCoveringsClosed : F.classificationOfCoverings

def FundamentalGroupoidClosed (F : FundamentalGroupoidPackage) : Prop :=
  F.coveringSpaceCorrespondence ∧ F.monodromyAction ∧ F.classificationOfCoverings

theorem fundamental_groupoid_closed_from_evidence
    (F : FundamentalGroupoidPackage) (E : FundamentalGroupoidEvidence F) :
    FundamentalGroupoidClosed F := by
  exact And.intro E.coveringSpaceCorrespondenceClosed
    (And.intro E.monodromyActionClosed E.classificationOfCoveringsClosed)

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse