
let rec listReverse l =
  match l with | [] -> [] | x::[] -> x | hd::tl -> (listReverse tl) :: hd;;


(* fix

let rec last l = match l with | x::[] -> x | hd::tl -> last tl | [] -> [];;

let rec removeLast l =
  match l with | x::[] -> [] | hd::tl -> hd :: (removeLast tl) | [] -> [];;

let rec listReverse l = (last l) :: (listReverse (removeLast l));;

*)

(* changed spans
(3,2)-(3,73)
match l with
| x :: [] -> x
| hd :: tl -> last tl
| [] -> []
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(3,52)-(3,63)
last
VarG

(3,71)-(3,73)
l
VarG

(3,71)-(3,73)
fun l ->
  match l with
  | x :: [] -> []
  | hd :: tl -> hd :: (removeLast tl)
  | [] -> []
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(3,71)-(3,73)
match l with
| x :: [] -> []
| hd :: tl -> hd :: (removeLast tl)
| [] -> []
CaseG VarG (fromList [(Nothing,ConAppG (Just EmptyG) Nothing),(Nothing,ListG EmptyG Nothing)])

(3,71)-(3,73)
hd :: (removeLast tl)
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG])]))) Nothing

(3,71)-(3,73)
[]
ListG EmptyG Nothing

(3,71)-(3,73)
[]
ListG EmptyG Nothing

*)
