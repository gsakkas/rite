
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> (listReverse tl) :: hd;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> (listReverse tl) @ [hd];;

*)

(* changed spans
(3,38)-(3,54)
(@)
VarG

(3,38)-(3,60)
listReverse tl @ [hd]
AppG [AppG [EmptyG],ListG EmptyG Nothing]

(3,58)-(3,60)
[hd]
ListG VarG Nothing

*)
