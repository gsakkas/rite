
let rec clone x n =
  let rec helper = match n with | 0 -> [] | _ -> (helper n) - 1 in helper n;;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,2)-(3,75)
(3,49)-(3,59)
(3,49)-(3,63)
(3,50)-(3,56)
(3,67)-(3,73)
(3,67)-(3,75)
(3,74)-(3,75)
*)

(* type error slice
(3,2)-(3,75)
(3,19)-(3,63)
(3,19)-(3,63)
(3,39)-(3,41)
(3,49)-(3,59)
(3,49)-(3,63)
(3,50)-(3,56)
*)
