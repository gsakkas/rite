
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b1 = if (f b1) = b then (1, b) else (1, b) in wwhile ((funt b), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt x = (2, ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(7,3)-(7,77)
(7,12)-(7,53)
(7,17)-(7,53)
(7,21)-(7,30)
(7,23)-(7,25)
(7,37)-(7,38)
(7,37)-(7,41)
(7,49)-(7,50)
(7,49)-(7,53)
(7,58)-(7,77)
*)

(* type error slice
(3,13)-(3,14)
(3,13)-(3,16)
(4,43)-(4,49)
(4,43)-(4,55)
(4,51)-(4,52)
(4,51)-(4,55)
(7,3)-(7,77)
(7,12)-(7,53)
(7,17)-(7,53)
(7,37)-(7,41)
(7,58)-(7,64)
(7,58)-(7,77)
(7,67)-(7,71)
(7,67)-(7,73)
(7,67)-(7,77)
*)
