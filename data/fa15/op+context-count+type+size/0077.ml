
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let fs bs = if bs = 0 then 0 else if bs > 1 then bs - 1 else bs + 1 in
  wwhile ((fs b true), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(7,3)-(8,25)
(7,10)-(7,70)
(7,15)-(7,70)
(7,18)-(7,20)
(7,18)-(7,24)
(7,23)-(7,24)
(7,30)-(7,31)
(7,37)-(7,70)
(7,40)-(7,42)
(7,40)-(7,46)
(7,45)-(7,46)
(7,52)-(7,54)
(7,52)-(7,58)
(7,57)-(7,58)
(7,64)-(7,66)
(7,64)-(7,70)
(7,69)-(7,70)
*)

(* type error slice
(7,3)-(8,25)
(7,10)-(7,70)
(7,15)-(7,70)
(7,30)-(7,31)
(8,12)-(8,14)
(8,12)-(8,21)
*)
