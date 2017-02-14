
let rec clone x n =
  let helper = match n with | 0 -> [] | _ -> x :: (clone x (n - 1)) in
  helper n;;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,2)-(4,10)
(4,2)-(4,10)
*)

(* type error slice
(3,2)-(4,10)
(3,15)-(3,67)
(3,35)-(3,37)
(4,2)-(4,8)
(4,2)-(4,10)
*)
