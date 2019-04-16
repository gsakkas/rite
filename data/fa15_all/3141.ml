
let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (fun x  -> let b = f x in ((b, (b != x)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> let b = f x in (b, (b != x))), b);;

*)

(* changed spans
(5,29)-(5,74)
(fun x ->
   (let b = f x in
    (b , b <> x)) , b)
TupleG (fromList [VarG,LamG VarPatG EmptyG])

*)

(* type error slice
(3,47)-(3,53)
(3,47)-(3,61)
(3,54)-(3,61)
(5,22)-(5,28)
(5,22)-(5,74)
(5,29)-(5,74)
*)
