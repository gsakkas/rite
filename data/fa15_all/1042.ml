
let rec assoc (d,k,l) =
  match l with | [] -> d | (s,i)::t -> if s = k then true else assoc d k t;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> if (fst h) = k then snd h else assoc (d, k, t);;

*)

(* changed spans
(3,2)-(3,74)
match l with
| [] -> d
| h :: t -> if fst h = k
            then snd h
            else assoc (d , k , t)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,IteG EmptyG EmptyG EmptyG)])

(3,42)-(3,43)
fst h
AppG (fromList [VarG])

(3,46)-(3,47)
fst
VarG

(3,46)-(3,47)
h
VarG

(3,63)-(3,68)
snd
VarG

(3,63)-(3,68)
h
VarG

(3,63)-(3,68)
assoc (d , k , t)
AppG (fromList [TupleG (fromList [EmptyG])])

(3,63)-(3,74)
snd h
AppG (fromList [VarG])

(3,69)-(3,70)
(d , k , t)
TupleG (fromList [VarG])

*)
