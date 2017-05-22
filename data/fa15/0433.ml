
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let rec funt x = ((funt b), ((f b) = b)) in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let rec funt x = ((f b), ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(7,21)-(7,25)
*)

(* type error slice
(7,2)-(7,62)
(7,15)-(7,42)
(7,19)-(7,42)
(7,20)-(7,28)
(7,21)-(7,25)
*)

(* all spans
(2,16)-(4,68)
(3,2)-(4,68)
(3,12)-(3,15)
(3,12)-(3,13)
(3,14)-(3,15)
(4,2)-(4,68)
(4,8)-(4,11)
(4,30)-(4,38)
(4,30)-(4,31)
(4,34)-(4,38)
(4,42)-(4,55)
(4,42)-(4,48)
(4,49)-(4,55)
(4,50)-(4,51)
(4,53)-(4,54)
(4,67)-(4,68)
(6,14)-(7,62)
(7,2)-(7,62)
(7,15)-(7,42)
(7,19)-(7,42)
(7,20)-(7,28)
(7,21)-(7,25)
(7,26)-(7,27)
(7,30)-(7,41)
(7,31)-(7,36)
(7,32)-(7,33)
(7,34)-(7,35)
(7,39)-(7,40)
(7,46)-(7,62)
(7,46)-(7,52)
(7,53)-(7,62)
(7,54)-(7,58)
(7,60)-(7,61)
*)
