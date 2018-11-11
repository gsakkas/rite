
let rec listReverse l =
  match l with | [] -> 0 | hd::tl -> (listReverse tl) :: hd;;


(* fix

let rec last l = match l with | x::[] -> x | hd::tl -> last tl | [] -> [];;

let rec removeLast l =
  match l with | x::[] -> [] | hd::tl -> hd :: (removeLast tl) | [] -> [];;

let rec listReverse l =
  let x = last l in let y = removeLast l in x :: (listReverse y);;

*)

(* changed spans
(3,2)-(3,59)
match l with
| x :: [] -> x
| hd :: tl -> last tl
| [] -> []
CaseG VarG [(Nothing,VarG),(Nothing,AppG EmptyG [EmptyG]),(Nothing,ListG [] Nothing)]

(3,57)-(3,59)
fun l ->
  match l with
  | x :: [] -> []
  | hd :: tl -> hd :: (removeLast tl)
  | [] -> []
LamG (CaseG EmptyG [(Nothing,EmptyG),(Nothing,EmptyG),(Nothing,EmptyG)]) Nothing

(3,57)-(3,59)
match l with
| x :: [] -> []
| hd :: tl -> hd :: (removeLast tl)
| [] -> []
CaseG VarG [(Nothing,ListG [] Nothing),(Nothing,ConAppG (Just (TupleG [VarG,AppG VarG [VarG]])) Nothing),(Nothing,ListG [] Nothing)]

*)
