
let rec wwhile (f,b) =
  match f b with | (num,b00l) -> if not b00l then num else wwhile (f, num);;

let fixpoint (f,b) = wwhile ((), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (num,b00l) -> if not b00l then num else wwhile (f, num);;

let fixpoint (f,b) = wwhile ((fun x  -> let y = f x in (y, (y != x))), b);;

*)

(* changed spans
(5,30)-(5,32)
(5,34)-(5,35)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,11)-(3,12)
(3,60)-(3,66)
(3,60)-(3,74)
(3,68)-(3,69)
(3,68)-(3,74)
(3,71)-(3,74)
(5,22)-(5,28)
(5,22)-(5,35)
(5,30)-(5,32)
(5,30)-(5,35)
(5,34)-(5,35)
*)
