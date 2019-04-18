
let x = [1; 2; 3];;

let rec listReverse l =
  match l with
  | [] -> []
  | x::[] -> [x]
  | head::tail::t::s -> s :: t :: tail :: head;;


(* fix

let x = [1; 2; 3];;

let rec listReverse l =
  match l with | [] -> [] | x::[] -> [x] | head::tail::third -> [head; tail];;

*)

(* changed spans
(5,3)-(8,47)
match l with
| [] -> []
| x :: [] -> [x]
| head :: tail :: third -> [head ; tail]
CaseG (fromList [(ConsPatG VarPatG (ConsPatG EmptyPatG EmptyPatG),Nothing,ListG (fromList [EmptyG])),(ConsPatG VarPatG (ConPatG Nothing),Nothing,ListG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])

(8,25)-(8,47)
[head ; tail]
ListG (fromList [VarG])

*)

(* type error slice
(5,3)-(8,47)
(8,25)-(8,26)
(8,25)-(8,47)
(8,30)-(8,31)
(8,30)-(8,47)
(8,35)-(8,39)
(8,35)-(8,47)
(8,43)-(8,47)
*)
