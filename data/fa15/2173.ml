
let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: ((clone x n) - 1);;


(* fix

let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: (clone x (n - 1));;

*)

(* changed spans
(3,53)-(3,70)
clone x (n - 1)
AppG [VarG,BopG EmptyG EmptyG]

*)

(* type error slice
(2,4)-(3,72)
(2,15)-(3,70)
(2,17)-(3,70)
(3,3)-(3,70)
(3,25)-(3,70)
(3,48)-(3,70)
(3,53)-(3,70)
(3,54)-(3,65)
(3,55)-(3,60)
*)
