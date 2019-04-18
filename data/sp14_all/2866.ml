
let rec clone x n =
  let rec helper = match n with | 0 -> [] | _ -> x :: ((helper n) - 1) in
  helper n;;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,3)-(4,11)
match n with
| 0 -> []
| _ -> x :: (clone x (n - 1))
CaseG (fromList [(LitPatG,Nothing,ListG (fromList [])),(WildPatG,Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(3,3)-(4,11)
(3,20)-(3,71)
(3,40)-(3,42)
(3,50)-(3,71)
(3,55)-(3,71)
(3,56)-(3,66)
(3,57)-(3,63)
*)
