
let rec listReverse l =
  match l with | [] -> [] | x::l' -> [listReverse l'; x];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | x::l' -> (listReverse l') @ [x];;

*)

(* changed spans
(3,37)-(3,56)
listReverse l' @ [x]
AppG [AppG [EmptyG],ListG EmptyG Nothing]

(3,38)-(3,52)
(@)
VarG

(3,54)-(3,55)
[x]
ListG VarG Nothing

*)
