
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile (((f b) = b), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(5,32)-(5,35)
(5,32)-(5,40)
(5,39)-(5,40)
(5,43)-(5,44)
*)

(* type error slice
(3,16)-(3,17)
(3,16)-(3,19)
(3,45)-(3,51)
(3,45)-(3,58)
(3,53)-(3,54)
(3,53)-(3,58)
(5,22)-(5,28)
(5,22)-(5,44)
(5,32)-(5,40)
(5,32)-(5,44)
*)
