import CategoricalGaloisTheoryCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure GaloisCategory where
  C : Type u
  [instance : CategoryTheory.Category C]

structure GaloisAdmittedObject where
  category : GaloisCategory
  galoisClosed : Prop
  fundamentalGroupoid : Type v
  coveringTheory : Prop
  conclusion : coveringTheory

def GaloisWitnessClosed (O : GaloisAdmittedObject) : Prop :=
  O.coveringTheory

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse