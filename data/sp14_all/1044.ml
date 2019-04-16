
let rec assoc (d,k,l) =
  match l with | [] -> d | (s,i)::t -> if s = k then i else assoc (d k t);;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> if (fst h) = k then snd h else assoc (d, k, t);;

*)

(* changed spans
(3,3)-(3,74)
match l with
| [] -> d
| h :: t -> if fst h = k
            then snd h
            else assoc (d , k , t)
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,IteG EmptyG EmptyG EmptyG),(ConPatG Nothing,Nothing,VarG)])

*)

(* type error slice
(3,3)-(3,74)
(3,24)-(3,25)
(3,40)-(3,74)
(3,54)-(3,55)
(3,67)-(3,74)
(3,68)-(3,69)
(3,72)-(3,73)
*)
