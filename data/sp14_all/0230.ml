
let rec wwhile (f,b) =
  let y = f b in match y with | (b',c') -> if c' then b' else f b';;


(* fix

let rec wwhile (f,b) =
  let y = f b in match y with | (b',c') -> if c' then b' else wwhile (f, b');;

*)

(* changed spans
(3,63)-(3,67)
wwhile (f , b')
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(3,3)-(3,67)
(3,11)-(3,12)
(3,11)-(3,14)
(3,18)-(3,67)
(3,24)-(3,25)
(3,44)-(3,67)
(3,55)-(3,57)
(3,63)-(3,64)
(3,63)-(3,67)
*)
