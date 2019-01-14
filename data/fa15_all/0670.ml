
let rec sumList xs = function | [] -> 0 | xf::xb -> xf + (sumList xb);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | xf::xb -> xf + (sumList xb);;

*)

(* changed spans
(2,21)-(2,69)
xs
VarG

*)
