
let rec clone x n =
  let acc = [] in if n > 0 then clone (x :: acc) (n - 1) else [];;


(* fix

let rec clone x n =
  let acc = [] in if n > 0 then clone (x @ acc) (n - 1) else [];;

*)

(* changed spans
(3,38)-(3,48)
(3,39)-(3,40)
*)

(* type error slice
(2,3)-(3,66)
(2,14)-(3,64)
(3,32)-(3,37)
(3,32)-(3,56)
(3,38)-(3,48)
(3,38)-(3,48)
(3,39)-(3,40)
*)
