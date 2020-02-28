
let rec clone x n =
  let rec helper acc n' = if n <= 0 then [] else (helper x) :: (acc (n' - 1)) in
  helper [x] (n - 1);;


(* fix

let rec clone x n =
  let rec helper acc n' = if n <= 0 then [] else helper (x :: acc) (n' - 1) in
  helper [x] (n - 1);;

*)

(* changed spans
(3,50)-(3,78)
helper (x :: acc) (n' - 1)
AppG [AppG [EmptyG,EmptyG],BopG EmptyG EmptyG]

*)

(* type error slice
(3,3)-(4,21)
(3,18)-(3,78)
(3,22)-(3,78)
(3,27)-(3,78)
(3,50)-(3,60)
(3,50)-(3,78)
(3,51)-(3,57)
(3,58)-(3,59)
(4,3)-(4,9)
(4,3)-(4,21)
(4,10)-(4,13)
(4,11)-(4,12)
*)
