
let rec sumList xs = match xs with | [] -> 0 | x::y -> x + sumList;;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::y -> x + (sumList y);;

*)

(* changed spans
(2,59)-(2,66)
sumList y
AppG (fromList [VarG])

*)
