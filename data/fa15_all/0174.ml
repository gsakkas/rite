
let rec listReverse l =
  match l with | [] -> [] | h::tl -> (listReverse l) :: h;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::tl -> (listReverse tl) @ [h];;

*)

(* changed spans
(3,37)-(3,52)
(@)
VarG

(3,37)-(3,57)
listReverse tl @ [h]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(3,50)-(3,51)
tl
VarG

(3,56)-(3,57)
[h]
ListG VarG Nothing

*)
