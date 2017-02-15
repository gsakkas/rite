
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
(5,28)-(5,70)
(5,32)-(5,37)
(5,32)-(5,44)
(5,40)-(5,44)
(5,50)-(5,51)
(5,57)-(5,69)
(5,58)-(5,65)
(5,59)-(5,60)
(5,61)-(5,62)
(5,67)-(5,68)
*)

(* type error slice
(5,32)-(5,37)
(5,32)-(5,44)
(5,32)-(5,44)
(5,33)-(5,34)
(5,40)-(5,44)
(5,58)-(5,65)
(5,59)-(5,60)
(5,61)-(5,62)
*)
