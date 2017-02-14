
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
(8,4)-(10,72)
(9,4)-(10,72)
(9,17)-(9,27)
(9,24)-(9,25)
(9,26)-(9,27)
(10,4)-(10,72)
(10,15)-(10,64)
(10,19)-(10,64)
(10,22)-(10,32)
(10,31)-(10,32)
(10,38)-(10,39)
(10,45)-(10,64)
(10,68)-(10,72)
*)

(* type error slice
(9,4)-(10,72)
(9,17)-(9,27)
(9,24)-(9,25)
(9,24)-(9,27)
(10,45)-(10,47)
(10,45)-(10,64)
(10,48)-(10,64)
(10,49)-(10,56)
(10,57)-(10,63)
(10,58)-(10,59)
(10,68)-(10,70)
(10,68)-(10,72)
(10,71)-(10,72)
*)
