
let x = [1; 2; 3];;

let rec listReverse l =
  match l with
  | [] -> []
  | x::[] -> [x]
  | head::tail::t::s::l -> s :: t :: tail :: head;;


(* fix

let x = [1; 2; 3];;

let rec listReverse l =
  match l with | [] -> [] | x::[] -> [x] | head::tail::third -> [head; tail];;

*)

(* changed spans
(5,3)-(8,50)
match l with
| [] -> []
| x :: [] -> [x]
| head :: tail :: third -> [head ; tail]
CaseG VarG (fromList [(ConsPatG VarPatG (ConsPatG EmptyPatG EmptyPatG),Nothing,ListG (fromList [EmptyG])),(ConsPatG VarPatG (ConPatG Nothing),Nothing,ListG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])

*)

(* type error slice
(5,3)-(8,50)
(8,38)-(8,42)
(8,38)-(8,50)
(8,46)-(8,50)
*)
