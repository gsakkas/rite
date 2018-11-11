
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    (let helper = if (f b) = b then ((f b), true) else ((f b), false) in
     (helper, b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> let b = f x in (b, (b != x))), b);;

*)

(* changed spans
(7,37)-(7,42)
fun x ->
  (let b = f x in (b , b <> x))
LamG (LetG NonRec [EmptyG] EmptyG)

(7,37)-(7,42)
let b = f x in (b , b <> x)
LetG NonRec [AppG [EmptyG]] (TupleG [EmptyG,EmptyG])

(7,44)-(7,48)
x
VarG

(8,6)-(8,12)
b <> x
BopG VarG VarG

*)
