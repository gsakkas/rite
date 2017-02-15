
let rec wwhile (f,b) =
  match f b with | (num,b00l) -> if not b00l then num else wwhile (f, num);;

let fixpoint (f,b) = wwhile ((fun x  -> let y = (f, x) in (y, (y != x))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (num,b00l) -> if not b00l then num else wwhile (f, num);;

let fixpoint (f,b) = wwhile ((fun x  -> let y = f x in (y, (y != x))), b);;

*)

(* changed spans
(5,48)-(5,54)
*)

(* type error slice
(5,40)-(5,71)
(5,48)-(5,54)
(5,52)-(5,53)
(5,62)-(5,70)
(5,62)-(5,70)
(5,63)-(5,64)
(5,68)-(5,69)
*)
