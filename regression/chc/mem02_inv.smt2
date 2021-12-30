; SMT 2
; Generated for Z3
(set-info :source "")
(set-option :produce-models true)

(declare-fun |inv_5| ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)) (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64))) ) Bool)

; find_symbols
(declare-fun |tmp| () (_ BitVec 64))
(assert (forall ((|memor_0| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|alloc_0| (Array (_ BitVec 64) (_ BitVec 64))) (|main::$tmp::return_value_nondet_int| (_ BitVec 32)) (|main::$tmp::return_value_nondet_int$0| (_ BitVec 32)) (|main::$tmp::return_value_nondet_int$1| (_ BitVec 32)) (|main::1::L| (_ BitVec 64)) (|main::1::i| (_ BitVec 64)) (|main::1::j| (_ BitVec 64)))
  (=> true 
    (|inv_5| |main::$tmp::return_value_nondet_int| |main::$tmp::return_value_nondet_int$0| |main::$tmp::return_value_nondet_int$1| |main::1::L| |main::1::i| |main::1::j| |alloc_0| |memor_0|))))

(declare-fun |inv_4| ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)) (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64))) ) Bool)

(assert (forall ((|memor_0| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|alloc_0| (Array (_ BitVec 64) (_ BitVec 64))) (|main::$tmp::return_value_nondet_int$0_2| (_ BitVec 32)) (|main::$tmp::return_value_nondet_int$0_3| (_ BitVec 32)) (|main::$tmp::return_value_nondet_int$1_1| (_ BitVec 32)) (|main::$tmp::return_value_nondet_int$1_2| (_ BitVec 32)) (|main::$tmp::return_value_nondet_int$1_3| (_ BitVec 32)) (|main::$tmp::return_value_nondet_int_3| (_ BitVec 32)) (|main::1::L| (_ BitVec 64)) (|main::1::L_1| (_ BitVec 64)) (|main::1::L_2| (_ BitVec 64)) (|main::1::L_3| (_ BitVec 64)) (|main::1::i| (_ BitVec 64)) (|main::1::i_1| (_ BitVec 64)) (|main::1::i_2| (_ BitVec 64)) (|main::1::i_3| (_ BitVec 64)) (|main::1::j| (_ BitVec 64)) (|main::1::j_1| (_ BitVec 64)) (|main::1::j_2| (_ BitVec 64)) (|main::1::j_3| (_ BitVec 64)))
  (=> (and 
    (|inv_5| |main::$tmp::return_value_nondet_int_3| |main::$tmp::return_value_nondet_int$0_3| |main::$tmp::return_value_nondet_int$1_3| |main::1::L_3| |main::1::i_3| |main::1::j_3| |alloc_0| |memor_0|)
       (= |main::$tmp::return_value_nondet_int$0_3| |main::$tmp::return_value_nondet_int$0_2|)
       (= |main::$tmp::return_value_nondet_int$1_3| |main::$tmp::return_value_nondet_int$1_2|)
       (= ((_ sign_extend 32) |main::$tmp::return_value_nondet_int_3|) |main::1::L_2|)
       (= |main::1::i_3| |main::1::i_2|)
       (= |main::1::j_3| |main::1::j_2|)
       (= |main::$tmp::return_value_nondet_int$1_2| |main::$tmp::return_value_nondet_int$1_1|)
       (= |main::1::L_2| |main::1::L_1|)
       (= ((_ sign_extend 32) |main::$tmp::return_value_nondet_int$0_2|) |main::1::i_1|)
       (= |main::1::j_2| |main::1::j_1|)
       (= |main::1::L_1| |main::1::L|)
       (= |main::1::i_1| |main::1::i|)
       (= ((_ sign_extend 32) |main::$tmp::return_value_nondet_int$1_1|) |main::1::j|)) 
    (|inv_4| |main::1::L| |main::1::i| |main::1::j| |alloc_0| |memor_0|))))

