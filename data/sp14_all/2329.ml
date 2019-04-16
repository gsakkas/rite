
let rec clone x n =
  let accum = [] in if n < 1 then [] else (clone x) :: ((accum n) - 1);;


(* fix

let rec clone x n = let accum = [] in if n < 1 then [] else clone x n;;

*)

(* changed spans
(3,43)-(3,71)
clone x n
AppG (fromList [VarG])

*)

(* type error slice
(2,4)-(3,73)
(2,15)-(3,71)
(2,17)-(3,71)
(3,3)-(3,71)
(3,15)-(3,17)
(3,21)-(3,71)
(3,43)-(3,52)
(3,43)-(3,71)
(3,44)-(3,49)
(3,56)-(3,71)
(3,57)-(3,66)
(3,58)-(3,63)
*)
