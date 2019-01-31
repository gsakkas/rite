
let rec clone x n =
  let rec helper acc n' =
    if n <= 0 then [] else helper ((x :: acc), (n' - 1)) in
  helper [x] (n - 1);;


(* fix

let rec clone x n =
  let rec helper acc n' = if n <= 0 then [] else helper (x :: acc) (n' - 1) in
  helper [x] (n - 1);;

*)

(* changed spans
(4,27)-(4,56)
helper (x :: acc) (n' - 1)
AppG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

*)
