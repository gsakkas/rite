
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
(7,3)-(7,75)
(7,12)-(7,51)
(7,16)-(7,51)
(7,20)-(7,28)
(7,35)-(7,36)
(7,35)-(7,39)
(7,38)-(7,39)
(7,47)-(7,48)
(7,47)-(7,51)
(7,56)-(7,75)
*)

(* type error slice
(3,13)-(3,14)
(3,13)-(3,16)
(4,43)-(4,49)
(4,43)-(4,55)
(4,51)-(4,52)
(4,51)-(4,55)
(7,3)-(7,75)
(7,12)-(7,51)
(7,16)-(7,51)
(7,35)-(7,39)
(7,56)-(7,62)
(7,56)-(7,75)
(7,65)-(7,69)
(7,65)-(7,71)
(7,65)-(7,75)
*)
