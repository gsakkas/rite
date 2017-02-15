
let rec clone x n =
  let rec clone_RT acc n = if n <= 0 then acc else clone (x :: acc) (n - 1) in
  clone_RT [] n;;


(* fix

let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

*)

(* changed spans
(3,51)-(3,56)
*)

(* type error slice
(2,3)-(4,17)
(2,14)-(4,15)
(3,51)-(3,56)
(3,51)-(3,75)
(3,57)-(3,67)
(3,57)-(3,67)
(3,58)-(3,59)
*)
