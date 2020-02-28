
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile ((f, ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(6,29)-(6,50)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] (TupleG [EmptyG,EmptyG])

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(4,42)-(4,48)
(4,42)-(4,56)
(4,49)-(4,56)
(4,50)-(4,51)
(6,22)-(6,28)
(6,22)-(6,50)
(6,29)-(6,50)
(6,30)-(6,46)
*)
