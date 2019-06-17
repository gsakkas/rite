
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    (let fin (f',b') = let nfb = f' b' in (nfb, (nfb = b')) in
     ((fin (f, b)), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fin bt = (bt, ((f bt) = bt)) in (fin, b));;

*)

(* changed spans
(6,15)-(6,60)
fun bt -> (bt , f bt = bt)
LamG VarPatG (TupleG [EmptyG,EmptyG])

(7,7)-(7,19)
fin
VarG

*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(2,64)-(2,65)
(5,3)-(5,9)
(5,3)-(7,24)
(6,5)-(7,24)
(6,15)-(6,60)
(6,24)-(6,60)
(6,43)-(6,60)
(7,6)-(7,23)
(7,7)-(7,19)
(7,8)-(7,11)
*)
