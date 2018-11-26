
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> [listReverse tl; hd];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> (listReverse tl) @ [hd];;

*)

(* changed spans
(3,38)-(3,58)
listReverse tl @ [hd]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(3,39)-(3,53)
(@)
VarG

(3,55)-(3,57)
[hd]
ListG VarG Nothing

*)
