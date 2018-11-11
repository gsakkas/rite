
let rec sumList xs =
  match xs with | [] -> 0 | f::b -> f + (sumList List.tl xs);;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | f::b -> f + (sumList (List.tl xs));;

*)

(* changed spans
(3,40)-(3,60)
sumList (List.tl xs)
AppG [AppG [EmptyG]]

(3,49)-(3,56)
List.tl xs
AppG [VarG]

*)
