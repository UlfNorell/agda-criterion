
module Criterion.Main where

open import Agda.Builtin.String
open import Agda.Builtin.List
open import Agda.Builtin.IO
open import Agda.Builtin.Unit

{-# FOREIGN GHC import Criterion.Main #-}

postulate
  Benchmarkable : Set
  Benchmark     : Set
  whnf          : ∀ {a b} {A : Set a} {B : Set b} → (A → B) → A → Benchmarkable
  whnfIO        : ∀ {a} {A : Set a} → IO A → Benchmarkable
  bench         : String → Benchmarkable → Benchmark
  bgroup        : String → List Benchmark → Benchmark
  defaultMain   : List Benchmark → IO ⊤

{-# COMPILE GHC Benchmarkable = type Criterion.Main.Benchmarkable #-}
{-# COMPILE GHC Benchmark     = type Criterion.Main.Benchmark     #-}

{-# COMPILE GHC whnf   = \ _ _ _ _ -> Criterion.Main.whnf   #-}
{-# COMPILE GHC whnfIO = \ _ _     -> Criterion.Main.whnfIO #-}

{-# COMPILE GHC bench  = Criterion.Main.bench  . Data.Text.unpack #-}
{-# COMPILE GHC bgroup = Criterion.Main.bgroup . Data.Text.unpack #-}

{-# COMPILE GHC defaultMain = Criterion.Main.defaultMain #-}
