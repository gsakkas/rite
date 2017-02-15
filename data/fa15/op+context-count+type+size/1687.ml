
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) = wwhile (((wwhile (f, b)), b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(5,29)-(5,49)
(5,30)-(5,45)
(5,31)-(5,37)
(5,38)-(5,44)
(5,47)-(5,48)
(5,51)-(5,52)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,45)-(3,51)
(3,45)-(3,58)
(3,52)-(3,58)
(3,53)-(3,54)
(5,21)-(5,27)
(5,21)-(5,53)
(5,28)-(5,53)
(5,29)-(5,49)
*)
