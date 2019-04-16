
let rec sumList xs = match sumList with | head::tail -> head + (sumList tail);;


(* fix

let rec sum list = match list with | [] -> 0 | head::tail -> head;;

let rec sumList xs = sum xs;;

*)

(* changed spans
(2,22)-(2,78)
sum xs
AppG (fromList [VarG])

*)

(* type error slice
(2,22)-(2,78)
(2,28)-(2,35)
(2,64)-(2,78)
(2,65)-(2,72)
*)
