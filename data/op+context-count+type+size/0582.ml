
let rec clone x n =
  match n = 0 with | true  -> [] | false  -> x :: ((clone x n) - 1);;



let rec clone x n =
  match n = 0 with | true  -> [] | false  -> x :: (clone x (n - 1));;


(* changed spans
(3,52)-(3,53)
(3,62)-(3,63)
*)

(* type error slice
(3,46)-(3,67)
*)
