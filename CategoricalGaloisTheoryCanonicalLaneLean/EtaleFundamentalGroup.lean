import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

structure EtaleFundamentalGroupPackage where
  scheme : Type u
  geometricPoint : Type v
  etaleCoverings : Type w
  fundamentalGroup : Type x
  coveringCorrespondence : Prop
  proFiniteGroup : Prop
  classificationOfCovers : Prop

structure EtaleFundamentalGroupEvidence (E : EtaleFundamentalGroupPackage) where
  coveringCorrespondenceClosed : E.coveringCorrespondence
  proFiniteGroupClosed : E.proFiniteGroup
  classificationOfCoversClosed : E.classificationOfCovers

def EtaleFundamentalGroupClosed (E : EtaleFundamentalGroupPackage) : Prop :=
  E.coveringCorrespondence ∧ E.proFiniteGroup ∧ E.classificationOfCovers

theorem etale_fundamental_group_closed_from_evidence
    (E : EtaleFundamentalGroupPackage) (Ev : EtaleFundamentalGroupEvidence E) :
    EtaleFundamentalGroupClosed E := by
  exact And.intro Ev.coveringCorrespondenceClosed
    (And.intro Ev.proFiniteGroupClosed Ev.classificationOfCoversClosed)

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse