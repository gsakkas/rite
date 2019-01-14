
let rec sumList xs =
  match xs with | [] -> 0 | h -> h | h::t -> h + (sumList t);;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | h::_ -> h | h::t -> h + (sumList t);;

*)

(* changed spans
(3,2)-(3,60)
match xs with
| [] -> 0
| h :: _ -> h
| h :: t -> h + sumList t
CaseG VarG (fromList [(Nothing,VarG),(Nothing,BopG EmptyG EmptyG),(Nothing,LitG)])

*)
