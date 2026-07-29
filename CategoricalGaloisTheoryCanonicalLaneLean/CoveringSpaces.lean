import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.GaloisGroup

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

structure CoveringSpacePackage (G : GaloisGroupPackage) where
  coveringSpaces : Type u
  coveringMaps : coveringSpaces → G.baseSpace
  monodromyAction : G.fundamentalGroup → coveringSpaces → coveringSpaces
  pathLiftingProperty : Prop
  uniqueLiftingProperty : Prop
  classificationBySubgroups : Prop

structure CoveringSpaceEvidence {G : GaloisGroupPackage} (C : CoveringSpacePackage G) where
  pathLiftingPropertyClosed : C.pathLiftingProperty
  uniqueLiftingPropertyClosed : C.uniqueLiftingProperty
  classificationBySubgroupsClosed : C.classificationBySubgroups

def CoveringSpaceClosed {G : GaloisGroupPackage} (C : CoveringSpacePackage G) : Prop :=
  C.pathLiftingProperty ∧ C.uniqueLiftingProperty ∧ C.classificationBySubgroups

theorem covering_space_closed_from_evidence {G : GaloisGroupPackage} (C : CoveringSpacePackage G)
    (E : CoveringSpaceEvidence C) : CoveringSpaceClosed C :=
  And.intro E.pathLiftingPropertyClosed (
    And.intro E.uniqueLiftingPropertyClosed E.classificationBySubgroupsClosed)

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse