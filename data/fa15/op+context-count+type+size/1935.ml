
let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: ((clone x n) - 1);;


(* fix

let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: (clone x (n - 1));;

*)

(* changed spans
(3,55)-(3,69)
(3,63)-(3,64)
*)

(* type error slice
(2,4)-(3,72)
(2,15)-(3,69)
(2,17)-(3,69)
(3,3)-(3,69)
(3,25)-(3,69)
(3,39)-(3,42)
(3,48)-(3,69)
(3,55)-(3,60)
(3,55)-(3,64)
(3,55)-(3,69)
(3,55)-(3,69)
*)
