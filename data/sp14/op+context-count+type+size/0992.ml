
let rec clone x n = match n with | 0 -> [] | _ -> x :: ((clone n) - 1);;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(2,58)-(2,65)
(2,58)-(2,70)
(2,64)-(2,65)
*)

(* type error slice
(2,4)-(2,73)
(2,15)-(2,70)
(2,17)-(2,70)
(2,51)-(2,70)
(2,58)-(2,63)
(2,58)-(2,65)
(2,58)-(2,70)
(2,58)-(2,70)
*)
