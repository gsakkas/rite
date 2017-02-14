
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) = wwhile (if f = true then b else ((wwhile (f, b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(5,30)-(5,73)
(5,33)-(5,34)
(5,37)-(5,41)
(5,56)-(5,62)
(5,56)-(5,68)
(5,56)-(5,73)
(5,64)-(5,65)
(5,72)-(5,73)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,46)-(3,52)
(3,46)-(3,58)
(3,54)-(3,55)
(3,54)-(3,58)
(5,30)-(5,73)
(5,30)-(5,73)
(5,33)-(5,34)
(5,33)-(5,41)
(5,33)-(5,41)
(5,37)-(5,41)
(5,47)-(5,48)
(5,56)-(5,62)
(5,56)-(5,68)
(5,56)-(5,73)
(5,64)-(5,65)
(5,64)-(5,68)
(5,72)-(5,73)
*)
