
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
(5,30)-(5,59)
(5,33)-(5,34)
(5,33)-(5,41)
(5,37)-(5,41)
(5,55)-(5,56)
(5,55)-(5,59)
(5,58)-(5,59)
*)

(* type error slice
(5,30)-(5,59)
(5,30)-(5,59)
(5,47)-(5,48)
(5,55)-(5,59)
(5,58)-(5,59)
*)
