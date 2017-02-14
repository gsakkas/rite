
let rec clone x n =
  match n with | 1 -> [x] | n' -> List.append clone x (n - 1) [];;


(* fix

let rec clone x n =
  match n with | 1 -> [x] | n' -> List.append (clone x (n - 1)) [];;

*)

(* changed spans
(3,34)-(3,64)
(3,46)-(3,51)
*)

(* type error slice
(3,34)-(3,45)
(3,34)-(3,64)
*)
