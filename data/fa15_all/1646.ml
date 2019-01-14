
let helper (f,a,y) =
  let x = f a in if x = y then ((f, x, y), false) else ((f, x, y), true);;

let rec wwhile (f,b) =
  let (b',c') = f b in
  match c' with | false  -> (b', c') | true  -> wwhile (f, b');;

let fixpoint (f,b) = wwhile ((helper (f, b, b)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let helper x = let y = f x in if y = x then (y, false) else (y, true) in
      helper), b);;

*)

(* changed spans
(9,29)-(9,47)
fun x ->
  (let y = f x in
   if y = x
   then (y , false)
   else (y , true))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(9,29)-(9,47)
let helper =
  fun x ->
    (let y = f x in
     if y = x
     then (y , false)
     else (y , true)) in
helper
LetG NonRec (fromList [LamG EmptyG]) VarG

(9,29)-(9,47)
let y = f x in
if y = x
then (y , false)
else (y , true)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(9,44)-(9,45)
x
VarG

(9,49)-(9,50)
y
VarG

(9,49)-(9,50)
x
VarG

(9,49)-(9,50)
y
VarG

(9,49)-(9,50)
y
VarG

(9,49)-(9,50)
helper
VarG

(9,49)-(9,50)
y = x
BopG VarG VarG

(9,49)-(9,50)
false
LitG

(9,49)-(9,50)
true
LitG

(9,49)-(9,50)
if y = x
then (y , false)
else (y , true)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(9,49)-(9,50)
(y , false)
TupleG (fromList [VarG,LitG])

(9,49)-(9,50)
(y , true)
TupleG (fromList [VarG,LitG])

*)
