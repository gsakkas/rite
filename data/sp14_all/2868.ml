
let rec clone x n =
  let rec helper n = match n with | 0 -> [] | _ -> (helper n) - 1 in helper n;;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,3)-(3,78)
match n with
| 0 -> []
| _ -> x :: (clone x (n - 1))
CaseG (fromList [(LitPatG,Nothing,ListG (fromList [])),(WildPatG,Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(3,3)-(3,78)
(3,18)-(3,66)
(3,22)-(3,66)
(3,42)-(3,44)
(3,52)-(3,62)
(3,52)-(3,66)
(3,53)-(3,59)
*)
