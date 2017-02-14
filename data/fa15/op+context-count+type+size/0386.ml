
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
(4,34)-(4,56)
*)

(* type error slice
(3,2)-(5,20)
(3,17)-(4,56)
(4,27)-(4,33)
(4,27)-(4,56)
(4,34)-(4,56)
(4,35)-(4,45)
(4,41)-(4,44)
(5,2)-(5,8)
(5,2)-(5,20)
(5,9)-(5,12)
*)
