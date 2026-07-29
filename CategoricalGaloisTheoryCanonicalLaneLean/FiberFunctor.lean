import HautevilleHouse.CategoricalGaloisTheoryCanonicalLaneLean.GaloisFibration

namespace HautevilleHouse
namespace CategoricalGaloisTheoryCanonicalLaneLean

structure FiberFunctor {C : Type u} [Category C] {D : Type v} [Category D] where
  obj : C → D
  map : ∀ {X Y : C}, (X ⟶ Y) → (obj X ⟶ obj Y)
  preservesIdentity : ∀ (X : C), map (𝟙 X) = 𝟙 (obj X)
  preservesComposition : ∀ {X Y Z : C} (f : X ⟶ Y) (g : Y ⟶ Z), map (g ∘ f) = map g ∘ map f
  fiberRepresentability : Prop
  exactness : Prop

structure FiberFunctorEvidence {C : Type u} [Category C] {D : Type v} [Category D]
    (F : FiberFunctor C D) where
  fiberRepresentabilityClosed : F.fiberRepresentability
  exactnessClosed : F.exactness

def FiberFunctorClosed {C : Type u} [Category C] {D : Type v} [Category D]
    (F : FiberFunctor C D) : Prop :=
  F.fiberRepresentability ∧ F.exactness

theorem fiber_functor_closed_from_evidence
    {C : Type u} [Category C] {D : Type v} [Category D]
    (F : FiberFunctor C D) (E : FiberFunctorEvidence F) :
    FiberFunctorClosed F := by
  exact And.intro E.fiberRepresentabilityClosed E.exactnessClosed

end CategoricalGaloisTheoryCanonicalLaneLean
end HautevilleHouse