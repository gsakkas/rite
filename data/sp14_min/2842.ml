
let rec length = function | [] -> 0 | _::l -> 1 + (length l);;

let rec sumList xs = if (length xs) = 0 then 0;;


(* fix

let rec sum list = match list with | [] -> 0 | head::tail -> head;;

let rec sumList xs = sum xs;;

*)

(* changed spans
(4,22)-(4,47)
sum xs
AppG [VarG]

*)

(* type error slice
(4,22)-(4,47)
(4,46)-(4,47)
(4,47)-(4,47)
*)
