; SMT 2
; Generated for Z3
(set-info :source "")
(set-option :produce-models true)

; find_symbols
(declare-fun |tmp| () (_ BitVec 64))
(declare-fun |inv_10| ((_ BitVec 32) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)) (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64))) ) Bool)

(assert (forall ((|memor_0| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|alloc_0| (Array (_ BitVec 64) (_ BitVec 64))) (|main::$tmp::return_value_nondet_int| (_ BitVec 32)) (|main::$tmp::tmp_if_expr| (_ BitVec 64)) (|main::1::1::i| (_ BitVec 64)) (|main::1::L| (_ BitVec 64)))
  (=> (= |alloc_0| ((as const (Array (_ BitVec 64) (_ BitVec 64)))(_ bv0 64))) 
    (|inv_10| |main::$tmp::return_value_nondet_int| |main::$tmp::tmp_if_expr| |main::1::1::i| |main::1::L| |alloc_0| |memor_0|))))

(declare-fun |inv_3| ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)) (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64))) ) Bool)

(assert (forall ((|memor_0| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|alloc_0| (Array (_ BitVec 64) (_ BitVec 64))) (|alloc_1| (Array (_ BitVec 64) (_ BitVec 64))) (|alloc_2| (Array (_ BitVec 64) (_ BitVec 64))) (|main::$tmp::return_value_nondet_int_2| (_ BitVec 32)) (|main::$tmp::tmp_if_expr| (_ BitVec 64)) (|main::$tmp::tmp_if_expr_1| (_ BitVec 64)) (|main::$tmp::tmp_if_expr_2| (_ BitVec 64)) (|main::1::1::i| (_ BitVec 64)) (|main::1::1::i_1| (_ BitVec 64)) (|main::1::1::i_2| (_ BitVec 64)) (|main::1::L| (_ BitVec 64)) (|main::1::L_1| (_ BitVec 64)) (|main::1::L_2| (_ BitVec 64)))
  (=> (and 
    (|inv_10| |main::$tmp::return_value_nondet_int_2| |main::$tmp::tmp_if_expr_2| |main::1::1::i_2| |main::1::L_2| |alloc_2| |memor_0|)
       (= |alloc_0| (store |alloc_1| (_ bv6053561456450 64) (_ bv6053561456450 64)))
       (= |alloc_1| (store |alloc_2| (_ bv9363835545496 64) (_ bv9363835545496 64)))
       (= |main::$tmp::tmp_if_expr_2| |main::$tmp::tmp_if_expr_1|)
       (= |main::1::1::i_2| |main::1::1::i_1|)
       (= ((_ sign_extend 32) |main::$tmp::return_value_nondet_int_2|) |main::1::L_1|)
       (= |main::$tmp::tmp_if_expr_1| |main::$tmp::tmp_if_expr|)
       (= (_ bv0 64) |main::1::1::i|)
       (= |main::1::L_1| |main::1::L|)) 
    (|inv_3| |main::$tmp::tmp_if_expr| |main::1::1::i| |main::1::L| |alloc_0| |memor_0|))))

(declare-fun |inv_7| ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)) (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64))) ) Bool)

(assert (forall ((|memor_0| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|alloc_0| (Array (_ BitVec 64) (_ BitVec 64))) (|main::$tmp::tmp_if_expr| (_ BitVec 64)) (|main::1::1::i| (_ BitVec 64)) (|main::1::L| (_ BitVec 64)))
  (=> (and 
    (|inv_3| |main::$tmp::tmp_if_expr| |main::1::1::i| |main::1::L| |alloc_0| |memor_0|)
       (not (bvuge |main::1::1::i| |main::1::L|))) 
    (|inv_7| |main::$tmp::tmp_if_expr| |main::1::1::i| |main::1::L| |alloc_0| |memor_0|))))

(assert (forall ((|memor_0| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|alloc_0| (Array (_ BitVec 64) (_ BitVec 64))) (|main::$tmp::tmp_if_expr| (_ BitVec 64)) (|main::1::1::i| (_ BitVec 64)) (|main::1::L| (_ BitVec 64)))
  (=> (and 
    (|inv_7| |main::$tmp::tmp_if_expr| |main::1::1::i| |main::1::L| |alloc_0| |memor_0|)
       (not (bvsge (select (select |memor_0| (select |alloc_0| (_ bv9363835545496 64))) |main::1::1::i|) (_ bv1 64)))
       (= (select |alloc_0| (_ bv9363835545496 64)) (_ bv0 64))) false)))

(declare-fun |inv_8| ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)) (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64))) ) Bool)

(assert (forall ((|memor_0| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|alloc_0| (Array (_ BitVec 64) (_ BitVec 64))) (|main::$tmp::tmp_if_expr| (_ BitVec 64)) (|main::1::1::i| (_ BitVec 64)) (|main::1::L| (_ BitVec 64)))
  (=> (and 
    (|inv_7| |main::$tmp::tmp_if_expr| |main::1::1::i| |main::1::L| |alloc_0| |memor_0|)
       (not (bvsge (select (select |memor_0| (select |alloc_0| (_ bv9363835545496 64))) |main::1::1::i|) (_ bv1 64)))) 
    (|inv_8| |main::$tmp::tmp_if_expr| |main::1::1::i| |main::1::L| |alloc_0| |memor_0|))))

