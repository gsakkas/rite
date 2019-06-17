
let rec clone x n = match n with | 1 -> [x] | n' -> [clone x (n - 1)];;


(* fix

let rec clone x n =
  match n with | 1 -> [x] | n' -> List.append (clone x (n - 1)) [];;

*)

(* changed spans
(2,53)-(2,70)
List.append (clone x (n - 1))
            []
AppG [AppG [EmptyG,EmptyG],ListG []]

*)

(* type error slice
(2,4)-(2,72)
(2,15)-(2,70)
(2,17)-(2,70)
(2,21)-(2,70)
(2,53)-(2,70)
(2,54)-(2,59)
(2,54)-(2,69)
*)
