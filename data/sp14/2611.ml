
let rec clone x n =
  let acc = [] in if n > 0 then clone (x :: acc) (n - 1) else [];;


(* fix

let rec clone x n =
  let acc = [] in if n > 0 then clone (x @ acc) (n - 1) else [];;

*)

(* changed spans
(3,39)-(3,49)
x @ acc
AppG [VarG,VarG]

*)

(* type error slice
(2,4)-(3,67)
(2,15)-(3,65)
(3,33)-(3,38)
(3,33)-(3,57)
(3,39)-(3,49)
(3,40)-(3,41)
*)
