
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) :: l;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [];;

*)

(* changed spans
(3,36)-(3,51)
(@)
VarG

(3,36)-(3,56)
listReverse t @ []
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(3,55)-(3,56)
[]
ListG EmptyG Nothing

*)
