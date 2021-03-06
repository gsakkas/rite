
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (fun b  -> (((f b), ((f b) != b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) != b))), b);;

*)

(* changed spans
(5,29)-(5,67)
(fun b ->
   (f b , f b <> b) , b)
TupleG [LamG EmptyPatG EmptyG,VarG]

*)

(* type error slice
(3,42)-(3,48)
(3,42)-(3,56)
(3,49)-(3,56)
(5,22)-(5,28)
(5,22)-(5,67)
(5,29)-(5,67)
*)
