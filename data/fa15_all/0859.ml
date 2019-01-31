
let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n -> if n < 0 then (clone 0 abs n) @ l1 else (clone 0 abs n) @ l2;;


(* fix

let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n -> if n < 0 then (((clone 0 n) @ l1), l2) else (((clone 0 n) @ l2), l1);;

*)

(* changed spans
(8,23)-(8,38)
clone 0 n
AppG (fromList [VarG,LitG])

(8,23)-(8,43)
(clone 0 n @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(8,49)-(8,64)
clone 0 n
AppG (fromList [VarG,LitG])

(8,49)-(8,69)
l2
VarG

(8,49)-(8,69)
(clone 0 n @ l2 , l1)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)
