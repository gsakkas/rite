
let helper (f,b) =
  let x = f b in match x with | b -> (x, false) | _ -> (x, true);;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper f b), b);;


(* fix

let helper (f,b) = let f b = let x = f b in (x, (x != b)) in f;;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;

*)

(* changed spans
(3,2)-(3,64)
fun b ->
  (let x = f b in (x , x <> b))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(3,2)-(3,64)
let f =
  fun b ->
    (let x = f b in
     (x , x <> b)) in
f
LetG NonRec (fromList [LamG EmptyG]) VarG

(3,55)-(3,64)
x <> b
BopG VarG VarG

(3,59)-(3,63)
b
VarG

(5,16)-(6,72)
f
VarG

(8,29)-(8,41)
helper (f , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(8,37)-(8,38)
(f , b)
TupleG (fromList [VarG])

*)
