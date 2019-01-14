
let fpHelper (f,x,y) =
  let n = f x in match n with | y -> (n, y, false) | _ -> (n, y, false);;

let rec wwhile (f,b) =
  let (b',c') = f b in
  match c' with | false  -> (b', c') | true  -> wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fpHelper (f, b, b)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let helper x = let y = f x in if y = x then (y, false) else (y, true) in
      helper), b);;

*)

(* changed spans
(9,29)-(9,49)
fun x ->
  (let y = f x in
   if y = x
   then (y , false)
   else (y , true))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(9,29)-(9,49)
let helper =
  fun x ->
    (let y = f x in
     if y = x
     then (y , false)
     else (y , true)) in
helper
LetG NonRec (fromList [LamG EmptyG]) VarG

(9,29)-(9,49)
let y = f x in
if y = x
then (y , false)
else (y , true)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(9,46)-(9,47)
x
VarG

(9,51)-(9,52)
y
VarG

(9,51)-(9,52)
x
VarG

(9,51)-(9,52)
y
VarG

(9,51)-(9,52)
y
VarG

(9,51)-(9,52)
helper
VarG

(9,51)-(9,52)
y = x
BopG VarG VarG

(9,51)-(9,52)
false
LitG

(9,51)-(9,52)
true
LitG

(9,51)-(9,52)
if y = x
then (y , false)
else (y , true)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(9,51)-(9,52)
(y , false)
TupleG (fromList [VarG,LitG])

(9,51)-(9,52)
(y , true)
TupleG (fromList [VarG,LitG])

*)
