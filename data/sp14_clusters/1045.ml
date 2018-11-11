
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | ((s,i) as h)::t -> if s = k then i else assoc (d k t);;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> if (fst h) = k then snd h else assoc (d, k, t);;

*)

(* changed spans
(3,2)-(5,57)
match l with
| [] -> d
| h :: t -> if fst h = k
            then snd h
            else assoc (d , k , t)
CaseG VarG [(Nothing,VarG),(Nothing,IteG EmptyG EmptyG EmptyG)]

(5,26)-(5,27)
fst h
AppG [VarG]

(5,30)-(5,31)
fst
VarG

(5,30)-(5,31)
h
VarG

(5,44)-(5,49)
snd
VarG

(5,44)-(5,49)
h
VarG

(5,44)-(5,49)
assoc (d , k , t)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

(5,50)-(5,57)
(d , k , t)
TupleG [VarG,VarG,VarG]

*)
