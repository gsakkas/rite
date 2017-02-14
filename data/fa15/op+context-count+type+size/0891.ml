
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
(6,24)-(6,73)
(6,35)-(6,43)
(6,47)-(6,61)
(6,47)-(6,73)
(6,62)-(6,63)
(6,64)-(6,68)
(6,69)-(6,73)
*)

(* type error slice
(6,24)-(6,73)
(6,35)-(6,43)
(6,47)-(6,61)
(6,47)-(6,73)
(6,69)-(6,73)
*)
