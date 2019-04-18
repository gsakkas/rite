
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (match (f, b) with | (b',c') -> (((f b') <> b'), b));;


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

(6,10)-(6,62)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (TupleG (fromList [EmptyG]))

*)

(* type error slice
(6,10)-(6,62)
(6,17)-(6,23)
(6,18)-(6,19)
(6,44)-(6,50)
(6,45)-(6,46)
(6,47)-(6,49)
*)
