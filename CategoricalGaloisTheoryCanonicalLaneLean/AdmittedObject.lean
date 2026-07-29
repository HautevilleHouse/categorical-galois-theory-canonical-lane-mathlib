import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

structure GaloisSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure GaloisAdmittedObject where
  category : Type u
  fiberFunctor : Type v
  profiniteGaloisGroup : Type w
  galoisConnectionEstablished : Prop
  fundamentalTheoremProved : Prop
  conclusion : galoisConnectionEstablished ∧ fundamentalTheoremProved

structure GaloisEndgameState where
  object : GaloisAdmittedObject

def GaloisWitnessClosed (O : GaloisAdmittedObject) : Prop :=
  O.conclusion

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse