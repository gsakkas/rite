
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
(11,22)-(11,56)
(11,23)-(11,39)
(11,37)-(11,38)
(11,43)-(11,49)
(11,47)-(11,48)
*)

(* type error slice
(11,23)-(11,39)
(11,24)-(11,36)
(11,37)-(11,38)
*)

(* all spans
(2,11)-(12,49)
(2,14)-(12,49)
(3,2)-(12,49)
(3,8)-(9,44)
(3,10)-(9,44)
(4,4)-(9,44)
(4,22)-(4,23)
(5,4)-(9,44)
(5,36)-(5,37)
(6,4)-(9,44)
(6,20)-(6,45)
(6,20)-(6,33)
(6,21)-(6,25)
(6,28)-(6,32)
(6,36)-(6,45)
(7,4)-(9,44)
(7,19)-(7,33)
(7,19)-(7,28)
(7,31)-(7,33)
(8,4)-(9,44)
(8,20)-(8,36)
(8,20)-(8,29)
(8,34)-(8,36)
(9,4)-(9,44)
(9,5)-(9,13)
(9,15)-(9,43)
(9,16)-(9,25)
(9,29)-(9,42)
(10,2)-(12,49)
(10,13)-(10,20)
(10,14)-(10,15)
(10,17)-(10,19)
(11,2)-(12,49)
(11,13)-(11,56)
(11,13)-(11,21)
(11,22)-(11,56)
(11,23)-(11,39)
(11,24)-(11,36)
(11,37)-(11,38)
(11,43)-(11,55)
(11,43)-(11,49)
(11,44)-(11,46)
(11,47)-(11,48)
(11,53)-(11,55)
(12,2)-(12,49)
(12,16)-(12,42)
(12,16)-(12,30)
(12,31)-(12,32)
(12,33)-(12,37)
(12,38)-(12,42)
(12,46)-(12,49)
*)
