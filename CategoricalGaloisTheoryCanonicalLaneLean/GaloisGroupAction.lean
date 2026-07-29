import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

structure GaloisGroupActionPackage where
  group : Type u
  category : Type v
  actionFunctor : Type w
  fixedPointObject : Prop
  invariantObject : Prop
  galoisDescent : Prop
  homotopyFixedPoint : Prop

structure GaloisGroupActionEvidence (G : GaloisGroupActionPackage) where
  fixedPointObjectClosed : G.fixedPointObject
  invariantObjectClosed : G.invariantObject
  galoisDescentClosed : G.galoisDescent
  homotopyFixedPointClosed : G.homotopyFixedPoint

def GaloisGroupActionClosed (G : GaloisGroupActionPackage) : Prop :=
  G.fixedPointObject ∧ G.invariantObject ∧ G.galoisDescent ∧ G.homotopyFixedPoint

theorem galois_group_action_closed_from_evidence (G : GaloisGroupActionPackage)
    (E : GaloisGroupActionEvidence G) : GaloisGroupActionClosed G := by
  exact And.intro E.fixedPointObjectClosed
    (And.intro E.invariantObjectClosed
      (And.intro E.galoisDescentClosed E.homotopyFixedPointClosed))

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse