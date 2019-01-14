
let rec assoc (d,k,l) =
  let h::t = l in
  let f::e = h in
  if f = k then e else if t = [] then (-1) else assoc (d, k, t);;


(* fix

let rec assoc (d,k,l) =
  match l with | [] -> d | (n,m)::t -> if n = k then m else assoc (d, k, t);;

*)

(* changed spans
(3,2)-(5,63)
match l with
| [] -> d
| (n , m) :: t -> if n = k
                  then m
                  else assoc (d , k , t)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,IteG EmptyG EmptyG EmptyG)])

(4,13)-(4,14)
d
VarG

(5,5)-(5,6)
n
VarG

(5,38)-(5,42)
m
VarG

*)
