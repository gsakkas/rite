
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile (if f = true then b else ((wwhile ((f b), b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(6,9)-(6,59)
(6,13)-(6,14)
(6,13)-(6,21)
(6,17)-(6,21)
(6,27)-(6,28)
(6,35)-(6,54)
(6,36)-(6,42)
(6,43)-(6,53)
(6,44)-(6,49)
(6,51)-(6,52)
(6,56)-(6,57)
*)

(* type error slice
(6,2)-(6,8)
(6,2)-(6,59)
(6,9)-(6,59)
(6,9)-(6,59)
(6,13)-(6,14)
(6,13)-(6,21)
(6,13)-(6,21)
(6,17)-(6,21)
(6,27)-(6,28)
(6,34)-(6,58)
(6,35)-(6,54)
(6,36)-(6,42)
(6,43)-(6,53)
(6,44)-(6,49)
(6,45)-(6,46)
(6,51)-(6,52)
(6,56)-(6,57)
*)
