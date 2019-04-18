
let rec assoc (d,k,l) =
  match k with
  | (h1,h2)::t -> if k = h2 then h1 else (h1, h2) :: (assoc (d, k, t))
  | _ -> d;;


(* fix

let rec assoc (d,k,l) =
  let (h1,h2)::t = l in
  match k with | h2 -> h1 | _ -> if l = [] then d else assoc (d, k, t);;

*)

(* changed spans
(3,3)-(5,11)
let (h1 , h2) :: t = l in
match k with
| h2 -> h1
| _ -> if l = []
       then d
       else assoc (d , k , t)
LetG NonRec (fromList [(ConsPatG (TuplePatG (fromList [EmptyPatG])) VarPatG,VarG)]) (CaseG (fromList [(VarPatG,Nothing,EmptyG),(WildPatG,Nothing,EmptyG)]))

*)

(* type error slice
(3,3)-(5,11)
(3,9)-(3,10)
(4,19)-(4,71)
(4,22)-(4,23)
(4,22)-(4,28)
(4,26)-(4,28)
(4,34)-(4,36)
(4,42)-(4,50)
(4,42)-(4,71)
(4,43)-(4,45)
*)
