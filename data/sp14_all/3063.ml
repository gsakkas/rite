
let rec digitsOfInt n = if n < 0 then [];;


(* fix

let rec digitsOfInt n = let l = [] in if n < 0 then l else l;;

*)

(* changed spans
(2,25)-(2,41)
let l = [] in
if n < 0 then l else l
LetG NonRec (fromList [(VarPatG,ListG (fromList []))]) (IteG EmptyG EmptyG EmptyG)

*)

(* type error slice
(2,25)-(2,41)
(2,39)-(2,41)
(2,41)-(2,41)
*)
