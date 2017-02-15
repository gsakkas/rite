
let rec clone x n =
  let rec helper = match n with | 0 -> [] | _ -> x :: ((helper n) - 1) in
  helper n;;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,2)-(4,10)
(3,54)-(3,70)
(3,55)-(3,65)
(3,56)-(3,62)
(4,2)-(4,10)
*)

(* type error slice
(3,2)-(4,10)
(3,19)-(3,70)
(3,39)-(3,41)
(3,49)-(3,70)
(3,54)-(3,70)
(3,55)-(3,65)
(3,56)-(3,62)
*)
