
let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ ((clone x n) - 1);;


(* fix

let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

*)

(* changed spans
(3,55)-(3,72)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* type error slice
(2,4)-(3,74)
(2,15)-(3,72)
(2,17)-(3,72)
(3,3)-(3,72)
(3,26)-(3,72)
(3,49)-(3,72)
(3,53)-(3,54)
(3,55)-(3,72)
(3,56)-(3,67)
(3,57)-(3,62)
*)
