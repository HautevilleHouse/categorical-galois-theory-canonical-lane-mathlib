import CategoricalGaloisTheoryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GaloisWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse