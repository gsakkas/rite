
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((wwhile (f, b)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(5,31)-(5,37)
(5,31)-(5,43)
(5,39)-(5,40)
(5,39)-(5,43)
(5,47)-(5,48)
*)

(* type error slice
(3,3)-(3,58)
(3,16)-(3,17)
(3,16)-(3,19)
(3,23)-(3,58)
(3,23)-(3,58)
(3,37)-(3,39)
(3,45)-(3,51)
(3,45)-(3,58)
(3,53)-(3,54)
(3,53)-(3,58)
(5,22)-(5,28)
(5,22)-(5,48)
(5,31)-(5,37)
(5,31)-(5,43)
(5,31)-(5,48)
*)
