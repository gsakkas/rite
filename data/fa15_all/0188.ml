
let rec assoc (d,k,l) =
  match (d, k, l) with | (k,_) -> k | h::t -> assoc (d, k, t) | _ -> d;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | (ki,vi)::t -> if k = ki then vi else assoc (d, k, t)
  | [] -> d;;

*)

(* changed spans
(3,3)-(3,71)
match l with
| (ki , vi) :: t -> if k = ki
                    then vi
                    else assoc (d , k , t)
| [] -> d
CaseG VarG (fromList [(ConsPatG (TuplePatG (fromList [EmptyPatG])) VarPatG,Nothing,IteG EmptyG EmptyG EmptyG),(ConPatG Nothing,Nothing,VarG)])

*)

(* type error slice
(3,3)-(3,71)
(3,9)-(3,18)
*)
