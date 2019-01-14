
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
(3,2)-(5,10)
let (h1 , h2) :: t = l in
match k with
| h2 -> h1
| _ -> if l = []
       then d
       else assoc (d , k , t)
LetG NonRec (fromList [VarG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(3,8)-(3,9)
l
VarG

(3,8)-(3,9)
match k with
| h2 -> h1
| _ -> if l = []
       then d
       else assoc (d , k , t)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,IteG EmptyG EmptyG EmptyG)])

(4,18)-(4,70)
h1
VarG

(4,46)-(4,48)
l
VarG

(4,53)-(4,70)
d
VarG

(4,53)-(4,70)
[]
ListG EmptyG Nothing

*)
