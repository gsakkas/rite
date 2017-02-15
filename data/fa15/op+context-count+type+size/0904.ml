
let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (fun x  -> let b = f x in ((b, (b != x)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> let b = f x in (b, (b != x))), b);;

*)

(* changed spans
(5,28)-(5,73)
(5,39)-(5,72)
(5,55)-(5,68)
*)

(* type error slice
(3,46)-(3,52)
(3,46)-(3,60)
(3,53)-(3,60)
(5,21)-(5,27)
(5,21)-(5,73)
(5,28)-(5,73)
*)
