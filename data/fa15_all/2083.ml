
let rec sumList xs =
  match xs with | [] -> 0 | h -> h | h::t -> h + (sumList t);;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | h::_ -> h | h::t -> h + (sumList t);;

*)

(* changed spans
(3,3)-(3,61)
match xs with
| [] -> 0
| h :: _ -> h
| h :: t -> h + sumList t
CaseG (fromList [(ConsPatG VarPatG VarPatG,Nothing,BopG EmptyG EmptyG),(ConsPatG VarPatG WildPatG,Nothing,VarG),(ConPatG Nothing,Nothing,LitG)])

*)

(* type error slice
(3,3)-(3,61)
(3,25)-(3,26)
(3,34)-(3,35)
*)
