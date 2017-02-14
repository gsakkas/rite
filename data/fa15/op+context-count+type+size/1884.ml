
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
(6,9)-(6,65)
(6,16)-(6,19)
(6,37)-(6,43)
(6,37)-(6,50)
(6,44)-(6,50)
(6,45)-(6,46)
(6,48)-(6,49)
(6,58)-(6,64)
(6,62)-(6,63)
*)

(* type error slice
(3,2)-(3,65)
(3,8)-(3,9)
(3,8)-(3,11)
(3,28)-(3,65)
(3,28)-(3,65)
(3,45)-(3,51)
(3,45)-(3,58)
(3,52)-(3,58)
(3,53)-(3,54)
(3,56)-(3,57)
(3,64)-(3,65)
(6,2)-(6,8)
(6,2)-(6,65)
(6,9)-(6,65)
(6,9)-(6,65)
(6,9)-(6,65)
(6,9)-(6,65)
(6,9)-(6,65)
(6,16)-(6,17)
(6,16)-(6,19)
(6,37)-(6,43)
(6,37)-(6,50)
(6,44)-(6,50)
(6,45)-(6,46)
(6,58)-(6,64)
(6,62)-(6,63)
*)
