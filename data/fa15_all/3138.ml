
let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (fun x  -> let b = f b in ((b, (b != b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> let b = f x in (b, (b != x))), b);;

*)

(* changed spans
(5,28)-(5,73)
(fun x ->
   (let b = f x in
    (b , b <> x)) , b)
TupleG (fromList [VarG,LamG EmptyG])

(5,54)-(5,72)
x
VarG

(5,65)-(5,66)
x
VarG

*)
