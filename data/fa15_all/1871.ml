
let rec listReverse l =
  match l with | [] -> [] | x::y -> (listReverse y) :: x;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | x::y -> (listReverse y) @ [x];;

*)

(* changed spans
(3,36)-(3,51)
(@)
VarG

(3,36)-(3,56)
listReverse y @ [x]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(3,55)-(3,56)
[x]
ListG VarG Nothing

*)
