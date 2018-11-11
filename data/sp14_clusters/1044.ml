
let rec assoc (d,k,l) =
  match l with | [] -> d | (s,i)::t -> if s = k then i else assoc (d k t);;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> if (fst h) = k then snd h else assoc (d, k, t);;

*)

(* changed spans
(3,2)-(3,73)
match l with
| [] -> d
| h :: t -> if fst h = k
            then snd h
            else assoc (d , k , t)
CaseG VarG [(Nothing,VarG),(Nothing,IteG EmptyG EmptyG EmptyG)]

(3,42)-(3,43)
fst h
AppG [VarG]

(3,46)-(3,47)
fst
VarG

(3,46)-(3,47)
h
VarG

(3,60)-(3,65)
snd
VarG

(3,60)-(3,65)
h
VarG

(3,60)-(3,65)
assoc (d , k , t)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

(3,66)-(3,73)
(d , k , t)
TupleG [VarG,VarG,VarG]

*)
