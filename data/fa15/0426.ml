
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
(7,33)-(7,39)
(7,34)-(7,35)
(7,37)-(7,38)
(7,45)-(7,51)
(7,46)-(7,47)
(7,49)-(7,50)
(7,63)-(7,71)
(7,73)-(7,74)
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

(* all spans
(2,16)-(4,68)
(3,2)-(4,68)
(3,12)-(3,15)
(3,12)-(3,13)
(3,14)-(3,15)
(4,2)-(4,68)
(4,8)-(4,11)
(4,30)-(4,38)
(4,30)-(4,31)
(4,34)-(4,38)
(4,42)-(4,55)
(4,42)-(4,48)
(4,49)-(4,55)
(4,50)-(4,51)
(4,53)-(4,54)
(4,67)-(4,68)
(6,14)-(7,75)
(7,2)-(7,75)
(7,11)-(7,51)
(7,15)-(7,51)
(7,18)-(7,27)
(7,18)-(7,23)
(7,19)-(7,20)
(7,21)-(7,22)
(7,26)-(7,27)
(7,33)-(7,39)
(7,34)-(7,35)
(7,37)-(7,38)
(7,45)-(7,51)
(7,46)-(7,47)
(7,49)-(7,50)
(7,55)-(7,75)
(7,55)-(7,61)
(7,62)-(7,75)
(7,63)-(7,71)
(7,64)-(7,68)
(7,69)-(7,70)
(7,73)-(7,74)
*)
