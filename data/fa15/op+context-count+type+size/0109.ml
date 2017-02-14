
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
(7,3)-(8,22)
(7,12)-(7,55)
(7,17)-(7,55)
(7,21)-(7,30)
(7,23)-(7,25)
(7,37)-(7,39)
(7,37)-(7,42)
(7,50)-(7,52)
(7,50)-(7,55)
(8,3)-(8,22)
*)

(* type error slice
(3,13)-(3,14)
(3,13)-(3,16)
(4,43)-(4,49)
(4,43)-(4,55)
(4,51)-(4,52)
(4,51)-(4,55)
(7,3)-(8,22)
(7,12)-(7,55)
(7,17)-(7,55)
(7,37)-(7,42)
(8,3)-(8,9)
(8,3)-(8,22)
(8,12)-(8,16)
(8,12)-(8,18)
(8,12)-(8,22)
*)
