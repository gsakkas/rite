
let x = [1; 2; 3];;

let rec listReverse l =
  match l with
  | [] -> []
  | x::[] -> [x]
  | head::tail::third::fourth -> [fourth; third; tail; head];;


(* fix

let x = [1; 2; 3];;

let rec listReverse l =
  match l with
  | [] -> []
  | x::[] -> [x]
  | head::tail::third::fourth::fifth -> [fourth; third; tail; head];;

*)

(* changed spans
(5,3)-(8,61)
*)

(* type error slice
(5,3)-(8,61)
(5,3)-(8,61)
(5,3)-(8,61)
(5,3)-(8,61)
(5,3)-(8,61)
(5,3)-(8,61)
(8,34)-(8,61)
(8,34)-(8,61)
(8,34)-(8,61)
(8,34)-(8,61)
(8,35)-(8,41)
(8,43)-(8,48)
(8,50)-(8,54)
(8,56)-(8,60)
*)
