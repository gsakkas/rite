
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
(3,3)-(5,58)
match l with
| [] -> d
| h :: t -> if fst h = k
            then snd h
            else assoc (d , k , t)
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,IteG EmptyG EmptyG EmptyG),(ConPatG Nothing,Nothing,VarG)])

*)

(* type error slice
(3,3)-(5,58)
(4,11)-(4,12)
(5,24)-(5,58)
(5,38)-(5,39)
(5,51)-(5,58)
(5,52)-(5,53)
(5,56)-(5,57)
*)
