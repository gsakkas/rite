
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
(2,17)-(4,16)
(3,3)-(4,16)
(3,20)-(3,75)
(3,24)-(3,75)
(3,28)-(3,75)
(3,31)-(3,32)
(3,31)-(3,37)
(3,36)-(3,37)
(3,43)-(3,46)
(3,52)-(3,57)
(3,52)-(3,75)
(3,59)-(3,60)
(3,59)-(3,67)
(3,64)-(3,67)
(3,70)-(3,75)
(4,3)-(4,11)
(4,3)-(4,16)
(4,12)-(4,14)
(4,15)-(4,16)
*)
