
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b' = if (f b') = b then (b, true) else ((f b'), false) in f' b),
      b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' x = if (f x) = b then (b, true) else ((f x), false) in f'), b);;

*)

(* changed spans
(7,13)-(7,67)
(7,24)-(7,26)
(7,56)-(7,58)
(7,71)-(7,75)
(8,6)-(8,7)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,41)-(3,47)
(3,41)-(3,55)
(3,48)-(3,55)
(3,49)-(3,50)
(6,2)-(6,8)
(6,2)-(8,8)
(7,4)-(8,8)
(7,5)-(7,76)
(7,13)-(7,67)
(7,18)-(7,67)
(7,52)-(7,67)
(7,71)-(7,73)
(7,71)-(7,75)
*)

(* all spans
(2,16)-(3,63)
(3,2)-(3,63)
(3,8)-(3,11)
(3,8)-(3,9)
(3,10)-(3,11)
(3,30)-(3,63)
(3,33)-(3,35)
(3,41)-(3,55)
(3,41)-(3,47)
(3,48)-(3,55)
(3,49)-(3,50)
(3,52)-(3,54)
(3,61)-(3,63)
(5,14)-(8,8)
(6,2)-(8,8)
(6,2)-(6,8)
(7,4)-(8,8)
(7,5)-(7,76)
(7,13)-(7,67)
(7,18)-(7,67)
(7,21)-(7,31)
(7,21)-(7,27)
(7,22)-(7,23)
(7,24)-(7,26)
(7,30)-(7,31)
(7,37)-(7,46)
(7,38)-(7,39)
(7,41)-(7,45)
(7,52)-(7,67)
(7,53)-(7,59)
(7,54)-(7,55)
(7,56)-(7,58)
(7,61)-(7,66)
(7,71)-(7,75)
(7,71)-(7,73)
(7,74)-(7,75)
(8,6)-(8,7)
*)
