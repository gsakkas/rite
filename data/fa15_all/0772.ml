
let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else x :: ((clone x n) - 1);;


(* fix

let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

*)

(* changed spans
(3,48)-(3,49)
(@)
VarG

(3,48)-(3,49)
[x]
ListG VarG Nothing

(3,48)-(3,70)
[x] @ clone x (n - 1)
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(3,63)-(3,64)
n - 1
BopG VarG LitG

*)