(assert (forall ((|memor_0| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|alloc_0| (Array (_ BitVec 64) (_ BitVec 64))) (|main::$tmp::tmp_if_expr| (_ BitVec 64)) (|main::$tmp::tmp_if_expr_1| (_ BitVec 64)) (|main::1::1::i| (_ BitVec 64)) (|main::1::1::i_1| (_ BitVec 64)) (|main::1::L| (_ BitVec 64)) (|main::1::L_1| (_ BitVec 64)))
  (=> (and 
    (|inv_8| |main::$tmp::tmp_if_expr_1| |main::1::1::i_1| |main::1::L_1| |alloc_0| |memor_0|)
       (= (bvneg (select (select |memor_0| (select |alloc_0| (_ bv9363835545496 64))) |main::1::1::i_1|)) |main::$tmp::tmp_if_expr|)
       (= |main::1::1::i_1| |main::1::1::i|)
       (= |main::1::L_1| |main::1::L|)
       (= (select |alloc_0| (_ bv9363835545496 64)) (_ bv0 64))) false)))

(declare-fun |inv_5| ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)) (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64))) ) Bool)

(assert (forall ((|memor_0| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|alloc_0| (Array (_ BitVec 64) (_ BitVec 64))) (|main::$tmp::tmp_if_expr| (_ BitVec 64)) (|main::$tmp::tmp_if_expr_1| (_ BitVec 64)) (|main::1::1::i| (_ BitVec 64)) (|main::1::1::i_1| (_ BitVec 64)) (|main::1::L| (_ BitVec 64)) (|main::1::L_1| (_ BitVec 64)))
  (=> (and 
    (|inv_8| |main::$tmp::tmp_if_expr_1| |main::1::1::i_1| |main::1::L_1| |alloc_0| |memor_0|)
       (= (bvneg (select (select |memor_0| (select |alloc_0| (_ bv9363835545496 64))) |main::1::1::i_1|)) |main::$tmp::tmp_if_expr|)
       (= |main::1::1::i_1| |main::1::1::i|)
       (= |main::1::L_1| |main::1::L|)) 
    (|inv_5| |main::$tmp::tmp_if_expr| |main::1::1::i| |main::1::L| |alloc_0| |memor_0|))))

(assert (forall ((|memor_0| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|alloc_0| (Array (_ BitVec 64) (_ BitVec 64))) (|main::$tmp::tmp_if_expr| (_ BitVec 64)) (|main::1::1::i| (_ BitVec 64)) (|main::1::L| (_ BitVec 64)))
  (=> (and 
    (|inv_7| |main::$tmp::tmp_if_expr| |main::1::1::i| |main::1::L| |alloc_0| |memor_0|)
       (bvsge (select (select |memor_0| (select |alloc_0| (_ bv9363835545496 64))) |main::1::1::i|) (_ bv1 64))
       (= (select |alloc_0| (_ bv9363835545496 64)) (_ bv0 64))) false)))

(declare-fun |inv_6| ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)) (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64))) ) Bool)

(assert (forall ((|memor_0| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|alloc_0| (Array (_ BitVec 64) (_ BitVec 64))) (|main::$tmp::tmp_if_expr| (_ BitVec 64)) (|main::1::1::i| (_ BitVec 64)) (|main::1::L| (_ BitVec 64)))
  (=> (and 
    (|inv_7| |main::$tmp::tmp_if_expr| |main::1::1::i| |main::1::L| |alloc_0| |memor_0|)
       (bvsge (select (select |memor_0| (select |alloc_0| (_ bv9363835545496 64))) |main::1::1::i|) (_ bv1 64))) 
    (|inv_6| |main::$tmp::tmp_if_expr| |main::1::1::i| |main::1::L| |alloc_0| |memor_0|))))

(assert (forall ((|memor_0| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|alloc_0| (Array (_ BitVec 64) (_ BitVec 64))) (|main::$tmp::tmp_if_expr| (_ BitVec 64)) (|main::$tmp::tmp_if_expr_1| (_ BitVec 64)) (|main::1::1::i| (_ BitVec 64)) (|main::1::1::i_1| (_ BitVec 64)) (|main::1::L| (_ BitVec 64)) (|main::1::L_1| (_ BitVec 64)))
  (=> (and 
    (|inv_6| |main::$tmp::tmp_if_expr_1| |main::1::1::i_1| |main::1::L_1| |alloc_0| |memor_0|)
       (= (select (select |memor_0| (select |alloc_0| (_ bv9363835545496 64))) |main::1::1::i_1|) |main::$tmp::tmp_if_expr|)
       (= |main::1::1::i_1| |main::1::1::i|)
       (= |main::1::L_1| |main::1::L|)
       (= (select |alloc_0| (_ bv9363835545496 64)) (_ bv0 64))) false)))

