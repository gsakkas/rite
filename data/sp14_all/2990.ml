
let rec sumList xs =
  if (List.length xs) > 0 then (List.hd xs) + (sumList List.tl xs) else 0;;


(* fix

let rec sumList xs =
  if (List.length xs) > 0 then (List.hd xs) + (sumList (List.tl xs)) else 0;;

*)

(* changed spans
(3,46)-(3,66)
sumList (List.tl xs)
AppG (fromList [AppG (fromList [EmptyG])])

(3,55)-(3,62)
List.tl xs
AppG (fromList [VarG])

*)
