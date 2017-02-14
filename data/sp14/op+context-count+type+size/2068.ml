
let rec wwhile (f,b) =
  match f b with | (num,b00l) -> if not b00l then num else wwhile (f, num);;

let fixpoint (f,b) = wwhile (b, b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (num,b00l) -> if not b00l then num else wwhile (f, num);;

let fixpoint (f,b) = wwhile ((fun x  -> let y = f x in (y, (y != x))), b);;

*)

(* changed spans
(5,29)-(5,30)
(5,32)-(5,33)
*)

(* type error slice
(3,2)-(3,74)
(3,8)-(3,9)
(3,8)-(3,11)
(3,59)-(3,65)
(3,59)-(3,74)
(3,66)-(3,74)
(3,67)-(3,68)
(3,70)-(3,73)
(5,21)-(5,27)
(5,21)-(5,34)
(5,28)-(5,34)
(5,29)-(5,30)
(5,32)-(5,33)
*)
