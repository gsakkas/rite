
let rec wwhile (f,b) =
  let calc = f b in let (b',c') = calc in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let f x = wwhile (f, x) in f b), b);;


(* fix

let rec wwhile (f,b) =
  let calc = f b in let (b',c') = calc in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> (x, (x = b))), b);;

*)

(* changed spans
(5,30)-(5,62)
fun x -> (x , x = b)
LamG VarPatG (TupleG (fromList [EmptyG]))

*)

(* type error slice
(3,3)-(3,76)
(3,14)-(3,15)
(3,14)-(3,17)
(3,21)-(3,76)
(3,35)-(3,39)
(3,43)-(3,76)
(3,54)-(3,60)
(3,54)-(3,68)
(3,61)-(3,68)
(3,62)-(3,63)
(3,74)-(3,76)
(5,22)-(5,28)
(5,22)-(5,66)
(5,29)-(5,66)
(5,30)-(5,62)
(5,37)-(5,54)
(5,41)-(5,47)
(5,41)-(5,54)
(5,58)-(5,59)
(5,58)-(5,61)
*)
