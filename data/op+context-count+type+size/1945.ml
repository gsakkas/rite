
let rec clone x n =
  let rec helper = match n with | 0 -> [] | _ -> (helper n) - 1 in helper n;;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,3)-(3,76)
(3,51)-(3,57)
(3,51)-(3,59)
(3,51)-(3,64)
(3,68)-(3,74)
(3,68)-(3,76)
(3,75)-(3,76)
*)

(* type error slice
(3,3)-(3,76)
(3,20)-(3,64)
(3,20)-(3,64)
(3,40)-(3,42)
(3,51)-(3,57)
(3,51)-(3,59)
(3,51)-(3,64)
*)
