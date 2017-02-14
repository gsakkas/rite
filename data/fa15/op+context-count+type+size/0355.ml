
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
(5,2)-(5,34)
(5,2)-(5,34)
(5,26)-(5,34)
*)
