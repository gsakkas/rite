
let rec wwhile (f,b) =
  let (b',c') = f b in if not c' then b' else wwhile f b';;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if not c' then b' else wwhile (f, b');;

*)

(* changed spans
(3,47)-(3,58)
wwhile (f , b')
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(3,60)
(2,17)-(3,58)
(3,47)-(3,53)
(3,47)-(3,58)
(3,54)-(3,55)
*)
