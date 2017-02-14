
let rec clone x n =
  let rec helper acc n' = if n <= 0 then [] else (helper x) :: (acc (n' - 1)) in
  helper [x] (n - 1);;


(* fix

let rec clone x n =
  let rec helper acc n' = if n <= 0 then [] else helper (x :: acc) (n' - 1) in
  helper [x] (n - 1);;

*)

(* changed spans
(3,51)-(3,59)
(3,51)-(3,76)
(3,58)-(3,59)
(3,65)-(3,76)
*)

(* type error slice
(3,3)-(4,20)
(3,18)-(3,76)
(3,22)-(3,76)
(3,27)-(3,76)
(3,51)-(3,57)
(3,51)-(3,59)
(3,51)-(3,76)
(3,51)-(3,76)
(3,58)-(3,59)
(4,3)-(4,9)
(4,3)-(4,20)
(4,10)-(4,13)
(4,10)-(4,13)
(4,11)-(4,12)
*)
