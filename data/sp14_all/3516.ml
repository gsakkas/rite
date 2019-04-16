
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) =
  wwhile
    (let func x y =
       match (x y) = y with | true  -> (x, true) | false  -> (x, false) in
     ((func f b), b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(8,17)-(9,72)
fun x -> (0 , true)
LamG VarPatG (TupleG (fromList [EmptyG]))

(10,7)-(10,17)
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
(7,3)-(10,22)
(8,5)-(10,22)
(8,15)-(9,72)
(8,17)-(9,72)
(9,8)-(9,72)
(9,40)-(9,49)
(10,6)-(10,21)
(10,7)-(10,17)
(10,8)-(10,12)
*)
