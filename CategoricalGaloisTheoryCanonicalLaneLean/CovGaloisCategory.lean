import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

structure CovGaloisCategoryPackage where
  category : Type u
  finiteLimits : Prop
  finiteColimits : Prop
  strictInitial : Prop
  epiToMono : Prop
  connectedObject : Prop
  galoisCategory : Prop
  mainTheorem : Prop

structure CovGaloisCategoryEvidence (C : CovGaloisCategoryPackage) where
  finiteLimitsClosed : C.finiteLimits
  finiteColimitsClosed : C.finiteColimits
  strictInitialClosed : C.strictInitial
  epiToMonoClosed : C.epiToMono
  connectedObjectClosed : C.connectedObject
  galoisCategoryClosed : C.galoisCategory
  mainTheoremClosed : C.mainTheorem

def CovGaloisCategoryClosed (C : CovGaloisCategoryPackage) : Prop :=
  C.finiteLimits ∧ C.finiteColimits ∧ C.strictInitial ∧ C.epiToMono ∧ C.connectedObject ∧ C.galoisCategory ∧ C.mainTheorem

theorem cov_galois_category_closed_from_evidence (C : CovGaloisCategoryPackage)
    (E : CovGaloisCategoryEvidence C) : CovGaloisCategoryClosed C := by
  exact And.intro E.finiteLimitsClosed
    (And.intro E.finiteColimitsClosed
      (And.intro E.strictInitialClosed
        (And.intro E.epiToMonoClosed
          (And.intro E.connectedObjectClosed
            (And.intro E.galoisCategoryClosed E.mainTheoremClosed)))))

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse