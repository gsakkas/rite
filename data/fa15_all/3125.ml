
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (fun input  -> let b = f input in ((b, (b != input)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((fun input  -> let b = f input in (b, (b != input))), b);;

*)

(* changed spans
(6,10)-(6,67)
(fun input ->
   (let b = f input in
    (b , b <> input)) , b)
TupleG (fromList [VarG,LamG VarPatG EmptyG])

*)

(* type error slice
(3,42)-(3,48)
(3,42)-(3,56)
(3,49)-(3,56)
(6,3)-(6,9)
(6,3)-(6,67)
(6,10)-(6,67)
*)
