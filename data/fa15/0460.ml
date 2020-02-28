
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let isFPoint x = ((f x) - x) < 0 in
    let iterate (t,y) = t y in
    let rec go r = if isFPoint r then r else go (iterate (x, r)) in
    (x, (isFPoint x)) in
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
(8,18)-(8,37)
fun s -> (f s - s) < 0
LamG VarPatG (BopG EmptyG EmptyG)

(9,5)-(11,22)
(f x , isFPoint x)
TupleG [AppG [EmptyG],AppG [EmptyG]]

*)

(* type error slice
(9,5)-(11,22)
(9,18)-(9,28)
(9,25)-(9,26)
(9,25)-(9,28)
(10,5)-(11,22)
(10,16)-(10,65)
(10,23)-(10,31)
(10,23)-(10,33)
(10,32)-(10,33)
(10,46)-(10,48)
(10,46)-(10,65)
(10,49)-(10,65)
(10,50)-(10,57)
(10,58)-(10,64)
(10,59)-(10,60)
(11,9)-(11,21)
(11,10)-(11,18)
(11,19)-(11,20)
*)
