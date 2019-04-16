
let rec wwhile (f,b) = match f b with | (b',c') -> if c' then f b' else b';;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

*)

(* changed spans
(2,63)-(2,67)
wwhile (f , b')
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(2,24)-(2,75)
(2,30)-(2,31)
(2,30)-(2,33)
(2,52)-(2,75)
(2,63)-(2,64)
(2,63)-(2,67)
(2,73)-(2,75)
*)
