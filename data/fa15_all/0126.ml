
let rec listReverse l =
  match l with | [] -> [] | t -> t | h::t -> t :: (listReverse [h]);;


(* fix

let rec listReverse l = match l with | [] -> [] | h::t -> [h];;

*)

(* changed spans
(3,2)-(3,67)
match l with
| [] -> []
| h :: t -> [h]
CaseG VarG (fromList [(Nothing,ListG EmptyG Nothing)])

*)
