
let rec sumList xs =
  match xs with | _ -> (List.hd xs) + (sumList List.tl) | [] -> [];;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

*)

(* changed spans
(3,2)-(3,66)
match xs with
| [] -> 0
| xs -> List.hd xs + sumList (List.tl xs)
CaseG VarG [(Nothing,LitG),(Nothing,BopG EmptyG EmptyG)]

(3,23)-(3,55)
0
LitG

(3,47)-(3,54)
List.tl xs
AppG [VarG]

(3,64)-(3,66)
xs
VarG

*)
