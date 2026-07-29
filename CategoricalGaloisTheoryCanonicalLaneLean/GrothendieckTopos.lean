import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

structure GrothendieckToposPackage where
  site : Type u
  topology : Type v
  sheaves : Type w
  point : Type x
  classifyingTopos : Type y
  pointedTopos : Prop
  galoisType : Prop
  localicGroupoid : Prop

structure GrothendieckToposEvidence (G : GrothendieckToposPackage) where
  pointedToposClosed : G.pointedTopos
  galoisTypeClosed : G.galoisType
  localicGroupoidClosed : G.localicGroupoid

def GrothendieckToposClosed (G : GrothendieckToposPackage) : Prop :=
  G.pointedTopos ∧ G.galoisType ∧ G.localicGroupoid

theorem grothendieck_topos_closed_from_evidence
    (G : GrothendieckToposPackage) (E : GrothendieckToposEvidence G) :
    GrothendieckToposClosed G := by
  exact And.intro E.pointedToposClosed
    (And.intro E.galoisTypeClosed E.localicGroupoidClosed)

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse