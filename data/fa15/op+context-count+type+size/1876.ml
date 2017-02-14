
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
(5,32)-(5,38)
(5,32)-(5,44)
(5,32)-(5,49)
(5,40)-(5,44)
(5,48)-(5,49)
(5,52)-(5,53)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,46)-(3,52)
(3,46)-(3,58)
(3,54)-(3,55)
(3,54)-(3,58)
(5,22)-(5,28)
(5,22)-(5,53)
(5,32)-(5,49)
(5,32)-(5,53)
*)
