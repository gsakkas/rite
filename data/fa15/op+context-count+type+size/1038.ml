
let rec sumList xs = function | [] -> 0 | xf::xb -> xf + (sumList xb);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | xf::xb -> xf + (sumList xb);;

*)

(* changed spans
(2,22)-(2,69)
*)

(* type error slice
(2,4)-(2,72)
(2,17)-(2,69)
(2,22)-(2,69)
(2,53)-(2,69)
(2,59)-(2,66)
(2,59)-(2,69)
*)
