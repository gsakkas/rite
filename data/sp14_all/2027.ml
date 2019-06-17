
let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone ((x n) - 1));;


(* fix

let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,51)-(3,70)
clone x (n - 1)
AppG [VarG,BopG EmptyG EmptyG]

*)

(* type error slice
(2,4)-(3,72)
(2,15)-(3,70)
(3,51)-(3,70)
(3,52)-(3,57)
(3,58)-(3,69)
(3,59)-(3,64)
(3,60)-(3,61)
*)
