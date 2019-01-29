
let rec sumList xs =
  match xs with | [] -> [] | xs -> (List.hd xs) + (sumList List.tl xs);;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

*)

(* changed spans
(3,24)-(3,26)
0
LitG

(3,50)-(3,70)
sumList (List.tl xs)
AppG (fromList [AppG (fromList [EmptyG])])

(3,59)-(3,66)
List.tl xs
AppG (fromList [VarG])

*)
