import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

structure GaloisConnectionPackage where
  categoryC : Type u
  categoryD : Type v
  functorLeft : Type w
  functorRight : Type x
  adjunctionUnit : Prop
  adjunctionCounit : Prop
  adjunctionIso : Prop
  unitNatural : Prop
  counitNatural : Prop
  triangleIdentities : Prop

structure GaloisConnectionEvidence (G : GaloisConnectionPackage) where
  adjunctionUnitClosed : G.adjunctionUnit
  adjunctionCounitClosed : G.adjunctionCounit
  adjunctionIsoClosed : G.adjunctionIso
  unitNaturalClosed : G.unitNatural
  counitNaturalClosed : G.counitNatural
  triangleIdentitiesClosed : G.triangleIdentities

def GaloisConnectionClosed (G : GaloisConnectionPackage) : Prop :=
  G.adjunctionUnit ∧ G.adjunctionCounit ∧ G.adjunctionIso ∧
  G.unitNatural ∧ G.counitNatural ∧ G.triangleIdentities

theorem galois_connection_closed_from_evidence (G : GaloisConnectionPackage)
    (E : GaloisConnectionEvidence G) : GaloisConnectionClosed G := by
  exact And.intro E.adjunctionUnitClosed
    (And.intro E.adjunctionCounitClosed
      (And.intro E.adjunctionIsoClosed
        (And.intro E.unitNaturalClosed
          (And.intro E.counitNaturalClosed E.triangleIdentitiesClosed))))

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse