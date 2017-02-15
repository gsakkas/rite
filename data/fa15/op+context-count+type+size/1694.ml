
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) = wwhile (if f = true then b else (f, b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(5,28)-(5,60)
(5,32)-(5,33)
(5,32)-(5,40)
(5,36)-(5,40)
(5,53)-(5,59)
(5,54)-(5,55)
(5,57)-(5,58)
*)

(* type error slice
(5,28)-(5,60)
(5,28)-(5,60)
(5,46)-(5,47)
(5,53)-(5,59)
(5,57)-(5,58)
*)
