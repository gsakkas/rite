
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
(7,24)-(7,72)
let result = f b in
(result , result = b)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(7,61)-(7,64)
(result , result = b)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(8,6)-(8,12)
result
VarG

(8,6)-(8,12)
b
VarG

(8,6)-(8,12)
result = b
BopG VarG VarG

*)
