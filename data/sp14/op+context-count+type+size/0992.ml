
let rec clone x n = match n with | 0 -> [] | _ -> x :: ((clone n) - 1);;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(2,55)-(2,70)
(2,56)-(2,65)
(2,63)-(2,64)
*)

(* type error slice
(2,3)-(2,72)
(2,14)-(2,70)
(2,16)-(2,70)
(2,50)-(2,70)
(2,55)-(2,70)
(2,55)-(2,70)
(2,56)-(2,65)
(2,57)-(2,62)
*)
