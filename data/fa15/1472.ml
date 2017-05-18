
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) = wwhile (if (f b) = b then b else (b, b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(5,28)-(5,61)
(5,32)-(5,37)
(5,32)-(5,41)
(5,40)-(5,41)
(5,47)-(5,48)
(5,54)-(5,60)
(5,58)-(5,59)
*)

(* type error slice
(5,28)-(5,61)
(5,28)-(5,61)
(5,47)-(5,48)
(5,54)-(5,60)
(5,58)-(5,59)
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
(5,14)-(5,61)
(5,21)-(5,61)
(5,21)-(5,27)
(5,28)-(5,61)
(5,32)-(5,41)
(5,32)-(5,37)
(5,33)-(5,34)
(5,35)-(5,36)
(5,40)-(5,41)
(5,47)-(5,48)
(5,54)-(5,60)
(5,55)-(5,56)
(5,58)-(5,59)
*)
