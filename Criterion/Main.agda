
module Criterion.Main where

open import Agda.Builtin.String
open import Agda.Builtin.List
open import Agda.Builtin.IO
open import Agda.Builtin.Unit

{-# IMPORT Criterion.Main #-}

postulate
  Benchmarkable : Set
  Benchmark     : Set
  whnf          : ∀ {a b} {A : Set a} {B : Set b} → (A → B) → A → Benchmarkable
  whnfIO        : ∀ {a} {A : Set a} → IO A → Benchmarkable
  bench         : String → Benchmarkable → Benchmark
  bgroup        : String → List Benchmark → Benchmark
  defaultMain   : List Benchmark → IO ⊤

{-# COMPILED_TYPE Benchmarkable Criterion.Main.Benchmarkable #-}
{-# COMPILED_TYPE Benchmark     Criterion.Main.Benchmark     #-}

{-# COMPILED whnf   (\ _ _ _ _ -> Criterion.Main.whnf)   #-}
{-# COMPILED whnfIO (\ _ _     -> Criterion.Main.whnfIO) #-}

{-# COMPILED bench  (Criterion.Main.bench . Data.Text.unpack)  #-}
{-# COMPILED bgroup (Criterion.Main.bgroup . Data.Text.unpack) #-}

{-# COMPILED defaultMain Criterion.Main.defaultMain #-}
