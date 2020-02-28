
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let isFPoint x = ((f x) - x) < 0 in f b in wwhile (gs, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let isFPoint s = ((f s) - s) < 0 in ((f x), (isFPoint x)) in
  wwhile (gs, b);;

*)

(* changed spans
(7,27)-(7,46)
fun s -> (f s - s) < 0
LamG VarPatG (BopG EmptyG EmptyG)

(7,50)-(7,53)
(f x , isFPoint x)
TupleG [AppG [EmptyG],AppG [EmptyG]]

*)

(* type error slice
(3,3)-(4,69)
(3,13)-(3,14)
(3,13)-(3,16)
(4,3)-(4,69)
(4,9)-(4,12)
(4,43)-(4,49)
(4,43)-(4,56)
(4,50)-(4,56)
(4,51)-(4,52)
(7,3)-(7,71)
(7,10)-(7,53)
(7,14)-(7,53)
(7,31)-(7,42)
(7,32)-(7,37)
(7,33)-(7,34)
(7,50)-(7,51)
(7,50)-(7,53)
(7,57)-(7,63)
(7,57)-(7,71)
(7,64)-(7,71)
(7,65)-(7,67)
*)
