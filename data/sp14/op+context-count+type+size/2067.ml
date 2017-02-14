
let rec wwhile (f,b) =
  match f b with | (num,b00l) -> if not b00l then num else wwhile (f, num);;

let fixpoint (f,b) = wwhile ((), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (num,b00l) -> if not b00l then num else wwhile (f, num);;

let fixpoint (f,b) = wwhile ((fun x  -> let y = f x in (y, (y != x))), b);;

*)

(* changed spans
(5,29)-(5,31)
(5,33)-(5,34)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,59)-(3,65)
(3,59)-(3,74)
(3,66)-(3,74)
(3,67)-(3,68)
(5,21)-(5,27)
(5,21)-(5,35)
(5,28)-(5,35)
(5,29)-(5,31)
*)
