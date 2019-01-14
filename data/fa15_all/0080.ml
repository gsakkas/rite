
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let result = f b in if result = b then b else wwhile (f, result);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let foo b =
    let result = f b in
    if result = b then (result, false) else (result, true) in
  wwhile (foo, b);;

*)

(* changed spans
(5,2)-(5,66)
fun b ->
  (let result = f b in
   if result = b
   then (result , false)
   else (result , true))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,2)-(5,66)
let foo =
  fun b ->
    (let result = f b in
     if result = b
     then (result , false)
     else (result , true)) in
wwhile (foo , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(5,41)-(5,42)
(result , false)
TupleG (fromList [VarG,LitG])

(5,48)-(5,66)
result
VarG

(5,48)-(5,66)
result
VarG

(5,48)-(5,66)
false
LitG

(5,48)-(5,66)
true
LitG

(5,48)-(5,66)
(result , true)
TupleG (fromList [VarG,LitG])

(5,59)-(5,65)
foo
VarG

*)
