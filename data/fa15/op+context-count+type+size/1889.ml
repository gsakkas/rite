
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) = wwhile ((wwhile (f, b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(5,29)-(5,44)
(5,30)-(5,36)
(5,37)-(5,43)
(5,46)-(5,47)
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
(3,64)-(3,65)
(5,21)-(5,27)
(5,21)-(5,48)
(5,28)-(5,48)
(5,29)-(5,44)
(5,30)-(5,36)
*)
