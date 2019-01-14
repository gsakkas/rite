
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile ((let n z = let xx = f in (xx, (b = (f b))) in n), b);;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(7,21)-(7,52)
fun x ->
  (let ff = f b in
   (ff , b = ff))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(7,30)-(7,31)
f b
AppG (fromList [VarG])

(7,30)-(7,31)
let ff = f b in (ff , b = ff)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(7,35)-(7,52)
b
VarG

(7,36)-(7,38)
ff
VarG

(7,48)-(7,49)
ff
VarG

(7,56)-(7,57)
(n , b)
TupleG (fromList [VarG])

*)
