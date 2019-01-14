
let rec clone x n =
  let rec helper acc n' = if n <= 0 then [] else (helper x) :: (acc (n' - 1)) in
  helper [x] (n - 1);;


(* fix

let rec clone x n =
  let rec helper acc n' = if n <= 0 then [] else helper (x :: acc) (n' - 1) in
  helper [x] (n - 1);;

*)

(* changed spans
(3,49)-(3,59)
helper (x :: acc) (n' - 1)
AppG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(3,57)-(3,58)
x :: acc
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

*)
