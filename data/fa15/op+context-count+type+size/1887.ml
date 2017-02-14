
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
(6,11)-(6,58)
(6,14)-(6,15)
(6,14)-(6,22)
(6,18)-(6,22)
(6,28)-(6,29)
(6,37)-(6,43)
(6,37)-(6,53)
(6,46)-(6,49)
(6,46)-(6,53)
(6,52)-(6,53)
(6,57)-(6,58)
*)

(* type error slice
(6,3)-(6,9)
(6,3)-(6,58)
(6,11)-(6,58)
(6,11)-(6,58)
(6,14)-(6,15)
(6,14)-(6,22)
(6,14)-(6,22)
(6,18)-(6,22)
(6,28)-(6,29)
(6,37)-(6,43)
(6,37)-(6,53)
(6,37)-(6,58)
(6,46)-(6,47)
(6,46)-(6,49)
(6,46)-(6,53)
(6,52)-(6,53)
(6,57)-(6,58)
*)
