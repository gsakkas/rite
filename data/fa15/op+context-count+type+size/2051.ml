
let rec clone x n =
  match n <= 0 with | true  -> [] | false  -> x :: ((clone x n) - 1);;


(* fix

let rec clone x n =
  match n <= 0 with | true  -> [] | false  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,51)-(3,68)
(3,61)-(3,62)
*)

(* type error slice
(2,3)-(3,70)
(2,14)-(3,68)
(2,16)-(3,68)
(3,2)-(3,68)
(3,46)-(3,68)
(3,46)-(3,68)
(3,51)-(3,68)
(3,51)-(3,68)
(3,52)-(3,63)
(3,53)-(3,58)
*)
