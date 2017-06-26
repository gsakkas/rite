
let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  let retTuple = (l1, l2) in
  if difference1 > 0 then (l1, l2) else if difference2 > 0 then (l1, l2);;


(* fix

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  let retTuple = (l1, l2) in
  if difference1 > 0
  then (l1, l2)
  else if difference2 > 0 then (l1, l2) else (l1, l2);;

*)

(* changed spans
(6,40)-(6,72)
*)

(* type error slice
(6,40)-(6,72)
(6,64)-(6,72)
*)

(* all spans
(2,12)-(6,72)
(2,15)-(6,72)
(3,2)-(6,72)
(3,20)-(3,55)
(3,20)-(3,36)
(3,21)-(3,32)
(3,33)-(3,35)
(3,39)-(3,55)
(3,40)-(3,51)
(3,52)-(3,54)
(4,2)-(6,72)
(4,20)-(4,55)
(4,20)-(4,36)
(4,21)-(4,32)
(4,33)-(4,35)
(4,39)-(4,55)
(4,40)-(4,51)
(4,52)-(4,54)
(5,2)-(6,72)
(5,17)-(5,25)
(5,18)-(5,20)
(5,22)-(5,24)
(6,2)-(6,72)
(6,5)-(6,20)
(6,5)-(6,16)
(6,19)-(6,20)
(6,26)-(6,34)
(6,27)-(6,29)
(6,31)-(6,33)
(6,40)-(6,72)
(6,43)-(6,58)
(6,43)-(6,54)
(6,57)-(6,58)
(6,64)-(6,72)
(6,65)-(6,67)
(6,69)-(6,71)
*)
