
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse l) :: h;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse l) @ [h];;

*)

(* changed spans
(3,36)-(3,51)
(@)
VarG

(3,36)-(3,56)
listReverse l @ [h]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(3,55)-(3,56)
[h]
ListG VarG Nothing

*)
