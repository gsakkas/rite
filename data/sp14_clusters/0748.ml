
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let h = f in ((h, false), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let h x = ((f x), false) in (h, b));;

*)

(* changed spans
(5,37)-(5,38)
fun x -> (f x , false)
LamG (TupleG [EmptyG,EmptyG])

(5,43)-(5,53)
f
VarG

(5,43)-(5,53)
x
VarG

(5,43)-(5,53)
f x
AppG [VarG]

(5,43)-(5,53)
false
LitG

*)
