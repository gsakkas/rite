
let rec clone x n =
  let helper = match n with | 0 -> [] | _ -> x :: (clone x (n - 1)) in
  helper n;;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,3)-(4,11)
(4,3)-(4,11)
*)

(* type error slice
(3,3)-(4,11)
(3,16)-(3,66)
(3,36)-(3,38)
(3,61)-(3,62)
(3,61)-(3,66)
(4,3)-(4,9)
(4,3)-(4,11)
(4,10)-(4,11)
*)
