
let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList List.tl xs);;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

*)

(* changed spans
(3,49)-(3,69)
sumList (List.tl xs)
AppG (fromList [AppG (fromList [EmptyG])])

(3,58)-(3,65)
List.tl xs
AppG (fromList [VarG])

*)
