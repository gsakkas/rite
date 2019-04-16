
let rec clone x n =
  let rec helper = match n with | 0 -> [] | _ -> (helper n) - 1 in helper n;;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,3)-(3,76)
match n with
| 0 -> []
| _ -> x :: (clone x (n - 1))
CaseG VarG (fromList [(LitPatG,Nothing,ListG (fromList [])),(WildPatG,Nothing,ConAppG (Just EmptyG))])

*)

(* type error slice
(3,3)-(3,76)
(3,20)-(3,64)
(3,40)-(3,42)
(3,50)-(3,60)
(3,50)-(3,64)
(3,51)-(3,57)
*)
