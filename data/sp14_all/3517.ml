
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) =
  wwhile
    (let func x y =
       match (x y) = y with
       | true  -> ((x, true), b)
       | false  -> ((x, false), b) in
     func f b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(8,17)-(11,35)
fun x -> (0 , true)
LamG VarPatG (TupleG (fromList [EmptyG]))

(12,6)-(12,14)
(func b , b)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(4,42)-(4,48)
(4,42)-(4,56)
(4,49)-(4,56)
(4,50)-(4,51)
(7,3)-(7,9)
(7,3)-(12,15)
(8,5)-(12,15)
(8,15)-(11,35)
(8,17)-(11,35)
(9,8)-(11,35)
(11,20)-(11,35)
(11,21)-(11,31)
(12,6)-(12,10)
(12,6)-(12,14)
*)
