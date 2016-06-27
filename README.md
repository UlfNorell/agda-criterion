# agda-criterion
Agda bindings to (a small part of) the Criterion benchmark library.

See [criterion docs](https://hackage.haskell.org/package/criterion) for information about criterion.

Tested with criterion-1.1.1.0.

Example
-------

```agda
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
```
