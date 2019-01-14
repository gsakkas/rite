
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
(3,2)-(6,10)
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

(5,20)-(5,21)
h1
VarG

(5,53)-(5,55)
l
VarG

(5,60)-(5,77)
d
VarG

(5,60)-(5,77)
[]
ListG EmptyG Nothing

*)
