
let rec listReverse l =
  match l with | x::[] -> x | hd::tl -> (listReverse tl) :: hd;;


(* fix

let rec last l = match l with | x::[] -> x | hd::tl -> last tl | [] -> [];;

let rec removeLast l =
  match l with | x::[] -> [] | hd::tl -> hd :: (removeLast tl) | [] -> [];;

let rec listReverse l = (last l) :: (listReverse (removeLast l));;

*)

(* changed spans
(3,2)-(3,62)
match l with
| x :: [] -> x
| hd :: tl -> last tl
| [] -> []
CaseG VarG [(Nothing,VarG),(Nothing,AppG [EmptyG]),(Nothing,ListG EmptyG Nothing)]

(3,41)-(3,52)
last
VarG

(3,60)-(3,62)
l
VarG

(3,60)-(3,62)
fun l ->
  match l with
  | x :: [] -> []
  | hd :: tl -> hd :: (removeLast tl)
  | [] -> []
LamG (CaseG EmptyG [(Nothing,EmptyG),(Nothing,EmptyG),(Nothing,EmptyG)])

(3,60)-(3,62)
match l with
| x :: [] -> []
| hd :: tl -> hd :: (removeLast tl)
| [] -> []
CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,ConAppG (Just EmptyG) Nothing),(Nothing,ListG EmptyG Nothing)]

(3,60)-(3,62)
hd :: (removeLast tl)
ConAppG (Just (TupleG [VarG,AppG [VarG]])) Nothing

(3,60)-(3,62)
[]
ListG EmptyG Nothing

(3,60)-(3,62)
[]
ListG EmptyG Nothing

*)
