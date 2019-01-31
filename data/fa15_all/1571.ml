
let rec listReverse l =
  match l with | [] -> l | hd::tail -> (listReverse tail) :: hd;;


(* fix

let rec listReverse l =
  match l with | [] -> l | hd::tail -> (listReverse tail) @ [hd];;

*)

(* changed spans
(3,39)-(3,57)
(@)
VarG

(3,39)-(3,63)
listReverse tail @ [hd]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(3,61)-(3,63)
[hd]
ListG VarG Nothing

*)
