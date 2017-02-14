
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let fx x = if x = 0 then 0 else if x > 1 then x - 1 else x + 1 in
  wwhile ((fx b), f);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(7,3)-(8,20)
(7,10)-(7,65)
(7,14)-(7,65)
(7,17)-(7,18)
(7,17)-(7,22)
(7,21)-(7,22)
(7,28)-(7,29)
(7,35)-(7,65)
(7,38)-(7,39)
(7,38)-(7,43)
(7,42)-(7,43)
(7,49)-(7,50)
(7,49)-(7,54)
(7,53)-(7,54)
(7,60)-(7,61)
(7,60)-(7,65)
(7,64)-(7,65)
*)

(* type error slice
(3,13)-(3,14)
(3,13)-(3,16)
(4,43)-(4,49)
(4,43)-(4,55)
(4,51)-(4,52)
(4,51)-(4,55)
(7,3)-(8,20)
(7,10)-(7,65)
(7,14)-(7,65)
(7,28)-(7,29)
(8,3)-(8,9)
(8,3)-(8,20)
(8,12)-(8,14)
(8,12)-(8,16)
(8,12)-(8,20)
*)
