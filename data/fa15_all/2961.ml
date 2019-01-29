
let rec help n = if n > 0 then (n mod 10) + (help (n / 10)) else 0;;

let rec additivePersistence n =
  if n > 0 then 1 + (additivePersistence help n) else 0;;


(* fix

let rec help n = if n > 0 then (n mod 10) + (help (n / 10)) else 0;;

let rec additivePersistence n =
  if n > 0 then 1 + (additivePersistence (help n)) else 0;;

*)

(* changed spans
(5,20)-(5,48)
additivePersistence (help n)
AppG (fromList [AppG (fromList [EmptyG])])

(5,41)-(5,45)
help n
AppG (fromList [VarG])

*)
