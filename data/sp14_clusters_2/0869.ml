
let rec sumList xs = match xs with | [] -> [] | x::xs -> x + x;;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

*)

(* changed spans
(2,21)-(2,62)
match xs with
| [] -> 0
| xs -> List.hd xs + sumList (List.tl xs)
CaseG VarG (fromList [(Nothing,BopG EmptyG EmptyG),(Nothing,LitG)])

(2,43)-(2,45)
0
LitG

(2,61)-(2,62)
List.hd xs
AppG (fromList [VarG])

*)
