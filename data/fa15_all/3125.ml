
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
(6,9)-(6,66)
(fun input ->
   (let b = f input in
    (b , b <> input)) , b)
TupleG (fromList [VarG,LamG EmptyG])

*)
