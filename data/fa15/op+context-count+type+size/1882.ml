
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
(5,30)-(5,67)
(5,34)-(5,37)
(5,34)-(5,42)
(5,41)-(5,42)
(5,48)-(5,52)
(5,59)-(5,64)
*)

(* type error slice
(3,46)-(3,52)
(3,46)-(3,58)
(3,54)-(3,58)
(5,22)-(5,28)
(5,22)-(5,67)
(5,30)-(5,67)
(5,30)-(5,67)
(5,48)-(5,52)
(5,59)-(5,67)
*)
