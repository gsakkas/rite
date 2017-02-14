
let rec wwhile (f,b) =
  match f b with | (num,b00l) -> if not b00l then num else wwhile (f, num);;

let fixpoint (f,b) = wwhile ((fun x  -> let y = (f, x) in (y, (y != b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (num,b00l) -> if not b00l then num else wwhile (f, num);;

let fixpoint (f,b) = wwhile ((fun x  -> let y = f x in (y, (y != x))), b);;

*)

(* changed spans
(5,48)-(5,54)
(5,68)-(5,69)
*)

(* type error slice
(2,3)-(3,76)
(2,16)-(3,74)
(3,8)-(3,9)
(3,8)-(3,11)
(3,10)-(3,11)
(5,21)-(5,27)
(5,21)-(5,76)
(5,28)-(5,76)
(5,29)-(5,72)
(5,40)-(5,71)
(5,48)-(5,54)
(5,52)-(5,53)
(5,62)-(5,70)
(5,62)-(5,70)
(5,63)-(5,64)
(5,68)-(5,69)
(5,74)-(5,75)
*)
