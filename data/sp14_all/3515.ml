
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
(7,22)-(7,43)
fun x -> (0 , true)
LamG VarPatG (TupleG (fromList [EmptyG]))

(7,48)-(7,58)
func b
AppG (fromList [VarG])

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(4,42)-(4,48)
(4,42)-(4,56)
(4,49)-(4,56)
(4,50)-(4,51)
(7,3)-(7,9)
(7,3)-(7,63)
(7,10)-(7,63)
(7,20)-(7,43)
(7,22)-(7,43)
(7,26)-(7,43)
(7,47)-(7,62)
(7,48)-(7,58)
(7,49)-(7,53)
*)
