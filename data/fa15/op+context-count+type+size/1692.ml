
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) = wwhile (if (f b) = b then b else (false, b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(5,28)-(5,65)
(5,32)-(5,37)
(5,32)-(5,41)
(5,40)-(5,41)
(5,47)-(5,48)
(5,54)-(5,64)
(5,55)-(5,60)
(5,62)-(5,63)
*)

(* type error slice
(5,28)-(5,65)
(5,28)-(5,65)
(5,47)-(5,48)
(5,54)-(5,64)
(5,62)-(5,63)
*)
