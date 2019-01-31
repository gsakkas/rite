
let fpHelper (f,x,y) =
  let n = f x in match n with | y -> (n, false) | _ -> (n, false);;

let rec wwhile (f,b) =
  let (b',c') = f b in
  match c' with | false  -> (b', c') | true  -> wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fpHelper (f, b)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let helper x = let y = f x in if y = x then (y, false) else (y, true) in
      helper), b);;

*)

(* changed spans
(9,29)-(9,46)
fun x ->
  (let y = f x in
   if y = x
   then (y , false)
   else (y , true))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(9,29)-(9,46)
let helper =
  fun x ->
    (let y = f x in
     if y = x
     then (y , false)
     else (y , true)) in
helper
LetG NonRec (fromList [LamG EmptyG]) VarG

(9,29)-(9,46)
let y = f x in
if y = x
then (y , false)
else (y , true)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(9,43)-(9,44)
x
VarG

(9,48)-(9,49)
y
VarG

(9,48)-(9,49)
x
VarG

(9,48)-(9,49)
y
VarG

(9,48)-(9,49)
y
VarG

(9,48)-(9,49)
helper
VarG

(9,48)-(9,49)
y = x
BopG VarG VarG

(9,48)-(9,49)
false
LitG

(9,48)-(9,49)
true
LitG

(9,48)-(9,49)
if y = x
then (y , false)
else (y , true)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(9,48)-(9,49)
(y , false)
TupleG (fromList [VarG,LitG])

(9,48)-(9,49)
(y , true)
TupleG (fromList [VarG,LitG])

*)
