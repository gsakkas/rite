
let rec clone x n =
  let acc = [] in if n = 0 then acc else (clone x) :: ((acc n) - 1);;


(* fix

let rec clone x n = let accum = [] in if n < 1 then [] else clone x n;;

*)

(* changed spans
(3,2)-(3,67)
let accum = [] in
if n < 1
then []
else clone x n
LetG NonRec (fromList [ListG EmptyG Nothing]) (IteG EmptyG EmptyG EmptyG)

(3,21)-(3,26)
n < 1
BopG VarG LitG

(3,41)-(3,50)
1
LitG

(3,42)-(3,47)
clone x n
AppG (fromList [VarG])

(3,42)-(3,47)
[]
ListG EmptyG Nothing

*)
