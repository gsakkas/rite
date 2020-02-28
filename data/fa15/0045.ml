
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
(4,28)-(4,57)
helper (x :: acc) (n' - 1)
AppG [AppG [EmptyG,EmptyG],BopG EmptyG EmptyG]

*)

(* type error slice
(3,3)-(5,21)
(3,18)-(4,57)
(4,28)-(4,34)
(4,28)-(4,57)
(4,35)-(4,57)
(4,36)-(4,46)
(4,42)-(4,45)
(5,3)-(5,9)
(5,3)-(5,21)
(5,10)-(5,13)
*)
