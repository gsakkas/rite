
let helper x r = let m = x r in match m with | r -> (r, false);;

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
(2,17)-(2,62)
fun (f , b) ->
  (let f =
     fun b ->
       (let x = f b in
        (x , x <> b)) in
   f)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(2,25)-(2,28)
fun b ->
  (let x = f b in (x , x <> b))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(2,25)-(2,28)
let f =
  fun b ->
    (let x = f b in
     (x , x <> b)) in
f
LetG NonRec (fromList [LamG EmptyG]) VarG

(2,25)-(2,28)
let x = f b in (x , x <> b)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(2,38)-(2,39)
f
VarG

(2,52)-(2,62)
b
VarG

(2,56)-(2,61)
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
