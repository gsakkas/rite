
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
(7,2)-(8,71)
(7,12)-(7,15)
(8,2)-(8,71)
(8,5)-(8,6)
(8,5)-(8,10)
(8,9)-(8,10)
(8,16)-(8,17)
(8,23)-(8,71)
(8,26)-(8,31)
(8,30)-(8,31)
(8,37)-(8,38)
(8,37)-(8,42)
(8,41)-(8,42)
(8,48)-(8,49)
(8,48)-(8,71)
(8,52)-(8,71)
*)

(* type error slice
(8,52)-(8,71)
(8,53)-(8,54)
*)
