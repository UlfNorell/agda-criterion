
open import Agda.Builtin.IO
open import Agda.Builtin.List
open import Agda.Builtin.String
open import Agda.Builtin.Unit
open import Agda.Builtin.Nat

open import Criterion.Main

fac : Nat → Nat
fac zero    = 1
fac (suc n) = n * fac n

main : IO ⊤
main = defaultMain (bench "fac" (whnf fac 100) ∷ [])
