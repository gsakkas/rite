
let rec sumList xs = match 1 with | [] -> 0 | x::xs' -> x + (sumList xs');;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

*)

(* changed spans
(2,28)-(2,29)
xs
VarG

*)

(* type error slice
(2,22)-(2,74)
(2,28)-(2,29)
*)
