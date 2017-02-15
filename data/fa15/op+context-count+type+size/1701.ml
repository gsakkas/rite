
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
(5,28)-(5,61)
(5,32)-(5,33)
(5,32)-(5,37)
(5,36)-(5,37)
(5,43)-(5,44)
(5,51)-(5,56)
(5,58)-(5,59)
*)

(* type error slice
(5,28)-(5,61)
(5,28)-(5,61)
(5,32)-(5,33)
(5,32)-(5,37)
(5,32)-(5,37)
(5,36)-(5,37)
(5,43)-(5,44)
(5,50)-(5,60)
(5,51)-(5,56)
(5,52)-(5,53)
(5,54)-(5,55)
(5,58)-(5,59)
*)
