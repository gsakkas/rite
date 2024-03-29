
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let isFPoint x = ((f x) - x) < 0 in (f, ((f b) = b)) in
  wwhile (gs, b);;


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

(7,51)-(7,52)
f x
AppG [VarG]

(7,54)-(7,65)
isFPoint x
AppG [VarG]

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
(4,54)-(4,55)
(7,3)-(8,17)
(7,10)-(7,66)
(7,14)-(7,66)
(7,50)-(7,66)
(7,51)-(7,52)
(7,55)-(7,60)
(7,56)-(7,57)
(7,58)-(7,59)
(8,3)-(8,9)
(8,3)-(8,17)
(8,10)-(8,17)
(8,11)-(8,13)
(8,15)-(8,16)
*)
