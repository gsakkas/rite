
let rec sumList xs =
  match xs with | [] -> 0 | f::b -> f + (sumList List.tl xs);;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | f::b -> f + (sumList (List.tl xs));;

*)

(* changed spans
(3,41)-(3,61)
sumList (List.tl xs)
AppG [AppG [EmptyG]]

*)

(* type error slice
(2,4)-(3,63)
(2,17)-(3,61)
(3,3)-(3,61)
(3,9)-(3,11)
(3,41)-(3,61)
(3,42)-(3,49)
(3,50)-(3,57)
*)
