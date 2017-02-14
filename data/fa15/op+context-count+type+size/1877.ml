
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) = wwhile (if (f b) = b then b else ((f b), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(5,30)-(5,64)
(5,34)-(5,37)
(5,34)-(5,42)
(5,41)-(5,42)
(5,48)-(5,49)
(5,57)-(5,58)
(5,57)-(5,60)
(5,57)-(5,64)
(5,63)-(5,64)
*)

(* type error slice
(5,30)-(5,64)
(5,30)-(5,64)
(5,48)-(5,49)
(5,57)-(5,64)
(5,63)-(5,64)
*)
