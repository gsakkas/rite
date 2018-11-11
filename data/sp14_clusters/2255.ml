
let fphelper f b = if (f b) = b then (b, false) else ((f b), true);;

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) = wwhile (fphelper, b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fun z  -> let b = f z in (b, (b != z))), b);;

*)

(* changed spans
(7,29)-(7,37)
fun z ->
  (let b = f z in (b , b <> z))
LamG (LetG NonRec [EmptyG] EmptyG)

(7,39)-(7,40)
f
VarG

(7,39)-(7,40)
z
VarG

(7,39)-(7,40)
f z
AppG [VarG]

(7,39)-(7,40)
let b = f z in (b , b <> z)
LetG NonRec [AppG [EmptyG]] (TupleG [EmptyG,EmptyG])

(7,39)-(7,40)
(b , b <> z)
TupleG [VarG,BopG EmptyG EmptyG]

*)
