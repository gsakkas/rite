
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b1 = if (f b1) = b then (b1, b) else (b1, b) in
  wwhile ((funt b), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt x = (2, ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(7,2)-(8,22)
(7,11)-(7,55)
(7,16)-(7,55)
(7,19)-(7,29)
(7,22)-(7,24)
(7,35)-(7,42)
(7,36)-(7,38)
(7,48)-(7,55)
(7,49)-(7,51)
(8,2)-(8,22)
*)

(* type error slice
(3,12)-(3,13)
(3,12)-(3,15)
(4,42)-(4,48)
(4,42)-(4,55)
(4,49)-(4,55)
(4,50)-(4,51)
(7,2)-(8,22)
(7,11)-(7,55)
(7,16)-(7,55)
(7,35)-(7,42)
(8,2)-(8,8)
(8,2)-(8,22)
(8,9)-(8,22)
(8,10)-(8,18)
(8,11)-(8,15)
*)
