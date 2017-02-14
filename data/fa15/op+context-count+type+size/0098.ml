
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt = let res = f b in match b with | res -> b in wwhile (funt, f);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(7,14)-(7,54)
(7,24)-(7,27)
(7,31)-(7,54)
(7,53)-(7,54)
(7,58)-(7,73)
(7,66)-(7,70)
(7,72)-(7,73)
*)

(* type error slice
(3,3)-(4,69)
(3,13)-(3,14)
(3,13)-(3,16)
(4,3)-(4,69)
(4,9)-(4,12)
(4,43)-(4,49)
(4,43)-(4,55)
(4,51)-(4,52)
(4,51)-(4,55)
(4,54)-(4,55)
(7,3)-(7,73)
(7,14)-(7,54)
(7,24)-(7,25)
(7,24)-(7,27)
(7,26)-(7,27)
(7,31)-(7,54)
(7,53)-(7,54)
(7,58)-(7,64)
(7,58)-(7,73)
(7,66)-(7,70)
(7,66)-(7,73)
(7,72)-(7,73)
*)
