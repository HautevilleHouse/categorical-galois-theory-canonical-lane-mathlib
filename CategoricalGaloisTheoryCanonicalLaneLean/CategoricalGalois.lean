import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.CoveringSpaces
import canonicalLaneMathlib.GaloisGroup

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

structure CategoricalGaloisTheoremPackage {G : GaloisGroupPackage} (C : CoveringSpacePackage G) where
  fiberFunctor : Type u
  fiberFunctorIso : Prop
  galoisConnection : Prop
  categoricalGaloisCorrespondence : Prop
  mainTheoremStatement : Prop

structure CategoricalGaloisTheoremEvidence {G : GaloisGroupPackage} {C : CoveringSpacePackage G}
    (CG : CategoricalGaloisTheoremPackage C) where
  fiberFunctorIsoClosed : CG.fiberFunctorIso
  galoisConnectionClosed : CG.galoisConnection
  categoricalGaloisCorrespondenceClosed : CG.categoricalGaloisCorrespondence
  mainTheoremStatementClosed : CG.mainTheoremStatement

def CategoricalGaloisTheoremClosed {G : GaloisGroupPackage} {C : CoveringSpacePackage G}
    (CG : CategoricalGaloisTheoremPackage C) : Prop :=
  CG.fiberFunctorIso ∧ CG.galoisConnection ∧
  CG.categoricalGaloisCorrespondence ∧ CG.mainTheoremStatement

theorem categorical_galois_theorem_closed_from_evidence {G : GaloisGroupPackage} {C : CoveringSpacePackage G}
    (CG : CategoricalGaloisTheoremPackage C) (E : CategoricalGaloisTheoremEvidence CG) :
    CategoricalGaloisTheoremClosed CG :=
  And.intro E.fiberFunctorIsoClosed (
    And.intro E.galoisConnectionClosed (
      And.intro E.categoricalGaloisCorrespondenceClosed E.mainTheoremStatementClosed))

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse