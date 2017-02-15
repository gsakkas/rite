
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt = let res = f b in match b with | res -> b in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(7,13)-(7,53)
(7,23)-(7,26)
(7,30)-(7,53)
(7,52)-(7,53)
(7,57)-(7,73)
(7,65)-(7,69)
(7,71)-(7,72)
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
(4,53)-(4,54)
(7,2)-(7,73)
(7,13)-(7,53)
(7,30)-(7,53)
(7,52)-(7,53)
(7,57)-(7,63)
(7,57)-(7,73)
(7,64)-(7,73)
(7,65)-(7,69)
(7,71)-(7,72)
*)
