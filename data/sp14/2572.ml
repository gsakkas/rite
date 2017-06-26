
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
(8,33)-(8,60)
(8,34)-(8,40)
(8,42)-(8,47)
*)

(* all spans
(2,8)-(2,17)
(2,9)-(2,10)
(2,12)-(2,13)
(2,15)-(2,16)
(4,20)-(8,60)
(5,2)-(8,60)
(5,8)-(5,9)
(6,10)-(6,12)
(7,13)-(7,16)
(7,14)-(7,15)
(8,33)-(8,60)
(8,34)-(8,40)
(8,42)-(8,47)
(8,49)-(8,53)
(8,55)-(8,59)
*)
