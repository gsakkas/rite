
let rec sumList xs = match xs with | [] -> [] | _ -> (List.hd xs) + 2;;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

*)

(* changed spans
(2,21)-(2,69)
match xs with
| [] -> 0
| xs -> List.hd xs + sumList (List.tl xs)
CaseG VarG [(Nothing,LitG),(Nothing,BopG EmptyG EmptyG)]

(2,43)-(2,45)
0
LitG

(2,68)-(2,69)
sumList (List.tl xs)
AppG [AppG [EmptyG]]

*)
