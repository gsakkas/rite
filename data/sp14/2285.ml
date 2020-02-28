
let rec wwhile (f,b) =
  match f b with | (num,b00l) -> if not b00l then num else wwhile (f, num);;

let fixpoint (f,b) = wwhile ((fun x  -> let y = (f, x) in (y, (y != x))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (num,b00l) -> if not b00l then num else wwhile (f, num);;

let fixpoint (f,b) = wwhile ((fun x  -> let y = f x in (y, (y != x))), b);;

*)

(* changed spans
(5,49)-(5,55)
f x
AppG [VarG]

*)

(* type error slice
(5,41)-(5,72)
(5,49)-(5,55)
(5,53)-(5,54)
(5,63)-(5,71)
(5,64)-(5,65)
(5,69)-(5,70)
*)
