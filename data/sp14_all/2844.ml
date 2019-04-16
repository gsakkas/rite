
let rec sumList xs =
  match sumList with | [] -> 0 | head::tail -> head + (sumList tail);;


(* fix

let rec sum list = match list with | [] -> 0 | head::tail -> head;;

let rec sumList xs = sum xs;;

*)

(* changed spans
(3,3)-(3,69)
sum xs
AppG (fromList [VarG])

*)

(* type error slice
(3,3)-(3,69)
(3,9)-(3,16)
(3,55)-(3,69)
(3,56)-(3,63)
*)
