
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let fs bs = if bs = 0 then 0 else if bs > 1 then bs - 1 else bs + 1 in
  wwhile ((fs true), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(7,2)-(8,23)
(7,9)-(7,69)
(7,14)-(7,69)
(7,17)-(7,19)
(7,17)-(7,23)
(7,22)-(7,23)
(7,29)-(7,30)
(7,36)-(7,69)
(7,39)-(7,41)
(7,39)-(7,45)
(7,44)-(7,45)
(7,51)-(7,53)
(7,51)-(7,57)
(7,56)-(7,57)
(7,63)-(7,65)
(7,63)-(7,69)
(7,68)-(7,69)
*)

(* type error slice
(7,2)-(8,23)
(7,9)-(7,69)
(7,17)-(7,19)
(7,17)-(7,23)
(7,17)-(7,23)
(7,22)-(7,23)
(8,10)-(8,19)
(8,11)-(8,13)
(8,14)-(8,18)
*)
