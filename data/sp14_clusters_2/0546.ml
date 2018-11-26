
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (((failwith "asd"), (failwith "asd")), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(4,29)-(4,65)
f
VarG

(4,29)-(4,65)
b
VarG

(4,29)-(4,65)
b
VarG

(4,29)-(4,65)
fun b'' -> (f b , false)
LamG (TupleG (fromList [EmptyG]))

(4,29)-(4,65)
f b
AppG (fromList [VarG])

(4,29)-(4,65)
f b = b
BopG (AppG (fromList [EmptyG])) VarG

(4,29)-(4,65)
if f b = b
then (fun b'' ->
        (f b , false))
else (fun b'' -> (f b , true))
IteG (BopG EmptyG EmptyG) (LamG EmptyG) (LamG EmptyG)

(4,40)-(4,45)
f
VarG

(4,48)-(4,64)
b
VarG

(4,48)-(4,64)
fun b'' -> (f b , true)
LamG (TupleG (fromList [EmptyG]))

(4,48)-(4,64)
false
LitG

(4,48)-(4,64)
(f b , true)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

(4,58)-(4,63)
f
VarG

*)
