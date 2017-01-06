
let _ = let rec sumList xs = match xs with | [] -> 0 | h::t -> h + t in xs;;



let rec sumList xs = match xs with | [] -> 0;;


(* changed spans
(2,5)-(2,12)
(2,54)-(2,75)
*)

(* type error slice
*)
