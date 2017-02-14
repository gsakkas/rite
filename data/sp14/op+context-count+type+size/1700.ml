
let rec clone x n =
  let acc = [0] in if n > 0 then clone (x :: acc) (n - 1) else [];;


(* fix

let rec clone x n = let acc = [0] in if n > 0 then clone x (n - 1) else [];;

*)

(* changed spans
(3,2)-(3,65)
(3,39)-(3,49)
(3,45)-(3,48)
*)

(* type error slice
(2,3)-(3,67)
(2,14)-(3,65)
(3,33)-(3,38)
(3,33)-(3,57)
(3,39)-(3,49)
(3,39)-(3,49)
(3,40)-(3,41)
*)
