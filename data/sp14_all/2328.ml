
let rec clone x n =
  let acc = [] in if n = 0 then acc else (clone x) :: ((acc n) - 1);;


(* fix

let rec clone x n = let accum = [] in if n < 1 then [] else clone x n;;

*)

(* changed spans
(3,3)-(3,68)
let accum = [] in
if n < 1
then []
else clone x n
LetG NonRec (fromList [(VarPatG,ListG (fromList []))]) (IteG EmptyG EmptyG EmptyG)

*)

(* type error slice
(2,4)-(3,70)
(2,15)-(3,68)
(2,17)-(3,68)
(3,3)-(3,68)
(3,13)-(3,15)
(3,19)-(3,68)
(3,42)-(3,51)
(3,42)-(3,68)
(3,43)-(3,48)
(3,55)-(3,68)
(3,56)-(3,63)
(3,57)-(3,60)
*)
