
let rec wwhile (f,b) =
  let calc = f b in let (b',c') = calc in if c' then f b' else b';;


(* fix

let rec wwhile (f,b) =
  let calc = f b in let (b',c') = calc in if c' then wwhile (f, b') else b';;

*)

(* changed spans
(3,54)-(3,58)
wwhile (f , b')
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(3,3)-(3,66)
(3,14)-(3,15)
(3,14)-(3,17)
(3,21)-(3,66)
(3,35)-(3,39)
(3,43)-(3,66)
(3,54)-(3,55)
(3,54)-(3,58)
(3,64)-(3,66)
*)
