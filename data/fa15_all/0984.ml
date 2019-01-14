
let helper x r =
  let m = x r in match m with | r -> (r, false) | _ -> (r, true);;

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
(3,2)-(3,64)
fun (f , b) ->
  (let f =
     fun b ->
       (let x = f b in
        (x , x <> b)) in
   f)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(3,10)-(3,13)
fun b ->
  (let x = f b in (x , x <> b))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(3,10)-(3,13)
let f =
  fun b ->
    (let x = f b in
     (x , x <> b)) in
f
LetG NonRec (fromList [LamG EmptyG]) VarG

(3,10)-(3,13)
let x = f b in (x , x <> b)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(3,41)-(3,46)
f
VarG

(3,55)-(3,64)
b
VarG

(3,59)-(3,63)
x
VarG

(5,16)-(6,72)
x
VarG

(5,16)-(6,72)
b
VarG

(5,16)-(6,72)
f
VarG

(5,16)-(6,72)
x <> b
BopG VarG VarG

*)
