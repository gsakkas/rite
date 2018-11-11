
let rec sumList xs =
  match xs with | [] -> [] | _ -> (List.hd xs) + (sumList List.tl xs);;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

*)

(* changed spans
(3,2)-(3,69)
match xs with
| [] -> 0
| xs -> List.hd xs + sumList (List.tl xs)
CaseG VarG [(Nothing,LitG),(Nothing,BopG EmptyG EmptyG)]

(3,24)-(3,26)
0
LitG

(3,49)-(3,69)
sumList (List.tl xs)
AppG [AppG [EmptyG]]

(3,58)-(3,65)
List.tl xs
AppG [VarG]

*)
