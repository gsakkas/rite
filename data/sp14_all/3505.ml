
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (fun f  -> ((f, ((f b) = b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(6,29)-(6,62)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (TupleG (fromList [EmptyG]))

*)

(* type error slice
(4,42)-(4,48)
(4,42)-(4,56)
(4,49)-(4,56)
(6,22)-(6,28)
(6,22)-(6,62)
(6,29)-(6,62)
*)
