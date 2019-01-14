
let helper (f,b) = let (x,y) = f b in (x, (x = b));;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;


(* fix

let helper (f,b) = let f b = let x = f b in (x, (x != b)) in f;;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;

*)

(* changed spans
(2,19)-(2,50)
let f =
  fun b ->
    (let x = f b in
     (x , x <> b)) in
f
LetG NonRec (fromList [LamG EmptyG]) VarG

(2,31)-(2,34)
fun b ->
  (let x = f b in (x , x <> b))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(2,31)-(2,34)
let x = f b in (x , x <> b)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(2,42)-(2,49)
x <> b
BopG VarG VarG

(4,16)-(5,72)
f
VarG

*)
