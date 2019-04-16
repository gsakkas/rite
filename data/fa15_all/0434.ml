
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let rec funt x = ((funt f b), ((f b) = b)) in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let rec funt x = ((f b), ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(7,21)-(7,31)
f b
AppG (fromList [VarG])

*)

(* type error slice
(3,3)-(4,69)
(3,13)-(3,14)
(3,13)-(3,16)
(4,3)-(4,69)
(4,9)-(4,12)
(4,43)-(4,49)
(4,43)-(4,56)
(4,50)-(4,56)
(4,51)-(4,52)
(7,3)-(7,65)
(7,16)-(7,45)
(7,20)-(7,45)
(7,21)-(7,31)
(7,22)-(7,26)
(7,49)-(7,55)
(7,49)-(7,65)
(7,56)-(7,65)
(7,57)-(7,61)
*)
