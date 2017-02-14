
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
(5,18)-(5,25)
(5,29)-(5,61)
(5,32)-(5,47)
*)

(* type error slice
(4,22)-(4,33)
(4,22)-(4,36)
(4,34)-(4,36)
(4,41)-(4,52)
(4,41)-(4,55)
(4,53)-(4,55)
(5,3)-(5,61)
(5,18)-(5,20)
(5,18)-(5,25)
(5,18)-(5,25)
(5,18)-(5,25)
(5,23)-(5,25)
(5,29)-(5,61)
(5,29)-(5,61)
(5,29)-(5,61)
(5,53)-(5,61)
*)
