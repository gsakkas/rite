
let x = [1; 2; 3];;

let rec listReverse l =
  match l with | [] -> [] | x::[] -> [x] | head::tail::third -> head :: tail;;


(* fix

let x = [1; 2; 3];;

let rec listReverse l =
  match l with | [] -> [] | x::[] -> [x] | head::tail::third -> [head; tail];;

*)

(* changed spans
(5,65)-(5,77)
[head ; tail]
ListG (fromList [VarG])

*)

(* type error slice
(5,3)-(5,77)
(5,65)-(5,69)
(5,65)-(5,77)
(5,73)-(5,77)
*)
