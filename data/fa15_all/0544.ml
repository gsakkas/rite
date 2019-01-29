
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((f, true), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(4,29)-(4,38)
f
VarG

(4,29)-(4,38)
b
VarG

(4,29)-(4,38)
b
VarG

(4,29)-(4,38)
fun b'' -> (f b , false)
LamG (TupleG (fromList [EmptyG]))

(4,29)-(4,38)
f b
AppG (fromList [VarG])

(4,29)-(4,38)
f b = b
BopG (AppG (fromList [EmptyG])) VarG

(4,29)-(4,38)
if f b = b
then (fun b'' ->
        (f b , false))
else (fun b'' -> (f b , true))
IteG (BopG EmptyG EmptyG) (LamG EmptyG) (LamG EmptyG)

(4,30)-(4,31)
f b
AppG (fromList [VarG])

(4,33)-(4,37)
b
VarG

(4,33)-(4,37)
f
VarG

(4,33)-(4,37)
b
VarG

(4,33)-(4,37)
fun b'' -> (f b , true)
LamG (TupleG (fromList [EmptyG]))

(4,33)-(4,37)
f b
AppG (fromList [VarG])

(4,33)-(4,37)
false
LitG

(4,33)-(4,37)
(f b , true)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

*)
