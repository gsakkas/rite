
let rec wwhile (f,b) =
  let (value,result) = f b in if result then wwhile (f, value) else value;;

let fixpoint (f,b) = wwhile ((let helper func = func in helper), b);;


(* fix

let rec wwhile (f,b) =
  let (value,result) = f b in if result then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile
    ((let helper func = let result = f b in (result, (result = b)) in helper),
      b);;

*)

(* changed spans
(5,48)-(5,52)
let result = f b in
(result , result = b)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(5,56)-(5,62)
f
VarG

(5,56)-(5,62)
b
VarG

(5,56)-(5,62)
result
VarG

(5,56)-(5,62)
result
VarG

(5,56)-(5,62)
b
VarG

(5,56)-(5,62)
f b
AppG (fromList [VarG])

(5,56)-(5,62)
result = b
BopG VarG VarG

(5,56)-(5,62)
(result , result = b)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

*)
