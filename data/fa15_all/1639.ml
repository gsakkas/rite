
let rec wwhile (f,b) =
  let (b',c') = f b in
  match c' with | false  -> (b', c') | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    (let x = f b in match x with | b -> (x, false) | _ -> ((x, true), b));;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let helper x = let y = f x in if y = x then (y, false) else (y, true) in
      helper), b);;

*)

(* changed spans
(8,4)-(8,73)
(let helper =
   fun x ->
     (let y = f x in
      if y = x
      then (y , false)
      else (y , true)) in
 helper , b)
TupleG (fromList [VarG,LetG NonRec (fromList [EmptyG]) EmptyG])

(8,13)-(8,16)
fun x ->
  (let y = f x in
   if y = x
   then (y , false)
   else (y , true))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(8,13)-(8,16)
let helper =
  fun x ->
    (let y = f x in
     if y = x
     then (y , false)
     else (y , true)) in
helper
LetG NonRec (fromList [LamG EmptyG]) VarG

(8,13)-(8,16)
let y = f x in
if y = x
then (y , false)
else (y , true)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(8,40)-(8,50)
if y = x
then (y , false)
else (y , true)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(8,41)-(8,42)
y
VarG

(8,41)-(8,42)
y = x
BopG VarG VarG

(8,59)-(8,68)
y
VarG

(8,59)-(8,68)
false
LitG

(8,60)-(8,61)
y
VarG

(8,70)-(8,71)
helper
VarG

*)
