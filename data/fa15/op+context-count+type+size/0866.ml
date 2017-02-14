
let bigMul l1 l2 =
  let f a x =
    let (val1,val2) = x in
    let (lastCarry,lastTupleMult) = a in
    let tupleMult = (val1 * val2) + lastCarry in
    let newCarry = tupleMult / 10 in
    let nextDigit = tupleMult mod 10 in
    (newCarry, (nextDigit :: lastTupleMult)) in
  let base = (1, []) in
  let args = List.rev ((List.combine 0) :: (l1 0) :: l2) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let bigMul l1 l2 =
  let f a x =
    let (val1,val2) = x in
    let (lastCarry,lastTupleMult) = a in
    let tupleMult = (val1 * val2) + lastCarry in
    let newCarry = tupleMult / 10 in
    let nextDigit = tupleMult mod 10 in
    (newCarry, (nextDigit :: lastTupleMult)) in
  let base = (1, []) in
  let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(11,25)-(11,39)
(11,25)-(11,56)
(11,38)-(11,39)
(11,45)-(11,49)
(11,48)-(11,49)
*)

(* type error slice
(11,25)-(11,37)
(11,25)-(11,39)
(11,38)-(11,39)
*)
