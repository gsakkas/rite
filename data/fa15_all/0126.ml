
let rec listReverse l =
  match l with | [] -> [] | t -> t | h::t -> t :: (listReverse [h]);;


(* fix

let rec listReverse l = match l with | [] -> [] | h::t -> [h];;

*)

(* changed spans
(3,3)-(3,68)
match l with
| [] -> []
| h :: t -> [h]
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,ListG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])

*)

(* type error slice
(3,3)-(3,68)
(3,34)-(3,35)
(3,46)-(3,47)
(3,46)-(3,68)
*)
