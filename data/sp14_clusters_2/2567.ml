
let rec listReverse l =
  match l with
  | _ -> []
  | x -> [x]
  | head::tail -> (listReverse tail) :: head;;


(* fix

let x = [1; 2; 3];;

let rec listReverse l =
  match l with
  | [] -> []
  | x::[] -> [x]
  | head::tail::t::s -> head :: tail :: t :: s;;

*)

(* changed spans
(2,20)-(6,44)
1
LitG

(2,20)-(6,44)
2
LitG

(2,20)-(6,44)
3
LitG

(2,20)-(6,44)
[1 ; 2 ; 3]
ListG LitG Nothing

(3,2)-(6,44)
match l with
| [] -> []
| x :: [] -> [x]
| head :: tail :: t :: s -> head :: (tail :: (t :: s))
CaseG VarG (fromList [(Nothing,ConAppG (Just EmptyG) Nothing),(Nothing,ListG EmptyG Nothing)])

*)
