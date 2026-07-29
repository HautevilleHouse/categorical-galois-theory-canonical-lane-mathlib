import canonicalLaneMathlib.AdmissibleClass
import CategoricalGaloisTheoryCanonicalLaneLean.AdmittedObject
import CategoricalGaloisTheoryCanonicalLaneLean.GaloisConnection
import CategoricalGaloisTheoryCanonicalLaneLean.FiberFunctor
import CategoricalGaloisTheoryCanonicalLaneLean.GaloisGroup
import CategoricalGaloisTheoryCanonicalLaneLean.GaloisCategory
import CategoricalGaloisTheoryCanonicalLaneLean.FundamentalTheorem

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

def bridgeClosed (A : GaloisAdmissibleClass) : Prop :=
  GaloisWitnessClosed A.object

theorem bridge_from_admissible_class (A : GaloisAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion.1

def gateClosed (A : GaloisAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : GaloisAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

def ConstrainedGaloisClosure (A : GaloisAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_galois_endgame (A : GaloisAdmissibleClass) :
    ConstrainedGaloisClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse