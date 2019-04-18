
let rec clone x n = match n with | 0 -> [] | h::t -> x :: (clone x (n - 1));;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(2,21)-(2,76)
match n with
| 0 -> []
| _ -> x :: (clone x (n - 1))
CaseG (fromList [(LitPatG,Nothing,ListG (fromList [])),(WildPatG,Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(2,21)-(2,76)
(2,27)-(2,28)
(2,68)-(2,75)
(2,69)-(2,70)
*)
