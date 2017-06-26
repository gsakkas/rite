
let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  if difference1 > 0 then (l1, l2);;


(* fix

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  let retTuple = (l1, l2) in retTuple;;

*)

(* changed spans
(5,2)-(5,34)
(5,5)-(5,16)
(5,5)-(5,20)
(5,19)-(5,20)
*)

(* type error slice
(5,2)-(5,34)
(5,26)-(5,34)
*)

(* all spans
(2,12)-(5,34)
(2,15)-(5,34)
(3,2)-(5,34)
(3,20)-(3,55)
(3,20)-(3,36)
(3,21)-(3,32)
(3,33)-(3,35)
(3,39)-(3,55)
(3,40)-(3,51)
(3,52)-(3,54)
(4,2)-(5,34)
(4,20)-(4,55)
(4,20)-(4,36)
(4,21)-(4,32)
(4,33)-(4,35)
(4,39)-(4,55)
(4,40)-(4,51)
(4,52)-(4,54)
(5,2)-(5,34)
(5,5)-(5,20)
(5,5)-(5,16)
(5,19)-(5,20)
(5,26)-(5,34)
(5,27)-(5,29)
(5,31)-(5,33)
*)
