import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

structure GaloisCorrespondencePackage where
  categoryC : Type u
  intermediateObjects : Type v
  closureOperator : Type w
  galoisConnection : GaloisConnectionPackage
  galoisFunctor : GaloisFunctorPackage
  fundamentalTheorem : Prop
  bijectionSubgroups : Prop
  normalExtensionsClassified : Prop
  separabilityCondition : Prop

structure GaloisCorrespondenceEvidence (G : GaloisCorrespondencePackage) where
  fundamentalTheoremClosed : G.fundamentalTheorem
  bijectionSubgroupsClosed : G.bijectionSubgroups
  normalExtensionsClassifiedClosed : G.normalExtensionsClassified
  separabilityConditionClosed : G.separabilityCondition
  galoisConnectionEvidence : GaloisConnectionEvidence G.galoisConnection
  galoisFunctorEvidence : GaloisFunctorEvidence G.galoisFunctor

def GaloisCorrespondenceClosed (G : GaloisCorrespondencePackage) : Prop :=
  G.fundamentalTheorem ∧ G.bijectionSubgroups ∧
  G.normalExtensionsClassified ∧ G.separabilityCondition ∧
  GaloisConnectionClosed G.galoisConnection ∧
  GaloisFunctorClosed G.galoisFunctor

theorem galois_correspondence_closed_from_evidence (G : GaloisCorrespondencePackage)
    (E : GaloisCorrespondenceEvidence G) : GaloisCorrespondenceClosed G := by
  have hConn : GaloisConnectionClosed G.galoisConnection :=
    galois_connection_closed_from_evidence G.galoisConnection E.galoisConnectionEvidence
  have hFunc : GaloisFunctorClosed G.galoisFunctor :=
    galois_functor_closed_from_evidence G.galoisFunctor E.galoisFunctorEvidence
  exact And.intro E.fundamentalTheoremClosed
    (And.intro E.bijectionSubgroupsClosed
      (And.intro E.normalExtensionsClassifiedClosed
        (And.intro E.separabilityConditionClosed
          (And.intro hConn hFunc))))

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse