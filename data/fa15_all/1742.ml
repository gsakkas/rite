
let rec listReverse l =
  match l with | [] -> [] | h::t -> t :: (listReverse h);;


(* fix

let rec listReverse l = match l with | [] -> [] | h::t -> t @ [h];;

*)

(* changed spans
(3,36)-(3,37)
(@)
VarG

(3,36)-(3,56)
t @ [h]
AppG (fromList [VarG,ListG EmptyG Nothing])

(3,42)-(3,53)
[h]
ListG VarG Nothing

*)
