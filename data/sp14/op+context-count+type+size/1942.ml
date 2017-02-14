
let rec clone x n =
  let helper = match n with | 0 -> [] | _ -> x :: ((clone x n) - 1) in
  helper n;;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,3)-(4,11)
(3,53)-(3,67)
(3,61)-(3,62)
(4,3)-(4,11)
*)

(* type error slice
(3,3)-(4,11)
(3,16)-(3,67)
(3,36)-(3,38)
(3,46)-(3,67)
(3,53)-(3,67)
(4,3)-(4,9)
(4,3)-(4,11)
*)
