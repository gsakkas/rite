
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t ->
      (match h with | () -> d | (a,b) -> if a = k then b else assoc (d, k, t));;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (a,b) = h in if a = k then b else assoc (d, k, t);;

*)

(* changed spans
(6,7)-(6,79)
let (a , b) = h in
if a = k
then b
else assoc (d , k , t)
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),VarG)]) (IteG EmptyG EmptyG EmptyG)

*)

(* type error slice
(6,7)-(6,79)
*)
