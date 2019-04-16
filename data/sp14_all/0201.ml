
let rec sumList xs =
  match xs with | [] -> [] | h1::h2::t -> h1 + (h2 sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

*)

(* changed spans
(3,3)-(3,62)
match xs with
| [] -> 0
| x :: xs' -> x + sumList xs'
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,BopG EmptyG EmptyG),(ConPatG Nothing,Nothing,LitG)])

*)

(* type error slice
(3,3)-(3,62)
(3,25)-(3,27)
(3,43)-(3,62)
(3,48)-(3,62)
(3,49)-(3,51)
(3,60)-(3,61)
*)
