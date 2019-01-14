
let helper (x,r) = let m = x r in match m with | r -> (r, false);;

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
(2,19)-(2,64)
fun (f , b) ->
  (let f =
     fun b ->
       (let x = f b in
        (x , x <> b)) in
   f)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(2,27)-(2,30)
fun b ->
  (let x = f b in (x , x <> b))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(2,27)-(2,30)
let f =
  fun b ->
    (let x = f b in
     (x , x <> b)) in
f
LetG NonRec (fromList [LamG EmptyG]) VarG

(2,27)-(2,30)
let x = f b in (x , x <> b)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(2,40)-(2,41)
f
VarG

(2,54)-(2,64)
b
VarG

(2,58)-(2,63)
x
VarG

(4,16)-(5,72)
x
VarG

(4,16)-(5,72)
b
VarG

(4,16)-(5,72)
f
VarG

(4,16)-(5,72)
x <> b
BopG VarG VarG

*)
