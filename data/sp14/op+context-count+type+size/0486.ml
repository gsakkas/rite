
let rec clone x n =
  match n = 0 with | true  -> [] | false  -> x :: ((clone x n) - 1);;


(* fix

let rec clone x n =
  match n = 0 with | true  -> [] | false  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,50)-(3,67)
(3,60)-(3,61)
*)

(* type error slice
(2,3)-(3,69)
(2,14)-(3,67)
(2,16)-(3,67)
(3,2)-(3,67)
(3,45)-(3,67)
(3,45)-(3,67)
(3,50)-(3,67)
(3,50)-(3,67)
(3,51)-(3,62)
(3,52)-(3,57)
*)
