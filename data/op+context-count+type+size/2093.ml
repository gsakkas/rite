
let rec sumList xs =
  if (List.length xs) > 0 then (List.hd xs) + (sumList List.tl xs) else 0;;


(* fix

let rec sumList xs =
  if (List.length xs) > 0 then (List.hd xs) + (sumList (List.tl xs)) else 0;;

*)

(* changed spans
(3,48)-(3,66)
(3,56)-(3,63)
*)

(* type error slice
(2,4)-(3,76)
(2,17)-(3,74)
(3,3)-(3,74)
(3,7)-(3,18)
(3,7)-(3,21)
(3,19)-(3,21)
(3,33)-(3,66)
(3,48)-(3,55)
(3,48)-(3,66)
(3,56)-(3,63)
(3,64)-(3,66)
*)
