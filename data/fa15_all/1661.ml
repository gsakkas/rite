
let rec wwhile (f,b) =
  let f' = f b in
  match f' with | (b',false ) -> b' | (b',true ) -> wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let g = f in ((g b), (b = (g b)))), b);;


(* fix

let rec wwhile (f,b) =
  let f' = f b in
  match f' with | (b',false ) -> b' | (b',true ) -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let whilesFun f' b' = let fOfB = f' b' in (fOfB, (fOfB = b')) in
      whilesFun f), b);;

*)

(* changed spans
(6,43)-(6,63)
let whilesFun =
  fun f' ->
    fun b' ->
      (let fOfB = f' b' in
       (fOfB , fOfB = b')) in
whilesFun f
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(6,44)-(6,49)
fun f' ->
  fun b' ->
    (let fOfB = f' b' in
     (fOfB , fOfB = b'))
LamG (LamG EmptyG)

(6,44)-(6,49)
fun b' ->
  (let fOfB = f' b' in
   (fOfB , fOfB = b'))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(6,44)-(6,49)
let fOfB = f' b' in
(fOfB , fOfB = b')
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(6,47)-(6,48)
f'
VarG

(6,51)-(6,62)
b'
VarG

(6,51)-(6,62)
fOfB
VarG

(6,51)-(6,62)
(fOfB , fOfB = b')
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(6,52)-(6,53)
fOfB
VarG

(6,56)-(6,61)
b'
VarG

(6,59)-(6,60)
whilesFun
VarG

(6,66)-(6,67)
f
VarG

*)
