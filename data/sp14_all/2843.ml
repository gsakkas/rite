
let rec length = function | [] -> 0 | _::l -> 1 + (length l);;

let rec sumList xs = if (length xs) = 0 then xs = 0;;


(* fix

let rec sum list = match list with | [] -> 0 | head::tail -> head;;

let rec sumList xs = sum xs;;

*)

(* changed spans
(4,22)-(4,52)
sum xs
AppG [VarG]

*)

(* type error slice
(2,18)-(2,61)
(2,51)-(2,61)
(2,52)-(2,58)
(2,59)-(2,60)
(4,22)-(4,52)
(4,25)-(4,36)
(4,26)-(4,32)
(4,33)-(4,35)
(4,46)-(4,48)
(4,46)-(4,52)
(4,51)-(4,52)
(4,52)-(4,52)
*)
