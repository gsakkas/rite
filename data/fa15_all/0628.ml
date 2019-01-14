
let rec clone x n =
  match n with | 1 -> [x] | n' -> List.append clone x (n - 1) [];;


(* fix

let rec clone x n =
  match n with | 1 -> [x] | n' -> List.append (clone x (n - 1)) [];;

*)

(* changed spans
(3,34)-(3,64)
List.append (clone x (n - 1))
            []
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(3,46)-(3,51)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)
