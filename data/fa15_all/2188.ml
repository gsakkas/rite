
let rec wwhile (f,b) =
  let (value,result) = f b in if result then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile
    ((let helper func = let (value,result) = f b in value * (not result) in
      helper), b);;


(* fix

let rec wwhile (f,b) =
  let (value,result) = f b in if result then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile
    ((let helper func = let result = f b in (result, (result = b)) in helper),
      b);;

*)

(* changed spans
(7,25)-(7,73)
let result = f b in
(result , result = b)
LetG NonRec [(VarPatG,AppG [EmptyG])] (TupleG [EmptyG,EmptyG])

*)

(* type error slice
(3,3)-(3,74)
(3,24)-(3,25)
(3,24)-(3,27)
(3,46)-(3,52)
(3,46)-(3,63)
(3,53)-(3,63)
(3,54)-(3,55)
(6,3)-(6,9)
(6,3)-(8,18)
(7,5)-(8,18)
(7,6)-(8,14)
(7,18)-(7,73)
(7,25)-(7,73)
(7,53)-(7,73)
(7,61)-(7,73)
(7,62)-(7,65)
(8,7)-(8,13)
*)
