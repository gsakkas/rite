
let rec clone x n = match n with | 0 -> [] | _ -> x :: ((clone x n) - 1);;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(2,58)-(2,72)
(2,66)-(2,67)
*)

(* type error slice
(2,4)-(2,75)
(2,15)-(2,72)
(2,17)-(2,72)
(2,21)-(2,72)
(2,51)-(2,72)
(2,51)-(2,72)
(2,58)-(2,63)
(2,58)-(2,67)
(2,58)-(2,72)
(2,58)-(2,72)
*)
