
let rec listReverse l =
  match l with | [] -> [] | a::b -> b :: (listReverse a);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | a::b -> (listReverse b) @ [a];;

*)

(* changed spans
(3,36)-(3,37)
listReverse b @ [a]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(3,41)-(3,56)
(@)
VarG

(3,54)-(3,55)
b
VarG

(3,54)-(3,55)
[a]
ListG VarG Nothing

*)
