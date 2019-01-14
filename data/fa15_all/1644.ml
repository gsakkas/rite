
let helper (f,a,y) = let x = f a in if x = y then (x, false) else (x, true);;

let rec wwhile (f,b) =
  let (b',c') = f b in
  match c' with | false  -> (b', c') | true  -> wwhile (f, b');;

let fixpoint (f,b) = wwhile (helper, b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let helper x = let y = f x in if y = x then (y, false) else (y, true) in
      helper), b);;

*)

(* changed spans
(8,29)-(8,35)
f
VarG

(8,29)-(8,35)
x
VarG

(8,29)-(8,35)
y
VarG

(8,29)-(8,35)
x
VarG

(8,29)-(8,35)
y
VarG

(8,29)-(8,35)
y
VarG

(8,29)-(8,35)
fun x ->
  (let y = f x in
   if y = x
   then (y , false)
   else (y , true))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(8,29)-(8,35)
f x
AppG (fromList [VarG])

(8,29)-(8,35)
y = x
BopG VarG VarG

(8,29)-(8,35)
false
LitG

(8,29)-(8,35)
true
LitG

(8,29)-(8,35)
let helper =
  fun x ->
    (let y = f x in
     if y = x
     then (y , false)
     else (y , true)) in
helper
LetG NonRec (fromList [LamG EmptyG]) VarG

(8,29)-(8,35)
let y = f x in
if y = x
then (y , false)
else (y , true)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(8,29)-(8,35)
if y = x
then (y , false)
else (y , true)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(8,29)-(8,35)
(y , false)
TupleG (fromList [VarG,LitG])

(8,29)-(8,35)
(y , true)
TupleG (fromList [VarG,LitG])

*)
