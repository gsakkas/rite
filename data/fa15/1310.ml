
let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  let retTuple = (l1, l2) in if difference1 > 0 then retTuple;;


(* fix

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  let retTuple = (l1, l2) in retTuple;;

*)

(* changed spans
(5,30)-(5,62)
retTuple
VarG

*)

(* type error slice
(5,3)-(5,62)
(5,18)-(5,26)
(5,30)-(5,62)
(5,54)-(5,62)
(5,62)-(5,62)
*)
