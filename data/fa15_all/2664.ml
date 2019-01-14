
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let f' b = (f b) = b in wwhile (f', b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = if (f b) = b then (true, (f b)) else (false, (f b)) in
  wwhile (helper, b);;

*)

(* changed spans
(4,21)-(4,59)
let helper =
  fun b ->
    if f b = b
    then (true , f b)
    else (false , f b) in
wwhile (helper , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(4,32)-(4,41)
if f b = b
then (true , f b)
else (false , f b)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(4,45)-(4,51)
f
VarG

(4,45)-(4,51)
b
VarG

(4,45)-(4,51)
f
VarG

(4,45)-(4,51)
b
VarG

(4,45)-(4,51)
f b
AppG (fromList [VarG])

(4,45)-(4,51)
wwhile (helper , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(4,45)-(4,51)
false
LitG

(4,45)-(4,51)
(false , f b)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

(4,45)-(4,59)
true
LitG

(4,45)-(4,59)
(true , f b)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

(4,53)-(4,55)
helper
VarG

*)
