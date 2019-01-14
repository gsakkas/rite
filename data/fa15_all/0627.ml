
let rec clone x n = match n with | 1 -> [x] | n' -> [clone x (n - 1)];;


(* fix

let rec clone x n =
  match n with | 1 -> [x] | n' -> List.append (clone x (n - 1)) [];;

*)

(* changed spans
(2,53)-(2,58)
List.append
VarG

(2,53)-(2,58)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)
