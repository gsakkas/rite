
let fphelper f b = if (f b) = b then (b, false) else ((f b), true);;

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) = wwhile (fphelper, b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fun z  -> let b = f z in (b, (b != z))), b);;

*)

(* changed spans
(7,30)-(7,38)
fun z ->
  (let b = f z in (b , b <> z))
LamG VarPatG (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

*)

(* type error slice
(2,4)-(2,69)
(2,14)-(2,67)
(2,16)-(2,67)
(5,3)-(5,74)
(5,17)-(5,18)
(5,17)-(5,20)
(5,60)-(5,66)
(5,60)-(5,74)
(5,67)-(5,74)
(5,68)-(5,69)
(7,22)-(7,28)
(7,22)-(7,42)
(7,29)-(7,42)
(7,30)-(7,38)
*)
