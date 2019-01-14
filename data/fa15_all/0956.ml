
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let f::e = h in if f = k then e else assoc d k t;;


(* fix

let rec assoc (d,k,l) =
  match l with | [] -> d | (n,m)::t -> if n = k then m else assoc (d, k, t);;

*)

(* changed spans
(3,2)-(5,60)
match l with
| [] -> d
| (n , m) :: t -> if n = k
                  then m
                  else assoc (d , k , t)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,IteG EmptyG EmptyG EmptyG)])

(5,31)-(5,32)
n
VarG

(5,49)-(5,54)
assoc (d , k , t)
AppG (fromList [TupleG (fromList [EmptyG])])

(5,49)-(5,60)
m
VarG

(5,55)-(5,56)
(d , k , t)
TupleG (fromList [VarG])

*)
