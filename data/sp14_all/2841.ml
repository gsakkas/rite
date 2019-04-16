
let rec sumList xs = if (xs :: 1) = 1 then 0;;


(* fix

let rec sum list = match list with | [] -> 0 | head::tail -> head;;

let rec sumList xs = sum xs;;

*)

(* changed spans
(2,22)-(2,45)
sum xs
AppG (fromList [VarG])

*)

(* type error slice
(2,22)-(2,45)
(2,25)-(2,34)
(2,25)-(2,38)
(2,32)-(2,33)
(2,37)-(2,38)
(2,44)-(2,45)
(2,45)-(2,45)
*)
