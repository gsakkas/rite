
let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList List.tl xs);;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

*)

(* changed spans
(3,50)-(3,70)
sumList (List.tl xs)
AppG [AppG [EmptyG]]

*)

(* type error slice
(2,4)-(3,72)
(2,17)-(3,70)
(3,3)-(3,70)
(3,9)-(3,11)
(3,50)-(3,70)
(3,51)-(3,58)
(3,59)-(3,66)
*)
