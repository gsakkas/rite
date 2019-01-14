
let rec listReverse l = match l with | [] -> [] | h::t -> [h; listReverse t];;


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

*)
