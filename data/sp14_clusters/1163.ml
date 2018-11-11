
let rec listReverse l =
  match l with | [] -> [] | a::b -> (listReverse b) :: a;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | a::b -> (listReverse b) @ [a];;

*)

(* changed spans
(3,36)-(3,51)
(@)
VarG

(3,36)-(3,56)
listReverse b @ [a]
AppG [AppG [EmptyG],ListG EmptyG Nothing]

(3,55)-(3,56)
[a]
ListG VarG Nothing

*)
