
let rec assoc (d,k,l) =
  match l with | [] -> d | (s,i)::t -> if s = k then true else assoc (d k t);;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> if (fst h) = k then snd h else assoc (d, k, t);;

*)

(* changed spans
(3,3)-(3,77)
match l with
| [] -> d
| h :: t -> if fst h = k
            then snd h
            else assoc (d , k , t)
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,IteG EmptyG EmptyG EmptyG),(ConPatG Nothing,Nothing,VarG)])

*)

(* type error slice
(2,4)-(3,79)
(2,16)-(3,77)
(3,3)-(3,77)
(3,24)-(3,25)
(3,40)-(3,77)
(3,54)-(3,58)
(3,64)-(3,69)
(3,64)-(3,77)
(3,70)-(3,77)
(3,71)-(3,72)
*)
