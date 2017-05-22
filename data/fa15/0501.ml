
let rec mulByDigit i l =
  let f a x =
    let (carry,acc) = a in
    let res = (x * i) + carry in ((res / 10), ((res mod 10) :: acc)) in
  let base = (0, []) in let args = List.rev in List.fold_left f base args;;


(* fix

let rec mulByDigit i l =
  let f a x =
    let (carry,acc) = a in
    let res = (x * i) + carry in ((res / 10), ((res mod 10) :: acc)) in
  let base = (0, []) in
  let args = List.rev (0 :: l) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(6,35)-(6,43)
(6,47)-(6,73)
*)

(* type error slice
(6,24)-(6,73)
(6,35)-(6,43)
(6,47)-(6,61)
(6,47)-(6,73)
(6,69)-(6,73)
*)

(* all spans
(2,19)-(6,73)
(2,21)-(6,73)
(3,2)-(6,73)
(3,8)-(5,68)
(3,10)-(5,68)
(4,4)-(5,68)
(4,22)-(4,23)
(5,4)-(5,68)
(5,14)-(5,29)
(5,14)-(5,21)
(5,15)-(5,16)
(5,19)-(5,20)
(5,24)-(5,29)
(5,33)-(5,68)
(5,34)-(5,44)
(5,35)-(5,38)
(5,41)-(5,43)
(5,46)-(5,67)
(5,47)-(5,59)
(5,48)-(5,51)
(5,56)-(5,58)
(5,63)-(5,66)
(6,2)-(6,73)
(6,13)-(6,20)
(6,14)-(6,15)
(6,17)-(6,19)
(6,24)-(6,73)
(6,35)-(6,43)
(6,47)-(6,73)
(6,47)-(6,61)
(6,62)-(6,63)
(6,64)-(6,68)
(6,69)-(6,73)
*)
