
let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: ((clone x n) - 1);;


(* fix

let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,51)-(3,68)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* type error slice
(2,4)-(3,70)
(2,15)-(3,68)
(2,17)-(3,68)
(3,3)-(3,68)
(3,46)-(3,68)
(3,51)-(3,68)
(3,52)-(3,63)
(3,53)-(3,58)
*)
