-- Copyright (C) 2026 Jonathan f(n) Reed
-- Licensed under AGPL-3.0

import Mathlib.Data.Set.Basic

universe u

structure ProvenanceToken where
  isVerified : Bool
  signatureHash : String

structure Action (State : Type u) where
  targetState : State
  provenance : Option ProvenanceToken

class SafetyContext (State : Type u) where
  IsSafeState : State → Prop
  IsValidMutation : State → Action State → Prop
  provenance_requirement : 
    ∀ (s : State) (a : Action State), 
      IsValidMutation s a → 
        ∃ t : ProvenanceToken, a.provenance = some t ∧ t.isVerified = true

inductive Trajectory (State : Type u) where
  | base : State → Trajectory State
  | transition : State → Action State → Trajectory State → Trajectory State

def TrajectorySafe {State : Type u} [SC : SafetyContext State] : Trajectory State → Prop
  | .base s => SC.IsSafeState s
  | .transition s a rest => SC.IsSafeState s ∧ SC.IsValidMutation s a ∧ TrajectorySafe rest

theorem boundary_invariance_lock {State : Type u} [SC : SafetyContext State] (t : Trajectory State) 
  (h_safe : TrajectorySafe t) : SC.IsSafeState (match t with | .base s => s | .transition s _ _ => s) := by
  cases t with
  | base s => exact h_safe
  | transition s a rest => 
    rcases h_safe with ⟨h_s, _, _⟩
    exact h_s

inductive DemoState where
  | idle
  | working

instance demoSafetyContext : SafetyContext DemoState where
  IsSafeState := fun _ => True  
  IsValidMutation := fun _ a => 
    match a.provenance with
    | some t => t.isVerified = true
    | none => False
  provenance_requirement := by
    intro s a h
    cases h_opt : a.provenance with
    | none => 
      rw [h_opt] at h
      exact False.elim h
    | some t => 
      use t
      constructor
      · rfl
      · rw [h_opt] at h
        exact h

theorem non_triviality_witness : ∃ (s : DemoState), demoSafetyContext.IsSafeState s := by
  use DemoState.idle
  trivial

def validationGate {State : Type u} [SC : SafetyContext State] 
    (s : State) (a : Action State) 
    [Decidable (SC.IsSafeState s ∧ SC.IsValidMutation s a)] : Nat :=
  if SC.IsSafeState s ∧ SC.IsValidMutation s a then 1 else 0

theorem gate_collapse_on_violation {State : Type u} [SC : SafetyContext State] 
    (s : State) (a : Action State) 
    [Decidable (SC.IsSafeState s ∧ SC.IsValidMutation s a)]
    (h_invalid : ¬ (SC.IsSafeState s ∧ SC.IsValidMutation s a)) : validationGate s a = 0 := by
  unfold validationGate
  exact ite_eq_right h_invalid

class SafeProjection (State : Type u) [SC : SafetyContext State] where
  project : State → State
  projection_is_safe : ∀ (s : State), SC.IsSafeState (project s)

theorem projected_state_is_always_safe {State : Type u} [SC : SafetyContext State] 
    [SP : SafeProjection State] (s : State) : SC.IsSafeState (SP.project s) := by
  exact SP.projection_is_safe s