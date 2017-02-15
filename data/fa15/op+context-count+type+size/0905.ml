
let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let b = f b in (b, (b != b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((fun fixb  -> let b = f b in (b, (fixb != b))), b);;

*)

(* changed spans
(5,29)-(5,59)
(5,38)-(5,41)
(5,50)-(5,51)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,46)-(3,52)
(3,46)-(3,60)
(3,53)-(3,60)
(3,54)-(3,55)
(5,21)-(5,27)
(5,21)-(5,63)
(5,28)-(5,63)
(5,29)-(5,59)
(5,45)-(5,58)
*)
