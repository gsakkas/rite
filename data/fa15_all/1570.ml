
let rec listReverse l =
  match l with | [] -> [] | hd::tail -> (listReverse tail) :: hd;;


(* fix

let rec listReverse l =
  match l with | [] -> l | hd::tail -> (listReverse tail) @ [hd];;

*)

(* changed spans
(3,40)-(3,58)
(@)
VarG

(3,40)-(3,58)
listReverse tail @ [hd]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(3,40)-(3,64)
l
VarG

(3,62)-(3,64)
[hd]
ListG VarG Nothing

*)
