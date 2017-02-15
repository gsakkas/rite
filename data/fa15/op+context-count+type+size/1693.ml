
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) = wwhile (if (f b) = b then true else (false, b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(5,28)-(5,68)
(5,32)-(5,37)
(5,32)-(5,41)
(5,40)-(5,41)
(5,47)-(5,51)
(5,58)-(5,63)
(5,65)-(5,66)
*)

(* type error slice
(3,45)-(3,51)
(3,45)-(3,58)
(3,52)-(3,58)
(5,21)-(5,27)
(5,21)-(5,68)
(5,28)-(5,68)
(5,28)-(5,68)
(5,47)-(5,51)
(5,57)-(5,67)
*)
