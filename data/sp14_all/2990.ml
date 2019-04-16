
let rec sumList xs =
  if (List.length xs) > 0 then (List.hd xs) + (sumList List.tl xs) else 0;;


(* fix

let rec sumList xs =
  if (List.length xs) > 0 then (List.hd xs) + (sumList (List.tl xs)) else 0;;

*)

(* changed spans
(3,47)-(3,67)
sumList (List.tl xs)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(3,76)
(2,17)-(3,74)
(3,32)-(3,44)
(3,33)-(3,40)
(3,41)-(3,43)
(3,47)-(3,67)
(3,48)-(3,55)
(3,56)-(3,63)
*)