(assert (forall ((|memor_0| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|alloc_0| (Array (_ BitVec 64) (_ BitVec 64))) (|main::1::L| (_ BitVec 64)) (|main::1::i| (_ BitVec 64)) (|main::1::j| (_ BitVec 64)))
  (=> (and 
    (|inv_4| |main::1::L| |main::1::i| |main::1::j| |alloc_0| |memor_0|)
       (not (and (bvugt |main::1::L| (_ bv10 64))
       (not (= |main::1::i| |main::1::j|))))) true)))

(declare-fun |inv_3| ((_ BitVec 64) (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)) (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64))) ) Bool)

(assert (forall ((|memor_0| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|alloc_0| (Array (_ BitVec 64) (_ BitVec 64))) (|main::1::L| (_ BitVec 64)) (|main::1::i| (_ BitVec 64)) (|main::1::j| (_ BitVec 64)))
  (=> (and 
    (|inv_4| |main::1::L| |main::1::i| |main::1::j| |alloc_0| |memor_0|)
       (and (bvugt |main::1::L| (_ bv10 64))
       (not (= |main::1::i| |main::1::j|)))) 
    (|inv_3| |main::1::i| |main::1::j| |alloc_0| |memor_0|))))

(declare-fun |inv_2| ((_ BitVec 64) (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)) (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64))) ) Bool)

(assert (forall ((|memor_0| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|memor_1| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|memor_2| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|alloc_0| (Array (_ BitVec 64) (_ BitVec 64))) (|alloc_1| (Array (_ BitVec 64) (_ BitVec 64))) (|alloc_2| (Array (_ BitVec 64) (_ BitVec 64))) (|main::1::i| (_ BitVec 64)) (|main::1::j| (_ BitVec 64)))
  (=> (and 
    (|inv_3| |main::1::i| |main::1::j| |alloc_2| |memor_2|)
       (= |memor_0| (store |memor_1| (select |alloc_0| (_ bv6053561456450 64)) (store (select |memor_1| (select |alloc_0| (_ bv6053561456450 64))) |main::1::j| (_ bv2 64))))
       (= |alloc_0| (store |alloc_1| (_ bv6053561456450 64) (select |alloc_1| (_ bv9363835545496 64))))
       (= |memor_1| (store |memor_2| (select |alloc_1| (_ bv9363835545496 64)) (store (select |memor_2| (select |alloc_1| (_ bv9363835545496 64))) |main::1::i| (_ bv1 64))))
       (= |alloc_1| (store |alloc_2| (_ bv9363835545496 64) (_ bv9363835545496 64)))) 
    (|inv_2| |main::1::i| |main::1::j| |alloc_0| |memor_0|))))

(assert (forall ((|memor_0| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|alloc_0| (Array (_ BitVec 64) (_ BitVec 64))) (|main::1::i| (_ BitVec 64)) (|main::1::j| (_ BitVec 64)))
  (=> (and 
    (|inv_2| |main::1::i| |main::1::j| |alloc_0| |memor_0|)
       (not (bvslt (select (select |memor_0| (select |alloc_0| (_ bv6053561456450 64))) |main::1::i|) (select (select |memor_0| (select |alloc_0| (_ bv6053561456450 64))) |main::1::j|)))) false)))

(declare-fun |inv_1| ((Array (_ BitVec 64) (_ BitVec 64)) (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64))) ) Bool)

(assert (forall ((|memor_0| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|alloc_0| (Array (_ BitVec 64) (_ BitVec 64))) (|main::1::i| (_ BitVec 64)) (|main::1::j| (_ BitVec 64)))
  (=> (and 
    (|inv_2| |main::1::i| |main::1::j| |alloc_0| |memor_0|)
       (bvslt (select (select |memor_0| (select |alloc_0| (_ bv6053561456450 64))) |main::1::i|) (select (select |memor_0| (select |alloc_0| (_ bv6053561456450 64))) |main::1::j|))) 
    (|inv_1| |alloc_0| |memor_0|))))

(assert (forall ((|memor_0| (Array (_ BitVec 64) (Array (_ BitVec 64) (_ BitVec 64)))) (|alloc_0| (Array (_ BitVec 64) (_ BitVec 64))))
  (=> 
    (|inv_1| |alloc_0| |memor_0|) true)))

(check-sat)