
let rec listReverse l = match l with | [] -> [] | h::t -> [listReverse t; h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(2,58)-(2,76)
listReverse t @ [h]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(2,59)-(2,72)
(@)
VarG

(2,74)-(2,75)
[h]
ListG VarG Nothing

*)
