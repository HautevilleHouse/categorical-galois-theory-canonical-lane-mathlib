import canonicalLaneMathlib.AdmissibleClass
import Mathlib.CategoryTheory.Category.Basic

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

open CategoryTheory

structure GaloisAdmittedObject where
  extensionField : Type u
  baseField : Type v
  galoisGroup : Type w
  galoisCorrespondence : Prop
  conclusion : galoisCorrespondence

def GaloisWitnessClosed (O : GaloisAdmittedObject) : Prop :=
  O.galoisCorrespondence

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse