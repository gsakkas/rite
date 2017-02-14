
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) = wwhile ((wwhile (f, b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(5,31)-(5,37)
(5,31)-(5,43)
(5,39)-(5,43)
(5,47)-(5,48)
*)

(* type error slice
(3,3)-(3,66)
(3,9)-(3,10)
(3,9)-(3,12)
(3,29)-(3,66)
(3,29)-(3,66)
(3,46)-(3,52)
(3,46)-(3,58)
(3,54)-(3,55)
(3,54)-(3,58)
(3,65)-(3,66)
(5,22)-(5,28)
(5,22)-(5,48)
(5,31)-(5,37)
(5,31)-(5,43)
(5,31)-(5,48)
*)
