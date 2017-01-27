
let rec clone x n =
  let acc = [] in if n > 0 then clone (x :: acc) (n - 1) else [];;


(* fix

let rec clone x n =
  let acc = [] in if n > 0 then clone (x @ acc) (n - 1) else [];;

*)

(* changed spans
(3,40)-(3,41)
(3,40)-(3,48)
*)

(* type error slice
(2,4)-(3,67)
(2,15)-(3,65)
(2,17)-(3,65)
(3,3)-(3,65)
(3,19)-(3,65)
(3,22)-(3,23)
(3,22)-(3,27)
(3,26)-(3,27)
(3,33)-(3,38)
(3,33)-(3,56)
(3,40)-(3,48)
(3,51)-(3,56)
*)
