
let rec clone x n =
  match n = 0 with | true  -> x | false  -> x @ ((clone x n) - 1);;



let rec clone x n =
  match n = 0 with | true  -> [] | false  -> x :: (clone x (n - 1));;


(* changed spans
(3,31)-(3,32)
(3,47)-(3,50)
(3,60)-(3,61)
*)

(* type error slice
(3,45)-(3,65)
*)
