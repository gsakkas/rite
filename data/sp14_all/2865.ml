
let rec clone x n =
  let helper = match n with | 0 -> [] | _ -> x :: (clone x (n - 1)) in
  helper n;;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,3)-(4,11)
match n with
| 0 -> []
| _ -> x :: (clone x (n - 1))
CaseG VarG (fromList [(LitPatG,Nothing,ListG (fromList [])),(WildPatG,Nothing,ConAppG (Just EmptyG))])

*)

(* type error slice
(3,3)-(4,11)
(3,16)-(3,68)
(3,36)-(3,38)
(4,3)-(4,9)
(4,3)-(4,11)
*)