(assert (forall ((|memor_0| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|alloc_0| (Array (_ BitVec 64) (_ BitVec 64))) (|main::$tmp::tmp_if_expr| (_ BitVec 64)) (|main::$tmp::tmp_if_expr_1| (_ BitVec 64)) (|main::1::1::i| (_ BitVec 64)) (|main::1::1::i_1| (_ BitVec 64)) (|main::1::L| (_ BitVec 64)) (|main::1::L_1| (_ BitVec 64)))
  (=> (and 
    (|inv_6| |main::$tmp::tmp_if_expr_1| |main::1::1::i_1| |main::1::L_1| |alloc_0| |memor_0|)
       (= (select (select |memor_0| (select |alloc_0| (_ bv9363835545496 64))) |main::1::1::i_1|) |main::$tmp::tmp_if_expr|)
       (= |main::1::1::i_1| |main::1::1::i|)
       (= |main::1::L_1| |main::1::L|)) 
    (|inv_5| |main::$tmp::tmp_if_expr| |main::1::1::i| |main::1::L| |alloc_0| |memor_0|))))

(assert (forall ((|memor_0| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|memor_1| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|alloc_0| (Array (_ BitVec 64) (_ BitVec 64))) (|main::$tmp::tmp_if_expr| (_ BitVec 64)) (|main::$tmp::tmp_if_expr_1| (_ BitVec 64)) (|main::1::1::i| (_ BitVec 64)) (|main::1::1::i_1| (_ BitVec 64)) (|main::1::L| (_ BitVec 64)) (|main::1::L_1| (_ BitVec 64)))
  (=> (and 
    (|inv_5| |main::$tmp::tmp_if_expr_1| |main::1::1::i_1| |main::1::L_1| |alloc_0| |memor_1|)
       (= |memor_0| (store |memor_1| (select |alloc_0| (_ bv6907487098696 64)) (store (select |memor_1| (select |alloc_0| (_ bv6907487098696 64))) |main::1::1::i_1| |main::$tmp::tmp_if_expr_1|)))
       (= |main::$tmp::tmp_if_expr_1| |main::$tmp::tmp_if_expr|)
       (= (bvadd |main::1::1::i_1| (_ bv1 64)) |main::1::1::i|)
       (= |main::1::L_1| |main::1::L|)
       (= (select |alloc_0| (_ bv6907487098696 64)) (_ bv0 64))) false)))

(assert (forall ((|memor_0| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|memor_1| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|alloc_0| (Array (_ BitVec 64) (_ BitVec 64))) (|main::$tmp::tmp_if_expr| (_ BitVec 64)) (|main::$tmp::tmp_if_expr_1| (_ BitVec 64)) (|main::1::1::i| (_ BitVec 64)) (|main::1::1::i_1| (_ BitVec 64)) (|main::1::L| (_ BitVec 64)) (|main::1::L_1| (_ BitVec 64)))
  (=> (and 
    (|inv_5| |main::$tmp::tmp_if_expr_1| |main::1::1::i_1| |main::1::L_1| |alloc_0| |memor_1|)
       (= |memor_0| (store |memor_1| (select |alloc_0| (_ bv6907487098696 64)) (store (select |memor_1| (select |alloc_0| (_ bv6907487098696 64))) |main::1::1::i_1| |main::$tmp::tmp_if_expr_1|)))
       (= |main::$tmp::tmp_if_expr_1| |main::$tmp::tmp_if_expr|)
       (= (bvadd |main::1::1::i_1| (_ bv1 64)) |main::1::1::i|)
       (= |main::1::L_1| |main::1::L|)) 
    (|inv_3| |main::$tmp::tmp_if_expr| |main::1::1::i| |main::1::L| |alloc_0| |memor_0|))))

(declare-fun |inv_1| ((_ BitVec 64) (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)) (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64))) ) Bool)

(assert (forall ((|memor_0| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|alloc_0| (Array (_ BitVec 64) (_ BitVec 64))) (|main::$tmp::tmp_if_expr| (_ BitVec 64)) (|main::1::1::i| (_ BitVec 64)) (|main::1::L| (_ BitVec 64)))
  (=> 
    (|inv_3| |main::$tmp::tmp_if_expr| |main::1::1::i| |main::1::L| |alloc_0| |memor_0|) 
    (|inv_1| |main::1::1::i| |main::1::L| |alloc_0| |memor_0|))))

(assert (forall ((|memor_0| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|alloc_0| (Array (_ BitVec 64) (_ BitVec 64))) (|main::1::1::i| (_ BitVec 64)) (|main::1::L| (_ BitVec 64)))
  (=> (and 
    (|inv_1| |main::1::1::i| |main::1::L| |alloc_0| |memor_0|)
       (not (not (bvuge |main::1::1::i| |main::1::L|)))) true)))

(check-sat)