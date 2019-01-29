
let rec sumList xs = match xs with | [] -> 0 | h::t -> h + sumList;;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,59)-(2,66)
sumList t
AppG (fromList [VarG])

*)
