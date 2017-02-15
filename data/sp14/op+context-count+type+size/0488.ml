
let rec clone x n =
  match n = 0 with | true  -> [] | false  -> x @ ((clone x n) - 1);;


(* fix

let rec clone x n =
  match n = 0 with | true  -> [] | false  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,45)-(3,66)
(3,47)-(3,48)
(3,49)-(3,66)
(3,59)-(3,60)
*)

(* type error slice
(2,3)-(3,68)
(2,14)-(3,66)
(2,16)-(3,66)
(3,2)-(3,66)
(3,30)-(3,32)
(3,45)-(3,66)
(3,47)-(3,48)
(3,49)-(3,66)
(3,49)-(3,66)
(3,50)-(3,61)
(3,51)-(3,56)
*)
