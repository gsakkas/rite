
let rec sumList xs =
  match xs with | [] -> [] | h1::h2::t -> h1 + (h2 sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

*)

(* changed spans
(3,2)-(3,61)
match xs with
| [] -> 0
| x :: xs' -> x + sumList xs'
CaseG VarG [(Nothing,LitG),(Nothing,BopG EmptyG EmptyG)]

(3,24)-(3,26)
0
LitG

(3,48)-(3,50)
x
VarG

(3,51)-(3,58)
sumList xs'
AppG [VarG]

(3,59)-(3,60)
xs'
VarG

*)
