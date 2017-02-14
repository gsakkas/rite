
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) = wwhile (if f = b then b else ((f b), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(5,30)-(5,60)
(5,33)-(5,34)
(5,33)-(5,38)
(5,37)-(5,38)
(5,44)-(5,45)
(5,53)-(5,56)
(5,59)-(5,60)
*)

(* type error slice
(5,30)-(5,60)
(5,30)-(5,60)
(5,33)-(5,34)
(5,33)-(5,38)
(5,33)-(5,38)
(5,37)-(5,38)
(5,44)-(5,45)
(5,53)-(5,54)
(5,53)-(5,56)
(5,53)-(5,60)
(5,55)-(5,56)
(5,59)-(5,60)
*)
