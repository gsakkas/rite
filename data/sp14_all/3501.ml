
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((not f), ((f b) = b), b);;


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
CaseG (fromList [(LitPatG,Nothing,VarG),(LitPatG,Nothing,AppG (fromList [EmptyG]))])

(5,29)-(5,54)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (TupleG (fromList [EmptyG]))

*)

(* type error slice
(3,42)-(3,48)
(3,42)-(3,56)
(3,49)-(3,56)
(5,22)-(5,28)
(5,22)-(5,54)
(5,29)-(5,54)
(5,30)-(5,37)
(5,31)-(5,34)
(5,35)-(5,36)
(5,40)-(5,45)
(5,41)-(5,42)
*)
