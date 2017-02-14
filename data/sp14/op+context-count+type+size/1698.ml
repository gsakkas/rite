
let rec clone x n =
  let acc = [] in if n > 0 then clone (x :: x) (n - 1) else [];;


(* fix

let rec clone x n = let acc = [x] in if n > 0 then clone x (n - 1) else [];;

*)

(* changed spans
(3,3)-(3,63)
(3,13)-(3,15)
(3,19)-(3,63)
(3,40)-(3,46)
(3,45)-(3,46)
*)

(* type error slice
(3,40)-(3,41)
(3,40)-(3,46)
(3,40)-(3,46)
(3,45)-(3,46)
*)
