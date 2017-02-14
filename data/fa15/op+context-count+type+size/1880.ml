
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) = wwhile (if f = true then b else ((f b), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(5,30)-(5,63)
(5,33)-(5,34)
(5,33)-(5,41)
(5,37)-(5,41)
(5,47)-(5,48)
(5,56)-(5,59)
(5,62)-(5,63)
*)

(* type error slice
(5,30)-(5,63)
(5,30)-(5,63)
(5,33)-(5,34)
(5,33)-(5,41)
(5,33)-(5,41)
(5,37)-(5,41)
(5,47)-(5,48)
(5,56)-(5,57)
(5,56)-(5,59)
(5,56)-(5,63)
(5,62)-(5,63)
*)
