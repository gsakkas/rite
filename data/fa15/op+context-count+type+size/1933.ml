
let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: ((clone x n) - 1);;


(* fix

let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: (clone x (n - 1));;

*)

(* changed spans
(3,52)-(3,69)
(3,62)-(3,63)
*)

(* type error slice
(2,3)-(3,71)
(2,14)-(3,69)
(2,16)-(3,69)
(3,2)-(3,69)
(3,24)-(3,69)
(3,38)-(3,41)
(3,47)-(3,69)
(3,52)-(3,69)
(3,52)-(3,69)
(3,53)-(3,64)
(3,54)-(3,59)
*)
