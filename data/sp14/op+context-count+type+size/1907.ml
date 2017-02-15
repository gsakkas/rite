
let rec sumList xs =
  if (List.length xs) > 0 then (List.hd xs) + (sumList List.tl xs) else 0;;


(* fix

let rec sumList xs =
  if (List.length xs) > 0 then (List.hd xs) + (sumList (List.tl xs)) else 0;;

*)

(* changed spans
(3,46)-(3,66)
(3,55)-(3,62)
*)

(* type error slice
(2,3)-(3,75)
(2,16)-(3,73)
(3,31)-(3,43)
(3,32)-(3,39)
(3,40)-(3,42)
(3,46)-(3,66)
(3,47)-(3,54)
(3,55)-(3,62)
*)
