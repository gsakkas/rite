
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
(5,2)-(8,49)
match l with
| [] -> []
| x :: [] -> [x]
| head :: tail :: third -> [head ; tail]
CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,ListG EmptyG Nothing),(Nothing,ListG EmptyG Nothing)]

(8,37)-(8,41)
[head ; tail]
ListG VarG Nothing

*)
