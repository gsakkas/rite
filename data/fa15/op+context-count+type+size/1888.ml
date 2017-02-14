
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile (if (wwhile (f, b)) = b then b else ((wwhile (f, b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(6,11)-(6,65)
(6,15)-(6,21)
(6,15)-(6,27)
(6,15)-(6,33)
(6,23)-(6,24)
(6,32)-(6,33)
(6,39)-(6,40)
(6,48)-(6,54)
(6,48)-(6,60)
(6,48)-(6,65)
(6,56)-(6,57)
(6,64)-(6,65)
*)

(* type error slice
(6,3)-(6,9)
(6,3)-(6,65)
(6,11)-(6,65)
(6,11)-(6,65)
(6,39)-(6,40)
(6,48)-(6,54)
(6,48)-(6,60)
(6,48)-(6,65)
(6,56)-(6,60)
(6,59)-(6,60)
(6,64)-(6,65)
*)
