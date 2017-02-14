
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) = wwhile (if (f b) = b then b else (b, b));;


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
(5,34)-(5,37)
(5,34)-(5,42)
(5,41)-(5,42)
(5,48)-(5,49)
(5,56)-(5,57)
(5,56)-(5,60)
(5,59)-(5,60)
*)

(* type error slice
(5,30)-(5,60)
(5,30)-(5,60)
(5,48)-(5,49)
(5,56)-(5,60)
(5,59)-(5,60)
*)
