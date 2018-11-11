
let rec sumList xs = match xs with | [] -> 0 | (x::y)::[] -> x + (sumList y);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::y -> x + (sumList y);;

*)

(* changed spans
(2,21)-(2,76)
match xs with
| [] -> 0
| x :: y -> x + sumList y
CaseG VarG [(Nothing,LitG),(Nothing,BopG EmptyG EmptyG)]

*)
