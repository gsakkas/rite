
let rec clone x n =
  let acc = [] in if n > 0 then clone (x :: x) (n - 1) else [];;


(* fix

let rec clone x n = let acc = [x] in if n > 0 then clone x (n - 1) else [];;

*)

(* changed spans
(3,2)-(3,62)
(3,12)-(3,14)
(3,18)-(3,62)
(3,38)-(3,46)
(3,44)-(3,45)
*)

(* type error slice
(3,38)-(3,46)
(3,38)-(3,46)
(3,39)-(3,40)
(3,44)-(3,45)
*)
