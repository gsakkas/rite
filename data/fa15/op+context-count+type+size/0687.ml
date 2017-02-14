
let rec clone x n = match n with | 0 -> [] | _ -> [x; clone x (n - 1)];;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(2,50)-(2,70)
*)

(* type error slice
(2,3)-(2,72)
(2,14)-(2,70)
(2,16)-(2,70)
(2,20)-(2,70)
(2,50)-(2,70)
(2,50)-(2,70)
(2,54)-(2,59)
(2,54)-(2,69)
*)
