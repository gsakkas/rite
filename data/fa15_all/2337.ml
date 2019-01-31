
let rec assoc (d,k,l) =
  match k with | [] -> d | h::t -> if k = h then h else assoc d k t;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (f,s) = h in if k = f then s else assoc (d, k, t);;

*)

(* changed spans
(3,8)-(3,9)
l
VarG

(3,35)-(3,67)
h
VarG

(3,35)-(3,67)
let (f , s) = h in
if k = f
then s
else assoc (d , k , t)
LetG NonRec (fromList [VarG]) (IteG EmptyG EmptyG EmptyG)

(3,56)-(3,61)
s
VarG

(3,56)-(3,61)
assoc (d , k , t)
AppG (fromList [TupleG (fromList [EmptyG])])

(3,56)-(3,67)
f
VarG

(3,62)-(3,63)
(d , k , t)
TupleG (fromList [VarG])

*)
