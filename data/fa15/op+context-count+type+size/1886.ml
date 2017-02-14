
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile (match f b with | false  -> wwhile (f, b) | b -> (b, b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(6,11)-(6,64)
(6,17)-(6,20)
(6,38)-(6,44)
(6,38)-(6,50)
(6,46)-(6,47)
(6,46)-(6,50)
(6,49)-(6,50)
(6,60)-(6,64)
(6,63)-(6,64)
*)

(* type error slice
(3,3)-(3,66)
(3,9)-(3,10)
(3,9)-(3,12)
(3,29)-(3,66)
(3,29)-(3,66)
(3,46)-(3,52)
(3,46)-(3,58)
(3,54)-(3,55)
(3,54)-(3,58)
(3,57)-(3,58)
(3,65)-(3,66)
(6,3)-(6,9)
(6,3)-(6,64)
(6,11)-(6,64)
(6,11)-(6,64)
(6,11)-(6,64)
(6,11)-(6,64)
(6,11)-(6,64)
(6,17)-(6,18)
(6,17)-(6,20)
(6,38)-(6,44)
(6,38)-(6,50)
(6,46)-(6,47)
(6,46)-(6,50)
(6,60)-(6,64)
(6,63)-(6,64)
*)
