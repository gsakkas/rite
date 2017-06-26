
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
(5,29)-(5,61)
(5,32)-(5,43)
(5,32)-(5,47)
(5,46)-(5,47)
*)

(* type error slice
(5,2)-(5,61)
(5,17)-(5,25)
(5,29)-(5,61)
(5,53)-(5,61)
*)

(* all spans
(2,12)-(5,61)
(2,15)-(5,61)
(3,2)-(5,61)
(3,20)-(3,55)
(3,20)-(3,36)
(3,21)-(3,32)
(3,33)-(3,35)
(3,39)-(3,55)
(3,40)-(3,51)
(3,52)-(3,54)
(4,2)-(5,61)
(4,20)-(4,55)
(4,20)-(4,36)
(4,21)-(4,32)
(4,33)-(4,35)
(4,39)-(4,55)
(4,40)-(4,51)
(4,52)-(4,54)
(5,2)-(5,61)
(5,17)-(5,25)
(5,18)-(5,20)
(5,22)-(5,24)
(5,29)-(5,61)
(5,32)-(5,47)
(5,32)-(5,43)
(5,46)-(5,47)
(5,53)-(5,61)
*)
