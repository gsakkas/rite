
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let xx = f in (f, (b < (f b))) in (n, b));;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(7,39)-(7,40)
let ff = f b in (ff , b = ff)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(7,55)-(7,56)
ff
VarG

(7,55)-(7,56)
b
VarG

(7,55)-(7,56)
ff
VarG

(7,55)-(7,56)
b = ff
BopG VarG VarG

(7,55)-(7,56)
(n , b)
TupleG (fromList [VarG])

*)
