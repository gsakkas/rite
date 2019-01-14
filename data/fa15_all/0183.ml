
let rec assoc (d,k,l) =
  let h::t = l in
  if h = []
  then d
  else (let (x,y) = h in if x = k then y else assoc (d, k, t));;


(* fix

let rec assoc (d,k,l) =
  if l = []
  then d
  else
    (let h::t = l in
     if t = []
     then d
     else (let (x,y) = h in if x = k then y else assoc (d, k, t)));;

*)

(* changed spans
(3,2)-(6,62)
l
VarG

(3,2)-(6,62)
d
VarG

(3,2)-(6,62)
l = []
BopG VarG (ListG EmptyG Nothing)

(3,2)-(6,62)
if l = []
then d
else (let h :: t = l in
      if t = []
      then d
      else (let (x , y) = h in
            if x = k
            then y
            else assoc (d , k , t)))
IteG (BopG EmptyG EmptyG) VarG (LetG NonRec (fromList [EmptyG]) EmptyG)

(3,2)-(6,62)
[]
ListG EmptyG Nothing

(4,5)-(4,6)
t
VarG

*)
