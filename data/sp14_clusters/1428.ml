
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) :: h;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(3,36)-(3,51)
(@)
VarG

(3,36)-(3,56)
listReverse t @ [h]
AppG [AppG [EmptyG],ListG EmptyG Nothing]

(3,55)-(3,56)
[h]
ListG VarG Nothing

*)
