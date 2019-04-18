
let rec clone x n =
  match n = 0 with | true  -> x | false  -> x @ ((clone x n) - 1);;


(* fix

let rec clone x n =
  match n = 0 with | true  -> [] | false  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,31)-(3,32)
[]
ListG (fromList [])

(3,45)-(3,66)
x :: (clone x (n - 1))
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(3,68)
(2,15)-(3,66)
(2,17)-(3,66)
(3,3)-(3,66)
(3,31)-(3,32)
(3,45)-(3,46)
(3,45)-(3,66)
(3,47)-(3,48)
(3,49)-(3,66)
(3,50)-(3,61)
(3,51)-(3,56)
*)
