
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
(4,28)-(4,55)
(4,37)-(4,55)
*)

(* type error slice
(3,3)-(5,20)
(3,18)-(4,55)
(4,28)-(4,34)
(4,28)-(4,55)
(4,37)-(4,45)
(4,37)-(4,55)
(4,42)-(4,45)
(5,3)-(5,9)
(5,3)-(5,20)
(5,10)-(5,13)
*)
