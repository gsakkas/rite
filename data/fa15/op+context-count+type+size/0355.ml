
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
(5,3)-(5,34)
(5,6)-(5,17)
(5,6)-(5,21)
(5,20)-(5,21)
*)

(* type error slice
(5,3)-(5,34)
(5,3)-(5,34)
(5,3)-(5,34)
(5,28)-(5,34)
*)
