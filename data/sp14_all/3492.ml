
let equ f b = (f b) = b;;

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((equ f b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(5,31)-(5,64)
match c' with
| true -> wwhile (f , b')
| false -> b'
CaseG (fromList [(LitPatG,Nothing,VarG),(LitPatG,Nothing,AppG (fromList [EmptyG]))])

(7,29)-(7,43)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (TupleG (fromList [EmptyG]))

*)

(* type error slice
(2,4)-(2,26)
(2,9)-(2,24)
(2,11)-(2,24)
(2,15)-(2,24)
(5,9)-(5,10)
(5,9)-(5,12)
(5,42)-(5,48)
(5,42)-(5,56)
(5,49)-(5,56)
(5,50)-(5,51)
(7,22)-(7,28)
(7,22)-(7,43)
(7,29)-(7,43)
(7,30)-(7,39)
(7,31)-(7,34)
*)
