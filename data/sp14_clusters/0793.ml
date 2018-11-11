
let rec wwhile (f,b) =
  match f b with
  | (x,trueOrFalse) -> if trueOrFalse then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((), b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (x,trueOrFalse) -> if trueOrFalse then wwhile (f, x) else x;;

let fixpoint (f,b) =
  wwhile
    ((fun x  -> let xi = f x in (xi, (((f xi) != xi) || (f (f xi))))), b);;

*)

(* changed spans
(6,29)-(6,31)
LamG (LetG NonRec [AppG VarG [VarG]] (TupleG [VarG,BopG (BopG (AppG VarG [VarG]) VarG) (AppG VarG [AppG VarG [VarG]])])) Nothing
LamG (LetG NonRec [EmptyG] EmptyG) Nothing

(6,33)-(6,34)
VarG
VarG

(6,33)-(6,34)
AppG VarG [VarG]
AppG VarG [VarG]

(6,33)-(6,34)
AppG VarG [AppG VarG [VarG]]
AppG VarG [AppG EmptyG [EmptyG]]

(6,33)-(6,34)
BopG (AppG VarG [VarG]) VarG
BopG (AppG EmptyG [EmptyG]) VarG

(6,33)-(6,34)
BopG (BopG (AppG VarG [VarG]) VarG) (AppG VarG [AppG VarG [VarG]])
BopG (BopG EmptyG EmptyG) (AppG EmptyG [EmptyG])

(6,33)-(6,34)
LetG NonRec [AppG VarG [VarG]] (TupleG [VarG,BopG (BopG (AppG VarG [VarG]) VarG) (AppG VarG [AppG VarG [VarG]])])
LetG NonRec [AppG EmptyG [EmptyG]] (TupleG [EmptyG,EmptyG])

(6,33)-(6,34)
TupleG [VarG,BopG (BopG (AppG VarG [VarG]) VarG) (AppG VarG [AppG VarG [VarG]])]
TupleG [VarG,BopG EmptyG EmptyG]

*)
