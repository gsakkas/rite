
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) = wwhile (if true then b else ((f b), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(5,28)-(5,60)
(5,32)-(5,36)
(5,42)-(5,43)
(5,50)-(5,55)
(5,57)-(5,58)
*)

(* type error slice
(5,28)-(5,60)
(5,42)-(5,43)
(5,49)-(5,59)
(5,57)-(5,58)
*)

(* all spans
(2,16)-(3,65)
(3,2)-(3,65)
(3,8)-(3,11)
(3,8)-(3,9)
(3,10)-(3,11)
(3,28)-(3,65)
(3,31)-(3,39)
(3,31)-(3,32)
(3,35)-(3,39)
(3,45)-(3,58)
(3,45)-(3,51)
(3,52)-(3,58)
(3,53)-(3,54)
(3,56)-(3,57)
(3,64)-(3,65)
(5,14)-(5,60)
(5,21)-(5,60)
(5,21)-(5,27)
(5,28)-(5,60)
(5,32)-(5,36)
(5,42)-(5,43)
(5,49)-(5,59)
(5,50)-(5,55)
(5,51)-(5,52)
(5,53)-(5,54)
(5,57)-(5,58)
*)
