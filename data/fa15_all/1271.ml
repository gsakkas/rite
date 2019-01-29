
let rec sumList xs =
  match xs with | [] -> [] | head::tail -> head + (sumList tail);;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

*)

(* changed spans
(3,24)-(3,26)
0
LitG

*)
