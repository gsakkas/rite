
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if (f b) = b then (b, b) else (b, b) in wwhile ((funt b), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt x = (2, ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(7,2)-(7,75)
(7,11)-(7,51)
(7,15)-(7,51)
(7,18)-(7,27)
(7,33)-(7,39)
(7,34)-(7,35)
(7,37)-(7,38)
(7,45)-(7,51)
(7,46)-(7,47)
(7,55)-(7,75)
*)

(* type error slice
(3,12)-(3,13)
(3,12)-(3,15)
(4,42)-(4,48)
(4,42)-(4,55)
(4,49)-(4,55)
(4,50)-(4,51)
(7,2)-(7,75)
(7,11)-(7,51)
(7,15)-(7,51)
(7,33)-(7,39)
(7,55)-(7,61)
(7,55)-(7,75)
(7,62)-(7,75)
(7,63)-(7,71)
(7,64)-(7,68)
*)
