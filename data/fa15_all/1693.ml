
let rec assoc (d,k,l) =
  match k with
  | h::t ->
      let (h1,h2) = h in if k = h2 then h1 else (h1, h2) :: (assoc (d, k, t))
  | _ -> d;;


(* fix

let rec assoc (d,k,l) =
  let (h1,h2)::t = l in
  match k with | h2 -> h1 | _ -> if l = [] then d else assoc (d, k, t);;

*)

(* changed spans
(3,3)-(6,11)
let (h1 , h2) :: t = l in
match k with
| h2 -> h1
| _ -> if l = []
       then d
       else assoc (d , k , t)
LetG NonRec (fromList [(ConsPatG (TuplePatG (fromList [EmptyPatG])) VarPatG,VarG)]) (CaseG EmptyG (fromList [(VarPatG,Nothing,EmptyG),(WildPatG,Nothing,EmptyG)]))

*)

(* type error slice
(3,3)-(6,11)
(3,9)-(3,10)
(5,7)-(5,78)
(5,21)-(5,22)
(5,26)-(5,78)
(5,29)-(5,30)
(5,29)-(5,35)
(5,33)-(5,35)
(5,41)-(5,43)
(5,49)-(5,57)
(5,49)-(5,78)
(5,50)-(5,52)
*)
