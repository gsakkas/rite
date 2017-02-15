
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (1, 1) else (true, 1) in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, b) else (b, b) in wwhile (funt, b);;

*)

(* changed spans
(7,28)-(7,29)
(7,31)-(7,32)
(7,39)-(7,48)
(7,40)-(7,44)
(7,46)-(7,47)
(7,52)-(7,68)
*)

(* type error slice
(3,2)-(4,68)
(3,12)-(3,13)
(3,12)-(3,15)
(4,2)-(4,68)
(4,8)-(4,11)
(4,30)-(4,31)
(4,30)-(4,38)
(4,30)-(4,38)
(4,34)-(4,38)
(4,42)-(4,48)
(4,42)-(4,55)
(4,49)-(4,55)
(4,50)-(4,51)
(7,2)-(7,68)
(7,11)-(7,48)
(7,15)-(7,48)
(7,15)-(7,48)
(7,27)-(7,33)
(7,28)-(7,29)
(7,31)-(7,32)
(7,39)-(7,48)
(7,40)-(7,44)
(7,52)-(7,58)
(7,52)-(7,68)
(7,59)-(7,68)
(7,60)-(7,64)
*)
