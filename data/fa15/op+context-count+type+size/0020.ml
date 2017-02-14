
let rec clone x n =
  match n with | 1 -> [x] | n' -> List.append clone x (n - 1) [];;


(* fix

let rec clone x n =
  match n with | 1 -> [x] | n' -> List.append (clone x (n - 1)) [];;

*)

(* changed spans
(3,35)-(3,65)
(3,47)-(3,52)
*)

(* type error slice
(3,35)-(3,46)
(3,35)-(3,65)
*)
