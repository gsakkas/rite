
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let d = (List.length l1) - (List.length l2) in
  if d < 0 then ((clone 0 (0 - d)) @ l1) * l2 else (l1 * (clone 0 d)) @ l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let d = (List.length l1) - (List.length l2) in
  if d < 0 then (((clone 0 (0 - d)) @ l1), l2) else (l1, ((clone 0 d) @ l2));;

*)

(* changed spans
(6,17)-(6,46)
(clone 0 (0 - d) @ l1 , l2)
TupleG [AppG [EmptyG,EmptyG],VarG]

(6,52)-(6,75)
(l1 , clone 0 d @ l2)
TupleG [VarG,AppG [EmptyG,EmptyG]]

*)

(* type error slice
(2,44)-(2,66)
(2,49)-(2,66)
(2,50)-(2,55)
(5,30)-(5,46)
(5,31)-(5,42)
(5,43)-(5,45)
(6,17)-(6,41)
(6,17)-(6,46)
(6,36)-(6,37)
(6,38)-(6,40)
(6,44)-(6,46)
(6,52)-(6,70)
(6,52)-(6,75)
(6,53)-(6,55)
(6,58)-(6,69)
(6,59)-(6,64)
(6,71)-(6,72)
*)
