
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) =
  wwhile (fun func  -> fun f  -> fun b  -> ((f, ((f b) <> b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(7,10)-(7,67)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] (TupleG [EmptyG,EmptyG])

*)

(* type error slice
(4,42)-(4,48)
(4,42)-(4,56)
(4,49)-(4,56)
(7,3)-(7,9)
(7,3)-(7,67)
(7,10)-(7,67)
*)
