
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let isFPoint s = ((f s) - s) < 0 in
    let iterate (t,y) = t y in
    let rec go r = if isFPoint r then r else go (iterate (x, r)) in go x in
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
(8,5)-(10,73)
(9,5)-(10,73)
(9,18)-(9,28)
(9,25)-(9,26)
(9,27)-(9,28)
(10,5)-(10,73)
(10,16)-(10,63)
(10,20)-(10,63)
(10,23)-(10,33)
(10,32)-(10,33)
(10,39)-(10,40)
(10,46)-(10,63)
(10,69)-(10,73)
*)

(* type error slice
(9,5)-(10,73)
(9,18)-(9,28)
(9,25)-(9,26)
(9,25)-(9,28)
(10,46)-(10,48)
(10,46)-(10,63)
(10,50)-(10,57)
(10,50)-(10,63)
(10,59)-(10,60)
(10,59)-(10,63)
(10,69)-(10,71)
(10,69)-(10,73)
(10,72)-(10,73)
*)
