
let rec clone x n = match n with | 0 -> [] | _ -> (clone (x, (n - 1))) :: x;;


(* fix

let helper (x,m) = x :: m;;

let rec clone x n = match n with | 0 -> [] | _ -> helper (x, (clone x n));;

*)

(* changed spans
(2,15)-(2,76)
(2,52)-(2,57)
(2,52)-(2,76)
(2,63)-(2,64)
(2,63)-(2,68)
(2,67)-(2,68)
(2,75)-(2,76)
*)

(* type error slice
(2,4)-(2,78)
(2,15)-(2,76)
(2,52)-(2,57)
(2,52)-(2,68)
(2,59)-(2,60)
(2,59)-(2,68)
*)
