
let rec wwhile (f,b) =
  let (value,result) = f b in if result then wwhile (f, value) else value;;

let fixpoint (f,b) = wwhile ((let helper f = not f in helper), b);;


(* fix

let rec wwhile (f,b) =
  let (value,result) = f b in if result then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile
    ((let helper func = let result = f b in (result, (result = b)) in helper),
      b);;

*)

(* changed spans
(5,41)-(5,50)
fun func ->
  (let result = f b in
   (result , result = b))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,45)-(5,50)
let result = f b in
(result , result = b)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(5,54)-(5,60)
b
VarG

(5,54)-(5,60)
result
VarG

(5,54)-(5,60)
result
VarG

(5,54)-(5,60)
b
VarG

(5,54)-(5,60)
result = b
BopG VarG VarG

(5,54)-(5,60)
(result , result = b)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

*)
