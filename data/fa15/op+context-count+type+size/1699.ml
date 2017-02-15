
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
(6,9)-(6,66)
(6,13)-(6,28)
(6,13)-(6,32)
(6,14)-(6,20)
(6,22)-(6,23)
(6,31)-(6,32)
(6,38)-(6,39)
(6,45)-(6,65)
(6,46)-(6,61)
(6,47)-(6,53)
(6,55)-(6,56)
(6,63)-(6,64)
*)

(* type error slice
(6,2)-(6,8)
(6,2)-(6,66)
(6,9)-(6,66)
(6,9)-(6,66)
(6,38)-(6,39)
(6,45)-(6,65)
(6,46)-(6,61)
(6,47)-(6,53)
(6,54)-(6,60)
(6,58)-(6,59)
(6,63)-(6,64)
*)
