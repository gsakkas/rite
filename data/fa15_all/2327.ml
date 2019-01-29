
let rec clone x n =
  let acc = [] in if x = 0 then acc else acc :: ((clone x n) - 1);;


(* fix

let rec clone x n = let accum = [] in if n < 1 then [] else clone x n;;

*)

(* changed spans
(3,2)-(3,65)
let accum = [] in
if n < 1
then []
else clone x n
LetG NonRec (fromList [ListG EmptyG Nothing]) (IteG EmptyG EmptyG EmptyG)

(3,48)-(3,65)
n < 1
BopG VarG LitG

(3,49)-(3,60)
n
VarG

(3,49)-(3,60)
1
LitG

(3,49)-(3,60)
[]
ListG EmptyG Nothing

*)
