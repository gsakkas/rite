
let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  let retTuple = l1 * l2 in if difference1 > 0 then retTuple;;


(* fix

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  let retTuple = (l1, l2) in retTuple;;

*)

(* changed spans
(5,17)-(5,24)
(5,28)-(5,60)
(5,31)-(5,46)
*)

(* type error slice
(4,20)-(4,36)
(4,21)-(4,32)
(4,33)-(4,35)
(4,39)-(4,55)
(4,40)-(4,51)
(4,52)-(4,54)
(5,2)-(5,60)
(5,17)-(5,19)
(5,17)-(5,24)
(5,17)-(5,24)
(5,17)-(5,24)
(5,22)-(5,24)
(5,28)-(5,60)
(5,28)-(5,60)
(5,28)-(5,60)
(5,52)-(5,60)
*)
