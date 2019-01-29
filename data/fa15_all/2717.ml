
let rec listReverse l = match l with | [] -> [] | h::t -> [t; listReverse h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(2,59)-(2,60)
listReverse t @ [h]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(2,62)-(2,75)
(@)
VarG

(2,74)-(2,75)
t
VarG

(2,74)-(2,75)
[h]
ListG VarG Nothing

*)
