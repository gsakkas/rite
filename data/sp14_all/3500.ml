
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((not ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(3,31)-(3,64)
match c' with
| true -> wwhile (f , b')
| false -> b'
CaseG VarG (fromList [(LitPatG,Nothing,VarG),(LitPatG,Nothing,AppG (fromList [EmptyG]))])

(5,29)-(5,51)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (TupleG (fromList [EmptyG]))

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,42)-(3,48)
(3,42)-(3,56)
(3,49)-(3,56)
(3,50)-(3,51)
(5,22)-(5,28)
(5,22)-(5,51)
(5,29)-(5,51)
(5,30)-(5,47)
(5,31)-(5,34)
*)
