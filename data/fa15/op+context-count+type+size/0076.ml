
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let res = f b in
  if b = 0 then 0 else if b > 1 then b - 1 else b + (1 wwhile (f, res));;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(7,3)-(8,70)
(7,13)-(7,16)
(8,3)-(8,70)
(8,6)-(8,7)
(8,6)-(8,11)
(8,10)-(8,11)
(8,17)-(8,18)
(8,24)-(8,70)
(8,27)-(8,32)
(8,31)-(8,32)
(8,38)-(8,39)
(8,38)-(8,43)
(8,42)-(8,43)
(8,49)-(8,50)
(8,49)-(8,70)
(8,54)-(8,70)
*)

(* type error slice
(8,54)-(8,55)
(8,54)-(8,70)
*)
