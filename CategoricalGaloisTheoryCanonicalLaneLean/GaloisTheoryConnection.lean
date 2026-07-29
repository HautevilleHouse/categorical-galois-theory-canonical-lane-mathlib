import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoricalGaloisTheoryCanonicalLaneLean.EtaleFundamentalGroup

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

structure GaloisTheoryConnectionPackage {G : GaloisFibrationPackage} {C : GaloisFibrationClosed G}
    {P : CoveringSpaceClassificationPackage C} {H : GaloisGroupPackage P}
    {K : CategoricalGaloisCorrespondencePackage} {E : EtaleFundamentalGroupPackage} where
  fiberFunctor : G.totalType -> Type u
  fiberFunctorContinuity : Prop
  equivalenceWithGaloisfunctor : Prop
  deducesOriginalGaloisCorrespondence : Prop

structure GaloisTheoryConnectionEvidence
    {G : GaloisFibrationPackage} {C : GaloisFibrationClosed G}
    {P : CoveringSpaceClassificationPackage C} {H : GaloisGroupPackage P}
    {K : CategoricalGaloisCorrespondencePackage} {E : EtaleFundamentalGroupPackage}
    (Conn : GaloisTheoryConnectionPackage) where
  fiberFunctorContinuityClosed : Conn.fiberFunctorContinuity
  equivalenceWithGaloisfunctorClosed : Conn.equivalenceWithGaloisfunctor
  deducesOriginalGaloisCorrespondenceClosed : Conn.deducesOriginalGaloisCorrespondence

def GaloisTheoryConnectionClosed
    {G : GaloisFibrationPackage} {C : GaloisFibrationClosed G}
    {P : CoveringSpaceClassificationPackage C} {H : GaloisGroupPackage P}
    {K : CategoricalGaloisCorrespondencePackage} {E : EtaleFundamentalGroupPackage}
    (Conn : GaloisTheoryConnectionPackage) : Prop :=
  Conn.fiberFunctorContinuity ∧ Conn.equivalenceWithGaloisfunctor ∧ Conn.deducesOriginalGaloisCorrespondence

theorem galois_theory_connection_closed_from_evidence
    {G : GaloisFibrationPackage} {C : GaloisFibrationClosed G}
    {P : CoveringSpaceClassificationPackage C} {H : GaloisGroupPackage P}
    {K : CategoricalGaloisCorrespondencePackage} {E : EtaleFundamentalGroupPackage}
    (Conn : GaloisTheoryConnectionPackage) (Ev : GaloisTheoryConnectionEvidence Conn) :
    GaloisTheoryConnectionClosed Conn := by
  exact And.intro Ev.fiberFunctorContinuityClosed
    (And.intro Ev.equivalenceWithGaloisfunctorClosed Ev.deducesOriginalGaloisCorrespondenceClosed)

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse