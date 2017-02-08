
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
(3,52)-(3,57)
*)

(* type error slice
(2,4)-(4,18)
(2,15)-(4,16)
(3,52)-(3,57)
(3,52)-(3,75)
(3,59)-(3,60)
(3,59)-(3,67)
(3,59)-(3,67)
*)
