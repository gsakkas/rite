
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) = wwhile (if (f b) = true then b else ((f f b), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(5,30)-(5,69)
(5,34)-(5,37)
(5,34)-(5,45)
(5,41)-(5,45)
(5,51)-(5,52)
(5,60)-(5,61)
(5,60)-(5,65)
(5,60)-(5,69)
(5,62)-(5,63)
(5,68)-(5,69)
*)

(* type error slice
(5,34)-(5,35)
(5,34)-(5,37)
(5,34)-(5,45)
(5,34)-(5,45)
(5,41)-(5,45)
(5,60)-(5,61)
(5,60)-(5,65)
(5,62)-(5,63)
*)
