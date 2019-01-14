
let rec listReverse l =
  match l with | [] -> [] | h::t -> let r = listReverse t in r :: h;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> let r = listReverse t in r @ [h];;

*)

(* changed spans
(3,61)-(3,62)
(@)
VarG

(3,61)-(3,67)
r @ [h]
AppG (fromList [VarG,ListG EmptyG Nothing])

(3,66)-(3,67)
[h]
ListG VarG Nothing

*)
