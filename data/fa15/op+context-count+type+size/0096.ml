
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let fx b = if b = 0 then 0 else if b > 1 then b - 1 else b + 1 in
  wwhile (fx, f);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(7,2)-(8,16)
(7,16)-(7,17)
(7,16)-(7,21)
(7,20)-(7,21)
(7,27)-(7,28)
(7,34)-(7,64)
(7,37)-(7,38)
(7,37)-(7,42)
(7,41)-(7,42)
(7,48)-(7,53)
(7,52)-(7,53)
(7,59)-(7,60)
(7,59)-(7,64)
(7,63)-(7,64)
*)

(* type error slice
(3,2)-(4,68)
(3,12)-(3,13)
(3,12)-(3,15)
(4,2)-(4,68)
(4,8)-(4,11)
(4,42)-(4,48)
(4,42)-(4,55)
(4,49)-(4,55)
(4,50)-(4,51)
(7,2)-(8,16)
(7,9)-(7,64)
(7,13)-(7,64)
(7,27)-(7,28)
(8,2)-(8,8)
(8,2)-(8,16)
(8,9)-(8,16)
(8,10)-(8,12)
*)
