
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let fs bs = if bs = 0 then 0 else if bs > 1 then bs - 1 else bs + 1 in
  wwhile ((fs b), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(7,2)-(8,20)
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
(3,12)-(3,13)
(3,12)-(3,15)
(4,42)-(4,48)
(4,42)-(4,55)
(4,49)-(4,55)
(4,50)-(4,51)
(7,2)-(8,20)
(7,9)-(7,69)
(7,14)-(7,69)
(7,29)-(7,30)
(8,2)-(8,8)
(8,2)-(8,20)
(8,9)-(8,20)
(8,10)-(8,16)
(8,11)-(8,13)
*)
