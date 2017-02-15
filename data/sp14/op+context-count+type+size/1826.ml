
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
(5,2)-(8,60)
*)

(* type error slice
(5,2)-(8,60)
(5,2)-(8,60)
(5,2)-(8,60)
(5,2)-(8,60)
(5,2)-(8,60)
(5,2)-(8,60)
(8,33)-(8,60)
(8,33)-(8,60)
(8,33)-(8,60)
(8,33)-(8,60)
(8,34)-(8,40)
(8,42)-(8,47)
(8,49)-(8,53)
(8,55)-(8,59)
*)
