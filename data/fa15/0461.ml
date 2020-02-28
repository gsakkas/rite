
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let isFPoint x = ((f x) - x) < 0 in
    let iterate (t,y) = t y in
    let rec go r = if isFPoint r then r else go (iterate (x, r)) in go 1 in
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

(9,5)-(10,73)
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
(7,3)-(11,17)
(7,10)-(10,73)
(8,5)-(10,73)
(8,18)-(8,37)
(8,22)-(8,33)
(8,31)-(8,32)
(9,5)-(10,73)
(10,5)-(10,73)
(10,20)-(10,65)
(10,23)-(10,31)
(10,23)-(10,33)
(10,32)-(10,33)
(10,39)-(10,40)
(10,46)-(10,48)
(10,46)-(10,65)
(10,69)-(10,71)
(10,69)-(10,73)
(11,3)-(11,9)
(11,3)-(11,17)
(11,10)-(11,17)
(11,11)-(11,13)
*)
