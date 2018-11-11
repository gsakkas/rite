
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) =
  wwhile (let func x y = (x, ((x y) <> y)) in ((func f b), b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(7,21)-(7,42)
fun x -> (0 , true)
LamG (TupleG [EmptyG,EmptyG])

(7,39)-(7,40)
0
LitG

(7,46)-(7,61)
true
LitG

(7,47)-(7,57)
func b
AppG [VarG]

*)
