import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

structure FiniteEtaleMorphismPackage where
  sourceScheme : Type u
  targetScheme : Type v
  finitePresentation : Prop
  etaleLocus : Prop
  finiteEtaleDegree : Prop
  pullbackFunctor : Prop
  etaleBaseChange : Prop

structure FiniteEtaleMorphismEvidence (F : FiniteEtaleMorphismPackage) where
  finitePresentationClosed : F.finitePresentation
  etaleLocusClosed : F.etaleLocus
  finiteEtaleDegreeClosed : F.finiteEtaleDegree
  pullbackFunctorClosed : F.pullbackFunctor
  etaleBaseChangeClosed : F.etaleBaseChange

def FiniteEtaleMorphismClosed (F : FiniteEtaleMorphismPackage) : Prop :=
  F.finitePresentation ∧ F.etaleLocus ∧ F.finiteEtaleDegree ∧
  F.pullbackFunctor ∧ F.etaleBaseChange

theorem finite_etale_morphism_closed_from_evidence
    (F : FiniteEtaleMorphismPackage) (E : FiniteEtaleMorphismEvidence F) :
    FiniteEtaleMorphismClosed F := by
  exact And.intro E.finitePresentationClosed
    (And.intro E.etaleLocusClosed
      (And.intro E.finiteEtaleDegreeClosed
        (And.intro E.pullbackFunctorClosed E.etaleBaseChangeClosed)))

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse