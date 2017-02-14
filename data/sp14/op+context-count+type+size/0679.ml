
let rec clone x n =
  let accum = [] in if n < 1 then [] else (clone x) :: (accum (n - 1));;


(* fix

let rec clone x n =
  let accum = [] in
  let helper x n = if n < 1 then accum else x :: accum in helper x (n - 1);;

*)

(* changed spans
(3,21)-(3,69)
(3,35)-(3,37)
(3,44)-(3,49)
(3,44)-(3,51)
(3,57)-(3,69)
(3,64)-(3,65)
(3,64)-(3,69)
(3,68)-(3,69)
*)

(* type error slice
(2,4)-(3,73)
(2,15)-(3,69)
(2,17)-(3,69)
(3,3)-(3,69)
(3,3)-(3,69)
(3,15)-(3,17)
(3,21)-(3,69)
(3,44)-(3,49)
(3,44)-(3,51)
(3,44)-(3,69)
(3,44)-(3,69)
(3,57)-(3,62)
(3,57)-(3,69)
*)
