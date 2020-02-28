
let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let b = f b in ((b, (b != b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> let b = f x in (b, (b != x))), b);;

*)

(* changed spans
(5,29)-(5,64)
(fun x ->
   (let b = f x in
    (b , b <> x)) , b)
TupleG [LamG EmptyPatG EmptyG,VarG]

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,47)-(3,53)
(3,47)-(3,61)
(3,54)-(3,61)
(3,55)-(3,56)
(5,22)-(5,28)
(5,22)-(5,64)
(5,29)-(5,64)
(5,45)-(5,63)
(5,46)-(5,59)
*)
