
let rec clone x n =
  match n = 0 with | true  -> [] | false  -> x @ ((clone x n) - 1);;



let rec clone x n =
  match n = 0 with | true  -> [] | false  -> x :: (clone x (n - 1));;


(* changed spans
(3,48)-(3,51)
(3,61)-(3,62)
*)

(* type error slice
(3,46)-(3,66)
*)
