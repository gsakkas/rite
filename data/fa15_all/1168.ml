
let rec assoc (d,k,l) =
  match [(k, d)] with
  | [] -> d
  | h::t -> if [(k, d)] = h then d else assoc (d, k, t);;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | (k',d')::t -> if k = k' then d' else assoc (d, k, t);;

*)

(* changed spans
(3,3)-(5,56)
match l with
| [] -> d
| (k' , d') :: t -> if k = k'
                    then d'
                    else assoc (d , k , t)
CaseG VarG (fromList [(ConsPatG (TuplePatG (fromList [EmptyPatG])) VarPatG,Nothing,IteG EmptyG EmptyG EmptyG),(ConPatG Nothing,Nothing,VarG)])

*)

(* type error slice
(3,3)-(5,56)
(3,9)-(3,17)
(3,10)-(3,16)
(5,16)-(5,24)
(5,16)-(5,28)
(5,27)-(5,28)
*)
