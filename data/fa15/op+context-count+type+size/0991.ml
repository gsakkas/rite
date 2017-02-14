
let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (fun x  -> let b = f x in ((b, (b != x)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> let b = f x in (b, (b != x))), b);;

*)

(* changed spans
(5,30)-(5,72)
(5,40)-(5,72)
(5,57)-(5,67)
*)

(* type error slice
(3,47)-(3,53)
(3,47)-(3,60)
(3,55)-(3,60)
(5,22)-(5,28)
(5,22)-(5,72)
(5,30)-(5,72)
*)
