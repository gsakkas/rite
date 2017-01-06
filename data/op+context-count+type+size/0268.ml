
let rec clone x n =
  let rec clone_RT acc n = if n <= 0 then acc else clone (x :: acc) (n - 1) in
  clone_RT [] n;;



let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;


(* changed spans
(3,52)-(3,57)
*)

(* type error slice
(3,52)-(3,75)
*)
