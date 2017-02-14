
let rec wwhile (f,b) =
  match f b with | (num,b00l) -> if not b00l then num else wwhile (f, num);;

let fixpoint (f,b) = wwhile ((fun x  -> let y = (f, x) in (y, (y != b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (num,b00l) -> if not b00l then num else wwhile (f, num);;

let fixpoint (f,b) = wwhile ((fun x  -> let y = f x in (y, (y != x))), b);;

*)

(* changed spans
(5,50)-(5,54)
(5,69)-(5,70)
*)

(* type error slice
(2,4)-(3,77)
(2,17)-(3,74)
(3,9)-(3,10)
(3,9)-(3,12)
(3,11)-(3,12)
(5,22)-(5,28)
(5,22)-(5,76)
(5,31)-(5,70)
(5,31)-(5,76)
(5,41)-(5,70)
(5,50)-(5,54)
(5,53)-(5,54)
(5,64)-(5,65)
(5,64)-(5,70)
(5,64)-(5,70)
(5,69)-(5,70)
(5,75)-(5,76)
*)
