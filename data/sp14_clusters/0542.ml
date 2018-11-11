
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((f, ((f b) != b)), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(4,29)-(4,46)
if f b = b
then (fun b'' ->
        (f b , false))
else (fun b'' -> (f b , true))
IteG (BopG EmptyG EmptyG) (LamG EmptyG) (LamG EmptyG)

(4,30)-(4,31)
f b
AppG [VarG]

(4,30)-(4,31)
f b = b
BopG (AppG [EmptyG]) VarG

(4,33)-(4,45)
b
VarG

(4,34)-(4,39)
b
VarG

(4,34)-(4,39)
fun b'' -> (f b , false)
LamG (TupleG [EmptyG,EmptyG])

(4,34)-(4,39)
(f b , false)
TupleG [AppG [EmptyG],LitG]

(4,43)-(4,44)
f
VarG

(4,43)-(4,44)
fun b'' -> (f b , true)
LamG (TupleG [EmptyG,EmptyG])

(4,43)-(4,44)
f b
AppG [VarG]

(4,43)-(4,44)
false
LitG

(4,43)-(4,44)
(f b , true)
TupleG [AppG [EmptyG],LitG]

(4,48)-(4,49)
true
LitG

*)
